# Version 2.0.3 (2020-01-06)

- Internal: Rubocop update and styling fixes
- Added Project#delete_envvar to remove envvars (@lacostenycoder)

# Version 2.0.2 (2018-01-28)

House cleaning update, no changes to API or new endpoints added.

- Upgrade Yard development dependency due to vulnerability
- Add CI workflow for building against latest ruby versions

# Version 2.0.1 (2017-08-22)

* Add params to `Project#recent_builds_branch`

# Version 2.0.0 (2017-05-26)

## Breaking Changes

> Please use branch v-1.1.0 or tag v1.1.0 for previous 1.x version of
> the gem until you can update to the latest version. 1.x will not be supported
> in the longer term.

* Remove all deprecated class methods in favor of instance API resources classes
  * Please look at the documentation in the README or rubydoc on changes. An example of a change might be:

    ```ruby
    #
    # Old way of getting recent builds
    #
    builds = CircleCi::Project.recent_builds 'mtchavez', 'circleci'

    #
    # New way with a project object
    #
    project = CircleCi::Project.new 'mtchavez', 'circleci'
    builds = project.recent_builds

    # Can interact with other calls for the project
    project.build # make a new build
    project.settings # get settings
    project.clear_cache #clear the cache
    ```



## Other changes

* Update default API version to `v1.1`
* Implement `:vcs_type` API endpoints for `v1.1` i.e. `/api/project/:vcs_type/:username/:project/follow`

# Version 1.1.0 - (2017-03-20)

**Breaking Changes**

* Deprecate all the class methods in favor of classes for object approach
* `Project#build_branch` build parameters changed how they are
   passed in. You now need to pass them as the API expects them to be
   nested under the `build_parameters` key.

   ```ruby
   # Passing build parameters in the post body
   build_params = { build_parameters: { 'MY_TOKEN' => '123asd123asd' } }
   res = CircleCi::Project.build_branch 'username', 'reponame', 'branch', {}, build_params
   ```

# Version 1.0.3 - (2016-09-30)

* Fix requiring of `forwardable`

# Version 1.0.2 - (2016-09-24)

* Fix requiring of `openssl` - fixed in [#81](https://github.com/mtchavez/circleci/pull/81)

# Version 1.0.1 - (2016-09-14)

* Fix regression of `CircleCi::Project.enable` HTTP method changing incorrectly to a `delete`

# Version 1.0 - (2016-08-31)

**Breaking Changes**

* CircleCi::Project#envvars renamed to envvar for consistency with API endpoint
* Deprecated CircleCi::Project#envvars
* Upgrade rspec to 3.5
* Require minimum ruby version `>= 2.0.0`
* Remove `RestClient` as a dependency and replace with stdlib `Net::HTTP`
* Add params and body as inputs to `CircleCi::Project#build_branch`
* Add configuration for proxy hosts

# Version 0.2.3 - (2016-03-12)

* CircleCi::RecentBuilds#get - Replaces old CircleCi#organization endpoint to return all recent builds
* Remove CircleCi#organization for CircleCi::RecentBuilds#get
* CircleCi::Project#recent_builds - Takes params to supply limit, offset, and filter query params
* RestClient::Request overrides or configuration per request is configurable via Config.request_overrides hash

# Version 0.2.2 - (2016-02-26)

* Fix regression from [#50](https://github.com/mtchavez/circleci/pull/50) which broke [#10](https://github.com/mtchavez/circleci/pull/10)
* Make host and port configurable for people using Enterprise CircleCi
* CircleCi::Project#envvar – Get environment variables for a project
* CircleCi::Project#set_envvar – Set environment variable for a project

# Version 0.2.1 - (2016-02-21)

**Yanked from rubygems**

# Version 0.2.0 - (2015-12-06)

* CircleCi::User#heroku_key – Add your Heroku API key to your account
* CircleCi::Project#ssh_key – Add an SSH key to a project
* CircleCi::Project#build_ssh_key – Add an SSH key to a project build
* CircleCi::Project#new_checkout_key – Add a checkout key to a project
* CircleCi::Project#list_checkout_keys – Get all checkout keys for a project
* CircleCi::Project#get_checkout_key – Get a project checkout key
* CircleCi::Project#delete_checkout_key – Delete a project checkout key

# Version 0.1.1 - (2015-3-29)

* Cancel a build merged in [#15](https://github.com/mtchavez/circleci/pull/15) from [@etiennebarrie](https://github.com/etiennebarrie)
* Tests endpoint for a build. Will return all tests ran with metadata.
  * Currently experimental tests endpoint needs to be turned on in Experimental Settings

# Version 0.1.0 - (2014-11-4)

* Loosen `rest-client` dependency to `~> 1.6`

# Version 0.0.9 - (2014-11-4)

* Deprecate `CircleCi::Response#parsed_body` to not use `hashie` gem

# Version 0.0.8 - (2014-11-4)

* Support [parameterized builds](https://circleci.com/docs/parameterized-builds)
  * Thanks to [@dlitvakb](https://github.com/dlitvakb) merged in [#15](https://github.com/mtchavez/circleci/pull/15)

# Version 0.0.7 - (2014-8-1)

* Add method to build specific branch of project - Thanks to [@hwartig](https://github.com/hwartig)

  * CircleCi::Project#build_branch - Triggers build for specific branch of project

# Version 0.0.6 - (2014-6-8)

* New hidden endpoints added to API - Thanks to [@EiNSTeiN-](https://github.com/EiNSTeiN-)

  * CircleCi::Project#build - Build the latest master push for this project
  * CircleCi::Project#enable - Enable a project in CircleCI
  * CircleCi::Project#follow - Follow a project in CircleCI
  * CircleCi::Project#unfollow - Unfollow a project in CircleCI
  * CircleCi::Project#settings - Get project configuration

# Version 0.0.3 - (2014-1-29)

* [Build artifacts](https://github.com/mtchavez/circleci/pull/3) added

# Version 0.0.2 - (2014-1-21)

* [Branch builds endpoint](https://github.com/mtchavez/circleci/pull/1)
* Ruby 2.0.0 in Gemfile
* More documentation

# Version 0.0.1 - (2013-4-16)

* Add basic endpoints
