# Changelog

## [v0.0.22](https://github.com/ka2n/miru/compare/v0.0.21...v0.0.22) - 2026-03-14
### Other Changes
- feat: Add Nix flake for installation by @ka2n in https://github.com/ka2n/miru/pull/65

## [v0.0.21](https://github.com/ka2n/miru/compare/v0.0.20...v0.0.21) - 2025-05-27
### New Features
- feat: Update MCP tool response format, remove urls tool by @ka2n in https://github.com/ka2n/miru/pull/62

## [v0.0.20](https://github.com/ka2n/miru/compare/v0.0.19...v0.0.20) - 2025-05-02
### Other Changes
- fix(mcp): broken `fetch_library_urls` tool by @ka2n in https://github.com/ka2n/miru/pull/60

## [v0.0.19](https://github.com/ka2n/miru/compare/v0.0.18...v0.0.19) - 2025-04-30
### New Features
- feat(mcp/fetch_library_docs): fetch documentation as markdown by @ka2n in https://github.com/ka2n/miru/pull/58

## [v0.0.18](https://github.com/ka2n/miru/compare/v0.0.17...v0.0.18) - 2025-04-26
### New Features
- Add direct output to stdout when TTY is not available by @ka2n in https://github.com/ka2n/miru/pull/56

## [v0.0.17](https://github.com/ka2n/miru/compare/v0.0.16...v0.0.17) - 2025-04-26
### Other Changes
- feat: open specific target(homepage, repository, registry) by -b flag by @ka2n in https://github.com/ka2n/miru/pull/54

## [v0.0.16](https://github.com/ka2n/miru/compare/v0.0.15...v0.0.16) - 2025-04-24
### Other Changes
- improvements by @ka2n in https://github.com/ka2n/miru/pull/51

## [v0.0.15](https://github.com/ka2n/miru/compare/v0.0.14...v0.0.15) - 2025-04-24
### Other Changes
- feat: refine pager UI by @ka2n in https://github.com/ka2n/miru/pull/49

## [v0.0.14](https://github.com/ka2n/miru/compare/v0.0.13...v0.0.14) - 2025-04-22
### Other Changes
- improve stability, robustness by @ka2n in https://github.com/ka2n/miru/pull/47

## [v0.0.13](https://github.com/ka2n/miru/compare/v0.0.12...v0.0.13) - 2025-04-22
### New Features
- feat: Debug logger by @ka2n in https://github.com/ka2n/miru/pull/44
### Fix bugs
- fix: NPM url with organization name by @ka2n in https://github.com/ka2n/miru/pull/45

## [v0.0.12](https://github.com/ka2n/miru/compare/v0.0.11...v0.0.12) - 2025-04-21
### New Features
- improve JSR handling by @ka2n in https://github.com/ka2n/miru/pull/42

## [v0.0.11](https://github.com/ka2n/miru/compare/v0.0.10...v0.0.11) - 2025-04-20
### Other Changes
- refactor: refactor data flow by @ka2n in https://github.com/ka2n/miru/pull/40

## [v0.0.10](https://github.com/ka2n/miru/compare/v0.0.9...v0.0.10) - 2025-04-19
### New Features
- feat: support PHP (packagist) by @ka2n in https://github.com/ka2n/miru/pull/38

## [v0.0.9](https://github.com/ka2n/miru/compare/v0.0.8...v0.0.9) - 2025-04-16
### New Features
- cleanup error message by @ka2n in https://github.com/ka2n/miru/pull/34
- chore: add alias: `crates` for rust by @ka2n in https://github.com/ka2n/miru/pull/33
- support python by @ka2n in https://github.com/ka2n/miru/pull/37
### Other Changes
- chore: trim debug symbols, internal build path by @ka2n in https://github.com/ka2n/miru/pull/35

## [v0.0.8](https://github.com/ka2n/miru/compare/v0.0.7...v0.0.8) - 2025-04-16
### New Features
- feat: change pager style by environment variables  by @ka2n in https://github.com/ka2n/miru/pull/32
### Other Changes
- fix(document): prefer shorter url as document URL by @ka2n in https://github.com/ka2n/miru/pull/31

## [v0.0.7](https://github.com/ka2n/miru/compare/v0.0.6...v0.0.7) - 2025-04-15
### New Features
- Parse go import metadata by @ka2n in https://github.com/ka2n/miru/pull/24
- feat: customize gh/glab CLI path with environment variables by @ka2n in https://github.com/ka2n/miru/pull/26
- feat: MCP Server by @ka2n in https://github.com/ka2n/miru/pull/27
### Other Changes
- chore(deps): bump golang.org/x/net from 0.34.0 to 0.36.0 by @dependabot in https://github.com/ka2n/miru/pull/29
- chore(deps): bump golang.org/x/crypto from 0.33.0 to 0.35.0 by @dependabot in https://github.com/ka2n/miru/pull/28

## [v0.0.6](https://github.com/ka2n/miru/compare/v0.0.5...v0.0.6) - 2025-04-14
### New Features
- feat: add -o json option to output metadata with JSON by @ka2n in https://github.com/ka2n/miru/pull/15
- feat: find links in the document by @ka2n in https://github.com/ka2n/miru/pull/17
- feat: add MIRU_NO_CACHE=1 to disable cache by @ka2n in https://github.com/ka2n/miru/pull/19
- detection: detect package name by install command in documentation by @ka2n in https://github.com/ka2n/miru/pull/20
- feat: fetch documentation from github by @ka2n in https://github.com/ka2n/miru/pull/22
- fix/go package by @ka2n in https://github.com/ka2n/miru/pull/23
### Fix bugs
- chore: safer menu handling by @ka2n in https://github.com/ka2n/miru/pull/18
### Other Changes
- docs/linux instruction by @ka2n in https://github.com/ka2n/miru/pull/13
- fix(MIRU_NO_CACHE): make temp dir each time by @ka2n in https://github.com/ka2n/miru/pull/21

## [v0.0.5](https://github.com/ka2n/miru/compare/v0.0.4...v0.0.5) - 2025-04-14
### New Features
- feat: add AUR package by @ka2n in https://github.com/ka2n/miru/pull/11

## [v0.0.4](https://github.com/ka2n/miru/compare/v0.0.3...v0.0.4) - 2025-04-14

## [v0.0.3](https://github.com/ka2n/miru/compare/v0.0.2...v0.0.3) - 2025-04-14
### Other Changes
- feat(goreleaser): add homebrew-tap by @ka2n in https://github.com/ka2n/miru/pull/8

## [v0.0.2](https://github.com/ka2n/miru/compare/v0.0.1...v0.0.2) - 2025-04-13
### Fix bugs
- fix: api.Version is always `(devel)` by @ka2n in https://github.com/ka2n/miru/pull/7
### Other Changes
- feat: use GitHub native release note generator by @ka2n in https://github.com/ka2n/miru/pull/6

## [v0.0.1](https://github.com/ka2n/miru/compare/v0.0.0...v0.0.1) - 2025-04-12

## [v0.0.1](https://github.com/ka2n/miru/commits/v0.0.1) - 2025-04-12
### Other Changes
- relese flow by @ka2n in https://github.com/ka2n/miru/pull/1

## [v0.0.1](https://github.com/ka2n/miru/commits/v0.0.1) - 2025-04-12
### Other Changes
- relese flow by @ka2n in https://github.com/ka2n/miru/pull/1
