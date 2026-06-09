# Changelog

## [1.13]-1 2026-06-09

### Added

- Add new rsa4096 [gpg public key](http://savannah.gnu.org/people/viewgpg.php?user_id=12809) for source signature check
- Add this CHANGELOG.md to track changes to the package

### Changed

- Switch source file checksum to SHA256 to match the published checksum

## [1.12]-1 2025-01-17

### Added

- Add source gpg signature file

### Removed

- Remove unneeded `-` → `.` pkgver conversion

## [1.12.rc1]-1 2024-12-02

### Added

- Convert canonical 1.12-rc1 version to valid pkgver=1.12.rc1

### Removed

- Removed .sig from sources, as it is not provided for this RC release

## [1.11]-1 2024-02-13

### Added

- Add source signing pubkey to repo, in compliance with [RFC0011]

## [1.11]-1 2024-02-11

### Fixed

- Use correct SPDX id in license field of PKGBUILD

[1.13]: https://lists.nongnu.org/archive/html/lzip-bug/2026-03/msg00003.html
[1.12]: https://lists.nongnu.org/archive/html/lzip-bug/2025-01/msg00010.html
[1.12.rc1]: https://lists.nongnu.org/archive/html/lzip-bug/2024-11/msg00004.html
[1.11]: https://lists.nongnu.org/archive/html/lzip-bug/2024-01/msg00009.html
[RFC0011]: https://rfc.archlinux.page/0011-store-source-signing-keys/
