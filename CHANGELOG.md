# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

### Added
- A new data model for unified handling of cross references in the NVT meta data as been added. All previous API elements to handle cve, bid, xref werehas been removed. [#225](https://github.com/greenbone/gvm-libs/pull/225) [#232](https://github.com/greenbone/gvm-libs/pull/232).

### Changed
- Handle EAI_AGAIN in gvm_host_reverse_lookup() IPv6 case and function refactor. [#229](https://github.com/greenbone/gvm-libs/pull/229)
- Prevent g_strsplit to be called with NULL. [#238](https://github.com/greenbone/gvm-libs/pull/238)

### Fixed
- Prevent g_strsplit to be called with NULL. [#238](https://github.com/greenbone/gvm-libs/pull/238)

### Removed
- Remove inconsistent delays in kb routines. [#230](https://github.com/greenbone/gvm-libs/pull/230)

[Unreleased]: https://github.com/greenbone/gvm-libs/compare/gvm-libs-10.0...master

## [10.0.1] (unreleased)

### Added
- Allow multiple certificate formats for S/MIME. [#231](https://github.com/greenbone/gvm-libs/pull/231)
- Add cmake options to build with ldap and radius support. [#235](https://github.com/greenbone/gvm-libs/pull/235)

### Changed
- Always add hostnames and vhosts in lower-case format. [#218](https://github.com/greenbone/gvm-libs/pull/218)
- Plugin feed version file: Show message only once if it is not found. [#220](https://github.com/greenbone/gvm-libs/pull/220)
- Use g_log instead of g_debug for No redis DB available message. [#224](https://github.com/greenbone/gvm-libs/pull/224)

### Fixed
- Fix prefs key in nvticache_delete(). [#214](https://github.com/greenbone/gvm-libs/pull/214)
- Fix redis_find(). [#216](https://github.com/greenbone/gvm-libs/pull/216)
- Fixes to gvm_hosts_resolve(). [#228](https://github.com/greenbone/gvm-libs/pull/228)

[10.0.1]: https://github.com/greenbone/gvm-libs/compare/v10.0.0...gvm-libs-10.0

## [10.0.0] (2019-04-05)

### Changed
- The function gvm_hosts_shuffle has been improved. [#200](https://github.com/greenbone/gvm-libs/pull/200)

### Fixed
- An issue which caused duplicated or removed values in the nvticache as addressed. [#196](https://github.com/greenbone/gvm-libs/pull/196)
- Performance fixes related to handling large sets of hosts have been done.[203](https://github.com/greenbone/gvm-libs/pull/203) [#208](https://github.com/greenbone/gvm-libs/pull/208)
- Memory management issues have been addressed. [#187](https://github.com/greenbone/gvm-libs/pull/187)


[10.0.0]: https://github.com/greenbone/gvm-libs/compare/1.0.0...v10.0.0
