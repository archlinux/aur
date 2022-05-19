# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.2.2] - 2019-10-07
### Fixed
* Reverted the move to using setuptools-scm as it's [not actually meant to be
  used in the package code, only in setup.py](https://github.com/pypa/setuptools_scm/issues/354#issuecomment-519407730).
  setuptools-scm was causing an `LookupError: setuptools-scm was unable to detect version` error

## [2.2.1] - 2019-10-07
### Added
* Mozilla code of conduct
* Long description to setup.py containing README
* End to end GitHub unit test and tox testing with pytest
* Integration with Travis CI

### Changed
* Moved to SCM (git) driven version instead of a hard coded one
* VERSION constant from semver list (e.g. [2, 2, 1]) to string version (e.g. 2.2.1)

### Removed
* mock module to avoid collision with builtin mock module
* STR_VERSION constant

### Fixed
* TypeError when paginate is `True` and `sleep_on_ratelimit` is the default (#66 by [@huma23](https://github.com/huma23)) 

## [2.2.0] - 2019-01-16
### Added
* GitHub pagination support, which can be enabled
* GitHub rate limiting support, enabled by default

### Changed
* Changelog format changed to keepachangelog

## [2.1] - 2018-04-13

* Support XML de-serialization. (pick from [next-xml])
* Request body content-type serialization & charset encoding

[next-xml]: 3d373435c8110612cad061e9a9b31a7a1abd752c

## [2.0] - 2016-01-16

* Features:
    - Setup.py, for easy installation (Marcos Hernández)
    - Legit Python package
    - `url_prefix`: Ability to add an always-on prefix to the url for an API
* Bugfixes:
    - Use `application/octet-stream` for unknown media type
    - Spell 'GitHub' correctly

## [1.3] - 2015-08-31

A stable branch, with a lot of bug fixes! (Thanks to all who
contributed!)

* Feature: Unit tests (Uriel Corfa, Joachim Durchholz)
* Grown-up Incomplete-request error message (Joachim Durchholz)
* bug: PATCH method (ala)
* bug: Allow using auth tokens without a username (Uriel Corfa)
* bug: Set content-type to JSON when sending a JSON request
  (Jens Timmerman)

## [1.2] - 2014-06-14

* Revamp the internals, adding extensibility and flexibility. Meanwhile,
  the external API (i.e. via the GitHub class) is entirely unchanged

* New test-suite. It is ad-hoc and primitive, but effective

* Generic support for other REST web services

    - New top-level class (API)
    - GitHub is now a subclass of the API class, and is the model for
      creating new subclasses
    - Facebook and SalesForce subclasses created, allowing (basic)
      access to these web services

## [1.1.1] - 2014-06-11
* bug: Ensure Client.auth_header is always defined
* bug: Python-3 support for password authentication 

## [1.1] - 2014-06-06

* Includes the version in the user-agent string

## 1.0 - 2014-06-06

* Has a version number. (Yippie!)
* First more-or-less stable version

[Unreleased]: https://github.com/mozilla/agithub/compare/v2.2.2...HEAD
[2.2.2]: https://github.com/mozilla/agithub/compare/v2.2.1...v2.2.2
[2.2.1]: https://github.com/mozilla/agithub/compare/v2.2.0...v2.2.1
[2.2.0]: https://github.com/mozilla/agithub/compare/v2.1...v2.2.0
[2.1]: https://github.com/mozilla/agithub/compare/v2.0...v2.1
[2.0]: https://github.com/mozilla/agithub/compare/v1.3...v2.0
[1.3]: https://github.com/mozilla/agithub/compare/v1.2...v1.3
[1.2]: https://github.com/mozilla/agithub/compare/v1.1.1...v1.2
[1.1.1]: https://github.com/mozilla/agithub/compare/v1.1...v1.1.1
[1.1]: https://github.com/mozilla/agithub/compare/v1.0...v1.1
