#
# Author::  Achim Rosenhagen (<a.rosenhagen@ffuenf.de>)
# Cookbook Name:: dotdeb
# Recipe:: default
#
# Copyright 2012, Achim Rosenhagen
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if node['platform'] == 'debian'
	if node.platform_version.to_f >= 5.0
		apt_repository "dotdeb" do
			uri "http://packages.dotdeb.org"
			distribution "stable"
			components ['all']
			key "http://www.dotdeb.org/dotdeb.gpg"
			action :add
		end
	else
		apt_repository "dotdeb" do
			uri "http://packages.dotdeb.org"
			distribution "oldstable"
			components ['all']
			key "http://www.dotdeb.org/dotdeb.gpg"
			action :add
		end
	end
	if node['php-fpm']['php54']
		apt_repository "dotdeb-php54" do
			uri "http://packages.dotdeb.org"
			distribution "squeeze-php54"
			components ['all']
			key "http://www.dotdeb.org/dotdeb.gpg"
			action :add
		end
	else
		apt_repository "dotdeb-php53" do
			uri "http://php53.dotdeb.org"
			distribution "oldstable"
			components ['all']
			key "http://www.dotdeb.org/dotdeb.gpg"
			action :add
		end
	end
end