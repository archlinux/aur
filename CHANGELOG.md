# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.1] - 2023-08-12
### Fixed
- Fixup AUR release

## [1.2.0] - 2023-08-12
### Added
- Support for running alternative backup services
  - By setting the backup label to a non empty string, a hook is registered
  - Is the name of a systemd unit or template unit
    - Automatically escapes volume names when passed to a template
  - Can run as preparation or instead of the normal backup
  - Backup logic (ordering, container-management, etc.) still applies

### Changed
- Improve documentation

## [1.1.0] - 2023-08-04
### Added
- Add support for detecting pods

## [1.0.4] - 2023-07-09
### Changed
- Remove --fsync from rsync call due to compatibility reasons

## [1.0.3] - 2023-07-08
### Added
- Add upload to packagecloud

## [1.0.2] - 2023-06-09
### Changed
- Update dependencies

## [1.0.1] - 2023-04-04
### Added
- Add support for AUR releases

### Changed
- Update dependencies

## [1.0.0+1] - 2023-03-31
### Fixed
- Fixed release artifacts

## [1.0.0] - 2023-03-30
### Added
- Initial release

[1.2.1]: https://github.com/Skycoder42/podman_backup/compare/v1.2.0...v1.2.1
[1.2.0]: https://github.com/Skycoder42/podman_backup/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/Skycoder42/podman_backup/compare/v1.0.4...v1.1.0
[1.0.4]: https://github.com/Skycoder42/podman_backup/compare/v1.0.3...v1.0.4
[1.0.3]: https://github.com/Skycoder42/podman_backup/compare/v1.0.2...v1.0.3
[1.0.2]: https://github.com/Skycoder42/podman_backup/compare/v1.0.1...v1.0.2
[1.0.1]: https://github.com/Skycoder42/podman_backup/compare/v1.0.0+1...v1.0.1
[1.0.0+1]: https://github.com/Skycoder42/podman_backup/compare/v1.0.0...v1.0.0+1
[1.0.0]: https://github.com/Skycoder42/podman_backup/releases/tag/v1.0.0
