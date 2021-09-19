# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).
This project adheres to [CHANGELOG](http://keepachangelog.com/).

## [Unreleased]

## [1.0.0] - 2019-07-10
### Changed
- Enable cohesion by default

### Fixed
- Debugging and standard output not producing the same results

## [0.9.1] - 2018-09-20
### Fixed
- Package long description content type

## [0.9.0] - 2018-09-20
### Added
- Python 3.7 support

### Fixed
- Bug with setuptools specifying cohesion_below option as a str

## [0.8.0] - 2017-10-01
### Added
- Flake8 support
- Filtering on cohesion values below/above a certain threshold
- Class line number and column offset in output

### Removed
- Python 3.2 and 3.3 support

## [0.7.0] - 2017-06-15
### Added
- Python 3.6 support

## [0.6.1] - 2016-09-21
### Changed
- Improved instance variable detection
- Improved attribute value name detection

## [0.6.0] - 2016-08-27
### Added
- Added functionality for printing staticmethod and classmethod information
- Added -x flag for debugging output

## [0.5.1] - 2016-08-16
### Changed
- Moved to standard Python package __main__ functionality to support Python 2
  and 3

## [0.5.0] - 2016-08-16
### Added
- Initial release of Cohesion
