# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).


## [1.4.6]
### Fixed
- default base_path was set to None instead of ''
- retry_backoff should be set to a float instead on integer

### Updated
- Testing suite converted to responses from VCR.
- Updated CI pipeline

### Added
- Python 3.10 now supported #7
- Added wheel support to pypi distribution #5

## [1.4.5]
### Fixed
- Content-Type header value is not handled in a case-insensitive manner


## [1.4.4]
### Changed
- Refactored json conversion into the format_json_response utility


## [1.4.3]
### Added
- `_conv_json`, `_box`, and `_box_attrs` can now be specified at the endpoint level as well.

### Updated
- Regex patterns within the check function now conform to PEP8
- Session attributes are now typed.


## [1.4.2]
### Added
- `conv_json` parameter in the session now handles automated conversion of responses to JSON with the same overloading as the `box` parameter supports.

### Updated
- Code underwent a reformatting exercise to follow flake8 && pylinting recommendations.  accepted exceptions are now noted in the code.
- Code is now 100% tested


## [1.4.1]
### Fixed
- Retry-After header value wasn't being recast as an integer.


## [1.4.0]
### Changed
- RESTfly now has typing support

### Updated
- Additional testing
- pipeline now runs flake8 checks as well to catch obvious errors.


## [1.3.6]
### Changed
- Pushed SSL verification into the indifidual requests as per https://github.com/psf/requests/issues/3829

### Added
- check util now support Arrow type checking as well.


## [1.3.5]
### Changed
- Iterator will now set the page_count and increment the num_pages **after** calling _get_page()

## [1.3.4]
### Added
- Can now override the base_path by passing use_base=False in a request.

### Added
- Ability tp separately specify the base path.

## [1.3.3]
### Changes
- Switched to separated version.py file to reduce touchpoints.
- Will now always log the request, regardless of the query params or body.
- Moved docstring from APISession.__init__ to the class to conform to google docstring format.

### Added
- url_validator utility.

### Fixed
- box checking should check that class types equal one another, not that it is an instance of box.

## [1.3.2]
### Changed
- Changed the use of the collections library to be forwards compat with py39
- Modified the Box processing check to use the length of resp.text instead of the Content-Length header.

## [1.3.1]
### Changed
- Reduced min version of "python-box" to a Python 2.7 supported version.

## [1.3.0]
## Added
- Added support for response "Boxification" of JSON content.
- Added support for endpoint verb methods using an endpoint _path attribute.

## [1.2.0]
### Added
- Localized private methods for HTTP verbs using the _path attribute for path prefixing.
- APISession now supports context management.
- Added _authenticate and _deauthenticate stubs for use with context management.

## [1.1.1]
### Fixed
- The Integrations UA string broke on Windows (os.uname vs platform.uname)

### Added
- "Soft" typechecking within the check utility function.

## [1.1.0]
- Migrated the check logic out of the Endpoint and into Utils.
- User-Agent String now follows the Integration/1.0 Standard
- Added documentation around usage
- Switched antipatterns for Parent classes to using `super` in a py2 & py3 compatible way.

## [1.0.3]
### Added
- Added support for extensible retry logic.
- Added support for both relative, and absolute, and full URI paths.

## [1.0.2]
### Modified
- Improved documentation

## [1.0.1]
### Added
- Added trunc utility to restfly.utils

### Modified
- APIEndpoint now inherits the logging facility from the APISession passed to it
  at instantiation.

## [1.0.0]
- Initial Version


[1.4.6]: https://github.com/SteveMcGrath/restfly/compare/1.4.5...1.4.6
[1.4.5]: https://github.com/SteveMcGrath/restfly/compare/1.4.4...1.4.5
[1.4.4]: https://github.com/SteveMcGrath/restfly/compare/1.4.3...1.4.4
[1.4.3]: https://github.com/SteveMcGrath/restfly/compare/1.4.2...1.4.3
[1.4.2]: https://github.com/SteveMcGrath/restfly/compare/1.4.1...1.4.2
[1.4.1]: https://github.com/SteveMcGrath/restfly/compare/1.4.0...1.4.1
[1.4.0]: https://github.com/SteveMcGrath/restfly/compare/1.3.6...1.4.0
[1.3.6]: https://github.com/SteveMcGrath/restfly/compare/1.3.5...1.3.6
[1.3.5]: https://github.com/SteveMcGrath/restfly/compare/1.3.4...1.3.5
[1.3.4]: https://github.com/SteveMcGrath/restfly/compare/1.3.3...1.3.4
[1.3.3]: https://github.com/SteveMcGrath/restfly/compare/1.3.2...1.3.3
[1.3.2]: https://github.com/SteveMcGrath/restfly/compare/1.3.1...1.3.2
[1.3.1]: https://github.com/SteveMcGrath/restfly/compare/1.3.0...1.3.1
[1.3.0]: https://github.com/SteveMcGrath/restfly/compare/1.2.0...1.3.0
[1.2.0]: https://github.com/SteveMcGrath/restfly/compare/1.1.1...1.2.0
[1.1.1]: https://github.com/SteveMcGrath/restfly/compare/1.1.0...1.1.1
[1.1.0]: https://github.com/SteveMcGrath/restfly/compare/1.0.3...1.1.0
[1.0.3]: https://github.com/SteveMcGrath/restfly/compare/1.0.2...1.0.3
[1.0.2]: https://github.com/SteveMcGrath/restfly/compare/1.0.1...1.0.2
[1.0.1]: https://github.com/SteveMcGrath/restfly/compare/1.0.0...1.0.1
[1.0.0]: https://github.com/SteveMcGrath/restfly/commit/96c389866da658374736942a0771bf47ff0ccb4c
