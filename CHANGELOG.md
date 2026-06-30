# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.4.3] - 2026-06-27
### Changed
- Update dependencies
- Updated min dart SDK to 3.12.0

## [1.4.2] - 2025-04-19
### Fixed
- Do not fail if no unused packages are found

## [1.4.1] - 2025-04-18
### Changed
- The `r` command now removes recursively. Added `u` to uninstall non recursively

## [1.4.0] - 2025-04-18
### Added
- Support for uninstalling no longer needed packages
  - As part of `review`, you will be queried about those packages

## [1.3.0] - 2025-04-12
### Added
- Support for syncing groups with
  - extensive handling for adding and removing groups
  - detection of changes in the groups themselves

### Changed
- Update dependencies
- Updated min dart SDK to 3.7.0

### Security
- pacman hook now automatically drops sudo permissions to not run the tool as root

## [1.2.5] - 2024-03-14
### Changed
- Updated dependencies
- Updated min dart SDK to 3.3.0

## [1.2.4] - 2023-09-05
### Changed
- Update dependencies
- Remove lockfile from git

## [1.2.3] - 2023-04-04
### Changed
- Update dependencies
- Improve CI

## [1.2.2] - 2023-02-06
### Changed
- Update dependencies
- Update min required dart SDK to 2.19.0

## [1.2.1] - 2022-10-15
### Changed
- Update dependencies
- Update min required dart SDK to 2.18.2

## [1.2.0] - 2022-08-22
### Added
- Add `install` command to install all new packages at once

## [1.1.0] - 2022-08-20
### Added
- Detect packages that are implicitly installed when reviewing
- Add options to mark packages as explicitly or implicitly installed

## [1.0.2] - 2022-08-18
### Fixed
- Minor fix-ups and improvements

## [1.0.1] - 2022-08-18
### Fixed
- Add install script to PKGBUILD to set correct permissions on storage directory

## [1.0.0] - 2022-08-15
### Added
- Add `review` command to review detected package changes

### Changed
- Rename default command to `update`

## [0.1.2] - 2022-08-01
### Fixed
- Small fixups, repair AUR package

## [0.1.1] - 2022-07-27
### Changed
- Use dart\_test\_tools aur workflow template

## [0.1.0] - 2022-07-25
### Added
- Initial release

[1.4.3]: https://github.com/Skycoder42/paxchange/compare/v1.4.2...v1.4.3
[1.4.2]: https://github.com/Skycoder42/paxchange/compare/v1.4.1...v1.4.2
[1.4.1]: https://github.com/Skycoder42/paxchange/compare/v1.4.0...v1.4.1
[1.4.0]: https://github.com/Skycoder42/paxchange/compare/v1.3.0...v1.4.0
[1.3.0]: https://github.com/Skycoder42/paxchange/compare/v1.2.5...v1.3.0
[1.2.5]: https://github.com/Skycoder42/paxchange/compare/v1.2.4...v1.2.5
[1.2.4]: https://github.com/Skycoder42/paxchange/compare/v1.2.3...v1.2.4
[1.2.3]: https://github.com/Skycoder42/paxchange/compare/v1.2.2...v1.2.3
[1.2.2]: https://github.com/Skycoder42/paxchange/compare/v1.2.1...v1.2.2
[1.2.1]: https://github.com/Skycoder42/paxchange/compare/v1.2.0...v1.2.1
[1.2.0]: https://github.com/Skycoder42/paxchange/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/Skycoder42/paxchange/compare/v1.0.2...v1.1.0
[1.0.2]: https://github.com/Skycoder42/paxchange/compare/v1.0.1...v1.0.2
[1.0.1]: https://github.com/Skycoder42/paxchange/compare/v1.0.0...v1.0.1
[1.0.0]: https://github.com/Skycoder42/paxchange/compare/v0.1.2...v1.0.0
[0.1.2]: https://github.com/Skycoder42/paxchange/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/Skycoder42/paxchange/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/Skycoder42/paxchange/releases/tag/v0.1.0
