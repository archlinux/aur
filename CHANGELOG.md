# CHANGELOG

## [Unreleased]

### Breaking:

### Bug Fixes:

### Enhancements:

### Dependencies:
- build(deps): `golang.org/x/term` from 0.41.0 to 0.42.0 ([#1726](https://github.com/fastly/cli/pull/1726))
- build(deps): `golang.org/x/crypto` from 0.49.0 to 0.50.0 ([#1726](https://github.com/fastly/cli/pull/1726))
- build(deps): `golang.org/x/mod` from 0.34.0 to 0.35.0 ([#1726](https://github.com/fastly/cli/pull/1726))
- build(deps): `golang.org/x/net` from 0.52.0 to 0.53.0 ([#1726](https://github.com/fastly/cli/pull/1726))
- build(deps): `golang.org/x/text` from 0.35.0 to 0.36.0 ([#1726](https://github.com/fastly/cli/pull/1726))

## [v14.3.1](https://github.com/fastly/cli/releases/tag/v14.3.1) (2026-04-13)

### Bug Fixes:

- fix(publish_release): add back perms for publishing to npm [#1724](https://github.com/fastly/cli/pull/1724)

## [v14.3.0](https://github.com/fastly/cli/releases/tag/v14.3.0) (2026-04-10)

### Bug Fixes:

- fix(vcl/condition): `--comment` flag in `condition update` now correctly sets the comment instead of overwriting the statement [#1714](https://github.com/fastly/cli/pull/1714)
- fix(manifest): `env_file` parsing no longer rejects values containing `=` characters (e.g. `KEY=val=ue`) [#1715](https://github.com/fastly/cli/pull/1715)

### Enhancements:

- feat(auth): add `auth revoke` subcommand for revoking API tokens via `--current`, `--name`, `--token-value`, `--id`, or `--file` (bulk) [#1717](https://github.com/fastly/cli/pull/1717)
- feat(service/logging/debug): add support for logging endpoint error streaming via the `service logging debug` subcommand [#1721](https://github.com/fastly/cli/pull/1721)
- feat(stats): accept `--json` / `-j` as an alias for `--format=json` on all stats and help subcommands, matching the flag style used by the rest of the CLI [#1719](https://github.com/fastly/cli/pull/1719)

### Dependencies:

- build(deps): `github.com/andybalholm/brotli` from 1.2.0 to 1.2.1 ([#1716](https://github.com/fastly/cli/pull/1716))
- build(deps): `github.com/go-jose/go-jose/v3` from 3.0.4 to 3.0.5 ([#1716](https://github.com/fastly/cli/pull/1716))
- build(deps): `github.com/mattn/go-runewidth` from 0.0.21 to 0.0.22 ([#1716](https://github.com/fastly/cli/pull/1716))
- build(deps): `github.com/mattn/go-isatty` from 0.0.20 to 0.0.21 ([#1720](https://github.com/fastly/cli/pull/1720))
- build(deps): `golang.org/x/sys` from 0.42.0 to 0.43.0 ([#1720](https://github.com/fastly/cli/pull/1720))
- build(deps): `github.com/coreos/go-oidc/v3` from 3.17.0 to 3.18.0 ([#1720](https://github.com/fastly/cli/pull/1720))
- build(deps): `github.com/mattn/go-runewidth` from 0.0.22 to 0.0.23 ([#1720](https://github.com/fastly/cli/pull/1720))
- build(deps): `github.com/fastly/go-fastly/v14` from 13.1.2 to 14.2.0 ([#1722](https://github.com/fastly/cli/pull/1722))

## [v14.2.0](https://github.com/fastly/cli/releases/tag/v14.2.0) (2026-03-24)

### Bug Fixes:

- fix(auth): `fastly profile`, `fastly sso` and `fastly auth-token` commands now correctly respect the `--quiet` flag [#1710](https://github.com/fastly/cli/pull/1710)

### Enhancements:

- feat(vcl/snippet): add support for the '--content' flag, allowing for the raw output of VCL.  [#1706](https://github.com/fastly/cli/pull/1706)

### Dependencies:

- build(deps): `github.com/fatih/color` from 1.18.0 to 1.19.0 ([#1707](https://github.com/fastly/cli/pull/1707))
- build(deps): `github.com/klauspost/compress` from 1.18.4 to 1.18.5 ([#1707](https://github.com/fastly/cli/pull/1707))

## [v14.1.1](https://github.com/fastly/cli/releases/tag/v14.1.1) (2026-03-18)

### Bug Fixes:

- fix(compute): `compute pack`, `compute validate`, and `install` no longer require authentication. [#1701](https://github.com/fastly/cli/pull/1701)

## [v14.1.0](https://github.com/fastly/cli/releases/tag/v14.1.0) (2026-03-17)

### Bug Fixes:

- fix(stats): `stats historical` now returns write errors instead of silently swallowing them [#1678](https://github.com/fastly/cli/pull/1678)

### Deprecations:

- deprecated(auth): `fastly profile`, `fastly sso`, and `fastly auth-token` command trees are deprecated and will be removed in a future release. Use `fastly auth` subcommands instead. [#1676](https://github.com/fastly/cli/pull/1676)
- deprecated(auth): `--profile` and `--enable-sso` global flags are deprecated. Use `--token <name>` to select a stored auth token by name, or `fastly auth login --sso --token <name>` for SSO. [#1676](https://github.com/fastly/cli/pull/1676)

### Enhancements:

- feat(auth): add `auth token` subcommand to output the active API token for use in shell substitutions (e.g. `$(fastly auth token)`).
- feat(auth): `auth login --sso` now requires `--token <name>` to explicitly name the stored token. This prevents accidentally overwriting tokens in multi-user SSO workflows. [#1676](https://github.com/fastly/cli/pull/1676)
- feat(auth): add `FASTLY_DISABLE_AUTH_COMMAND` env var to hide the `fastly auth` command tree from help, completions, and invocation. [#1676](https://github.com/fastly/cli/pull/1676)
- feat(auth): when `FASTLY_DISABLE_AUTH_COMMAND` is set, the `--token`/`-t` global flag is also disabled. Use `FASTLY_API_TOKEN` or stored config tokens instead. [#1676](https://github.com/fastly/cli/pull/1676)
- feat(stats): add `--field` flag to `stats historical` to filter to a single stats field. [#1678](https://github.com/fastly/cli/pull/1678)
- feat(stats): add `stats aggregate` subcommand for cross-service aggregated stats. [#1678](https://github.com/fastly/cli/pull/1678)
- feat(stats): add `stats usage` subcommand for bandwidth/request usage, with `--by-service` breakdown. [#1678](https://github.com/fastly/cli/pull/1678)
- feat(stats): add `stats domain-inspector` subcommand for domain-level metrics. [#1678](https://github.com/fastly/cli/pull/1678)
- feat(stats): add `stats origin-inspector` subcommand for origin-level metrics. [#1678](https://github.com/fastly/cli/pull/1678)
- feat(apisecurity/discoveredoperations): add support for 'list' and 'update' support for 'API discovery'. [#1689](https://github.com/fastly/cli/pull/1689)
- feat(apisecurity/operations): add CRUD support for 'API Inventory' operations. [#1689](https://github.com/fastly/cli/pull/1689)
- feat(apisecurity/tags): add API Security Operations tag support ([#1688](https://github.com/fastly/cli/pull/1688))
- feat(service/version): add support for service validation. [#1695](https://github.com/fastly/cli/pull/1695)
- feat(compute/build): Block version 1.93.0 of Rust to avoid a wasm32-wasip2 bug. ([#1653](https://github.com/fastly/cli/pull/1653))
- feat(service/vcl): escape control characters when displaying VCL content for cleaner terminal output ([#1637](https://github.com/fastly/cli/pull/1637))

### Dependencies:

- build(deps): `golang.org/x/net` from 0.50.0 to 0.51.0 ([#1674](https://github.com/fastly/cli/pull/1674))
- build(deps): `actions/upload-artifact` from 6 to 7 ([#1675](https://github.com/fastly/cli/pull/1675))
- build(deps): `actions/download-artifact` from 7 to 8 ([#1675](https://github.com/fastly/cli/pull/1675))
- build(deps): `golang.org/x/sys` from 0.41.0 to 0.42.0 ([#1679](https://github.com/fastly/cli/pull/1679))
- build(deps): `github.com/mattn/go-runewidth` from 0.0.20 to 0.0.21 ([#1679](https://github.com/fastly/cli/pull/1679))
- build(deps): `github.com/pierrec/lz4/v4` from 4.1.25 to 4.1.26 ([#1679](https://github.com/fastly/cli/pull/1679))
- build(deps): `golang.org/x/oauth2` from 0.35.0 to 0.36.0 ([#1679](https://github.com/fastly/cli/pull/1679))
- build(deps): `golang.org/x/sync` from 0.19.0 to 0.20.0 ([#1679](https://github.com/fastly/cli/pull/1679))
- build(deps): `github.com/fastly/go-fastly/v13` from 13.0.0 to 13.0.1 ([#1679](https://github.com/fastly/cli/pull/1679))
- build(deps): `golang.org/x/term` from 0.40.0 to 0.41.0 ([#1687](https://github.com/fastly/cli/pull/1687))
- build(deps): `golang.org/x/mod` from 0.33.0 to 0.34.0 ([#1687](https://github.com/fastly/cli/pull/1687))
- build(deps): `golang.org/x/text` from 0.34.0 to 0.35.0 ([#1687](https://github.com/fastly/cli/pull/1687))
- build(deps): `github.com/fastly/go-fastly/v13` from 13.0.1 to 13.1.0 ([#1687](https://github.com/fastly/cli/pull/1687))
- build(deps): `golang.org/x/crypto` from 0.48.0 to 0.49.0 ([#1693](https://github.com/fastly/cli/pull/1693))
- build(deps): `golang.org/x/net` from 0.51.0 to 0.52.0 ([#1693](https://github.com/fastly/cli/pull/1693))
- build(deps): `github.com/fastly/go-fastly/v13` from 13.1.0 to 13.1.1 ([#1693](https://github.com/fastly/cli/pull/1693))
- build(deps): `github.com/fastly/go-fastly/v13` from 13.1.1 to 13.1.2 ([#1696](https://github.com/fastly/cli/pull/1696))
- build(deps): `actions/create-github-app-token` from 2 to 3 ([#1692](https://github.com/fastly/cli/pull/1692))

## [v14.0.4](https://github.com/fastly/cli/releases/tag/v14.0.4) (2026-02-26)

### Documentation:

- fix(changelog): change code blocks to be all on one line [#1670](https://github.com/fastly/cli/pull/1670)

## [v14.0.3](https://github.com/fastly/cli/releases/tag/v14.0.3) (2026-02-25)

### Bug Fixes:

- fix(npm): add contents write perms [#1667](https://github.com/fastly/cli/pull/1667)

## [v14.0.2](https://github.com/fastly/cli/releases/tag/v14.0.2) (2026-02-25)

### Bug Fixes:

- fix(npm): add write perms [#1665](https://github.com/fastly/cli/pull/1665)

## [v14.0.1](https://github.com/fastly/cli/releases/tag/v14.0.1) (2026-02-25)

### Bug Fixes:

- fix(npm): Include repository info in package.json of subpackages required for trusted publishing [#1663](https://github.com/fastly/cli/pull/1663)

## [v14.0.0](https://github.com/fastly/cli/releases/tag/v14.0.0) (2026-02-25)

## BREAKING CHANGES

This release of the Fastly CLI includes a significant reorganization
of the commands which are used to manage the configuration of Fastly
services (both Delivery and Compute services). Specifically, each of
the command families listed below have been changed from 
`fastly <family> create/delete/describe/list/update` to 
`fastly service <family> create/delete/describe/list/update`. For nearly 
all of these command families, the previous commands are still available 
but are not listed in the `fastly help` output. In addition, invocations 
of the previous commands will generate a deprecation message, which
includes the new command that should be used instead.

The `fastly domain` family of commands are the lone exception; those
commands exist in both the old and new forms, but the top-level
commands are used to manage 'versionless' domains (a new feature of
the Fastly platform, and those commands were previously named 
`fastly domain-v1 create/delete/describe/list/update`), while 
the service-level commands are used to manage 'classic' domains. As a
result, you will need to update any scripts or workflows which used the
`fastly domain create/delete/describe/list/update` commands to use the
`fastly service domain create/delete/describe/list/update` commands
instead.

The command families which have been reorganized and are available in
both the old and new forms are:

  * acl
  * aclentry
  * alert
  * backend
  * dictionary
  * dictionary-entry
  * healthcheck
  * imageoptimizerdefaults
  * logging
  * purge
  * rate-limit
  * resource-link
  * service-auth
  * service-version
  * vcl

### Breaking:

- breaking(domain) - service-version oriented `domain` commands have been moved under the `service domain` command. Versionless `domain-v1` commands have been moved to the `domain` command ([#1615](https://github.com/fastly/cli/pull/1615))
### Deprecations:

- deprecated(auth): `fastly profile`, `fastly sso`, and `fastly auth-token` command trees are deprecated and will be removed in a future release. Use `fastly auth` subcommands instead.
- deprecated(auth): `--profile` and `--enable-sso` global flags are deprecated. Use `--token <name>` to select a stored auth token by name, or `fastly auth login --sso --token <name>` for SSO.

### Enhancements:

- feat(auth): `auth login --sso` now requires `--token <name>` to explicitly name the stored token. This prevents accidentally overwriting tokens in multi-user SSO workflows.
- feat(auth): add `FASTLY_DISABLE_AUTH_COMMAND` env var to hide the `fastly auth` command tree from help, completions, and invocation.
- feat(auth): when `FASTLY_DISABLE_AUTH_COMMAND` is set, the `--token`/`-t` global flag is also disabled. Use `FASTLY_API_TOKEN` or stored config tokens instead.
- feat(ngwaf/rules): Upgrade go-fastly to v13.0.0 and allow ngwaf rules to accept multival conditions ([#1655](https://github.com/fastly/cli/pull/1655))
- feat(rust): Allow testing with prerelease Rust versions ([#1604](https://github.com/fastly/cli/pull/1604))
- feat(compute/hashfiles): remove hashsum subcommand ([#1608](https://github.com/fastly/cli/pull/1608))
- feat(ngwaf/rules): add support for CRUD operations for NGWAF rules ([#1605](https://github.com/fastly/cli/pull/1605))
- feat(compute/deploy): added the `--no-default-domain` flag to allow for the skipping of automatic domain creation when deploying a Compute service([#1610](https://github.com/fastly/cli/pull/1610))
- refactor(argparser/flags.go): add flag conversion utilities for converting string flags to bools and checking ascending and desecnding flags ([#1611](https://github.com/fastly/cli/pull/1611))
- feat(service/purge): Add 'service purge' command as replacement for 'purge', with an unlisted and deprecated alias of 'purge'. ([#1612](https://github.com/fastly/cli/pull/1612))
- feat(service/version): Add 'service version ...' commands as replacements for 'service-version ...', with unlisted and deprecated aliases of 'service-version ...'. ([#1614](https://github.com/fastly/cli/pull/1614))
- feat(service/vcl): moved the `vcl` command under the `service` command, with an unlisted and deprecated alias of `vcl` ([#1616](https://github.com/fastly/cli/pull/1616))
- feat(service/healthcheck): moved the `healthcheck` command under the `service` command, with an unlisted and deprecated alias of `healthcheck` ([#1619](https://github.com/fastly/cli/pull/1619))
- feat(service/backend): moved the `backend` command under the `service` command, with an unlisted and deprecated alias of `backend` ([#1621](https://github.com/fastly/cli/pull/1621))
- feat(service/acl): moved the `acl` and `aclentry` commands under the `service` command, with a unlisted and deprecated aliases of `acl` and `aclentry` ([#1621](https://github.com/fastly/cli/pull/1624))
- feat(version): If the latest version is at least one major version higher than the current version, provide links to the release notes for the major version(s) so the user can review them before upgrading. ([#1623](https://github.com/fastly/cli/pull/1623))
- feat(service/imageoptimizerdefaults): moved the `imageoptimizerdefaults` commands under the `service` command, with an unlisted and deprecated alias of `imageoptimizerdefaults` ([#1627](https://github.com/fastly/cli/pull/1627))
- feat(service/alert): moved the `alerts` command to the `service alert` command, with an unlisted and deprecated alias of `alerts` ([#1616](https://github.com/fastly/cli/pull/1626))
- feat(service/dictionary-entry): moved the `dictionary-entry` commands under the `service` command, with an unlisted and deprecated alias of `dictionary-entry` ([#1628](https://github.com/fastly/cli/pull/1628))
- feat(service/dictionary): moved the `dictionary` command under the `service` command, with an unlisted and deprecated alias of `dictionary` ([#1621](https://github.com/fastly/cli/pull/1630))
- feat(service/ratelimit): moved the `rate-limit` commands under the `service` command, with an unlisted and deprecated alias of `rate-limit` ([#1632](https://github.com/fastly/cli/pull/1632))
- feat(compute/build): Remove Rust version restriction, allowing 1.93.0 and later versions to be used. ([#1633](https://github.com/fastly/cli/pull/1633))
- feat(service/resourcelink): moved the `resource-link` commands under the `service` command, with an unlisted and deprecated alias of `resource-link` ([#1635](https://github.com/fastly/cli/pull/1635))
- feat(service/logging): moved the `logging` commands under the `service` command, with an unlisted and deprecated alias of `logging` ([#1642](https://github.com/fastly/cli/pull/1642))
- feat(service/auth): moved the `service-auth` commands under the `service` command and renamed to `auth`, with an unlisted and deprecated alias of `service-auth` ([#1643](https://github.com/fastly/cli/pull/1643))
### Bug fixes:

- fix(docker): Use base image toolchain instead of reinstalling stable, which could pull in an unvalidated Rust version.
- fix(compute/serve): ensure hostname has a port number when building pushpin routes ([#1631](https://github.com/fastly/cli/pull/1631))
- fix(manifest): Correct setup.Defined to include checks for ObjectStores and SecretStores ([#1639](https://github.com/fastly/cli/pull/1639))

### Dependencies:

- build(deps): `golang` from 1.24 to 1.25 ([#1651](https://github.com/fastly/cli/pull/1651))
- build(deps): `actions/upload-artifact` from 5 to 6 ([#1603](https://github.com/fastly/cli/pull/1603))
- build(deps): `actions/download-artifact` from 6 to 7 ([#1603](https://github.com/fastly/cli/pull/1603))
- build(deps): `golang.org/x/term` from 0.37.0 to 0.38.0 ([#1602](https://github.com/fastly/cli/pull/1602))
- build(deps): `golang.org/x/crypto` from 0.45.0 to 0.46.0 ([#1602](https://github.com/fastly/cli/pull/1602))
- build(deps): `golang.org/x/mod` from 0.30.0 to 0.31.0 ([#1602](https://github.com/fastly/cli/pull/1602))
- build(deps): `golang.org/x/net` from 0.47.0 to 0.48.0 ([#1602](https://github.com/fastly/cli/pull/1602))
- build(deps): `golang.org/x/text` from 0.31.0 to 0.32.0 ([#1602](https://github.com/fastly/cli/pull/1602))
- build(deps): `github.com/pierrec/lz4/v4` from 4.1.22 to 4.1.23 ([#1606](https://github.com/fastly/cli/pull/1606))
- build(deps): `github.com/google/go-querystring` from 1.1.0 to 1.2.0 ([#1607](https://github.com/fastly/cli/pull/1607))
- build(deps): `golang.org/x/sys` from 0.39.0 to 0.40.0 ([#1613](https://github.com/fastly/cli/pull/1613))
- build(deps): `golang.org/x/term` from 0.38.0 to 0.39.0 ([#1613](https://github.com/fastly/cli/pull/1613))
- build(deps): `golang.org/x/crypto` from 0.46.0 to 0.47.0 ([#1613](https://github.com/fastly/cli/pull/1613))
- build(deps): `golang.org/x/mod` from 0.31.0 to 0.32.0 ([#1613](https://github.com/fastly/cli/pull/1613))
- build(deps): `golang.org/x/net` from 0.48.0 to 0.49.0 ([#1613](https://github.com/fastly/cli/pull/1613))
- build(deps): `golang.org/x/text` from 0.32.0 to 0.33.0 ([#1613](https://github.com/fastly/cli/pull/1613))
- build(deps): `github.com/fastly/go-fastly/v13` from 12.1.0 to 12.1.1 ([#1613](https://github.com/fastly/cli/pull/1613))
- build(deps): `github.com/clipperhouse/uax29/v2` from 2.3.0 to 2.3.1 ([#1625](https://github.com/fastly/cli/pull/1625))
- build(deps): `github.com/klauspost/compress` from 1.18.2 to 1.18.3 ([#1625](https://github.com/fastly/cli/pull/1625))
- build(deps): `github.com/pierrec/lz4/v4` from 4.1.23 to 4.1.25 ([#1625](https://github.com/fastly/cli/pull/1625))
- build(deps): `github.com/clipperhouse/uax29/v2` from 2.3.1 to 2.4.0 ([#1634](https://github.com/fastly/cli/pull/1634))
- build(deps): `github.com/clipperhouse/uax29/v2` from 2.4.0 to 2.5.0 ([#1647](https://github.com/fastly/cli/pull/1647))
- build(deps): `golang.org/x/sys` from 0.40.0 to 0.41.0 ([#1652](https://github.com/fastly/cli/pull/1652))
- build(deps): `golang.org/x/term` from 0.39.0 to 0.40.0 ([#1652](https://github.com/fastly/cli/pull/1652))
- build(deps): `golang.org/x/crypto` from 0.47.0 to 0.48.0 ([#1652](https://github.com/fastly/cli/pull/1652))
- build(deps): `golang.org/x/mod` from 0.32.0 to 0.33.0 ([#1652](https://github.com/fastly/cli/pull/1652))
- build(deps): `github.com/clipperhouse/uax29/v2` from 2.5.0 to 2.6.0 ([#1652](https://github.com/fastly/cli/pull/1652))
- build(deps): `github.com/klauspost/compress` from 1.18.3 to 1.18.4 ([#1652](https://github.com/fastly/cli/pull/1652))
- build(deps): `golang.org/x/net` from 0.49.0 to 0.50.0 ([#1652](https://github.com/fastly/cli/pull/1652))
- build(deps): `golang.org/x/oauth2` from 0.34.0 to 0.35.0 ([#1652](https://github.com/fastly/cli/pull/1652))
- build(deps): `golang.org/x/text` from 0.33.0 to 0.34.0 ([#1652](https://github.com/fastly/cli/pull/1652))
- build(deps): `github.com/clipperhouse/uax29/v2` from 2.6.0 to 2.7.0 ([#1657](https://github.com/fastly/cli/pull/1657))
- build(deps): `golang.org/x/text` from 0.33.0 to 0.34.0 ([#1652](https://github.com/fastly/cli/pull/1652))
- build(deps): `github.com/mattn/go-runewidth` from 0.0.19 to 0.0.20 ([#1659](https://github.com/fastly/cli/pull/1659))
- build(deps): `goreleaser/goreleaser-action` from 6 to 7 ([#1660](https://github.com/fastly/cli/pull/1660))

## [v13.3.0](https://github.com/fastly/cli/releases/tag/v13.3.0) (2025-12-11)

### Enhancements:

- feat(toml/rust): add support for Rust 1.9.2 ([#1599](https://github.com/fastly/cli/pull/1599))

## [v13.2.0](https://github.com/fastly/cli/releases/tag/v13.2.0) (2025-12-10)

### Enhancements:

- feat(commands/ngwaf/workspaces): add support for update operation for NGWAF workspaces ([#1578](https://github.com/fastly/cli/pull/1578))
- feat(commands/ngwaf/lists): add support for CRUD operations for NGWAF Lists at account and workspace levels ([#1582](https://github.com/fastly/cli/pull/1582))
- feat(commands/ngwaf/workspaces/alerts): add support for operations for NGWAF alerts ([#1589](https://github.com/fastly/cli/pull/1589))
- feat(commands/ngwaf/customsignals): add support for CRUD operations for NGWAF Custom Signals ([#1592](https://github.com/fastly/cli/pull/1592))
- feat(commands/ngwaf/threshold): add support for CRUD operations for NGWAF Thresholds ([#1595](https://github.com/fastly/cli/pull/1595))

### Bug fixes:

- fix(commands/ngwaf/virtualpatch): ensured a check was in place for the 'update' command that disallowed the --json and --verbose flag to be ran at the same time. ([#1596](https://github.com/fastly/cli/pull/1596))
- fix(commands/ngwaf/redaction): ensured a check was in place for the 'create' and 'update' commands that disallowed the --json and --verbose flag to be ran at the same time. ([#1596](https://github.com/fastly/cli/pull/1596))

### Dependencies:

- build(deps): `golang.org/x/crypto` from 0.43.0 to 0.45.0 ([#1584](https://github.com/fastly/cli/pull/1584))
- build(deps): `actions/checkout` from 5 to 6 ([#1587](https://github.com/fastly/cli/pull/1587))
- build(deps): `golang.org/x/mod` from 0.29.0 to 0.30.0 ([#1588](https://github.com/fastly/cli/pull/1588))
- build(deps): `github.com/coreos/go-oidc/v3` from 3.16.0 to 3.17.0 ([#1588](https://github.com/fastly/cli/pull/1588))
- build(deps): `github.com/klauspost/compress` from 1.18.1 to 1.18.2 ([#1593](https://github.com/fastly/cli/pull/1593))
- build(deps): `golang.org/x/sys` from 0.38.0 to 0.39.0 ([#1594](https://github.com/fastly/cli/pull/1594))
- build(deps): `github.com/hashicorp/cap` from 0.11.0 to 0.12.0 ([#1594](https://github.com/fastly/cli/pull/1594))
- build(deps): `golang.org/x/oauth2` from 0.33.0 to 0.34.0 ([#1594](https://github.com/fastly/cli/pull/1594))
- build(deps): `golang.org/x/sync` from 0.18.0 to 0.19.0 ([#1594](https://github.com/fastly/cli/pull/1594))

## [v13.1.0](https://github.com/fastly/cli/releases/tag/v13.1.0) (2025-11-12)

### Enhancements:

- feat(service-version): Add JSON support to service-version clone command ([#1550](https://github.com/fastly/cli/pull/1550))
- feat(compute/build): Allow usage of Rust 1.91.1 and later patch releases ([#1576](https://github.com/fastly/cli/pull/1576))
- feat(commands/ngwaf/workspaces): add support for CRUD operations for NGWAF workspaces ([#1570](https://github.com/fastly/cli/pull/1570))
- feat(commands/ngwaf/virtualpatch): add support for CRUD operations for NGWAF virtual patches ([#1579](https://github.com/fastly/cli/pull/1579))
- feat(commands/ngwaf/redaction): add support for CRUD operations for NGWAF redactions ([#1581](https://github.com/fastly/cli/pull/1581))

### Dependencies:

- build(deps): `golangci/golangci-lint-action` from 8 to 9 ([#1575](https://github.com/fastly/cli/pull/1575))
- build(deps): `golang.org/x/sys` from 0.37.0 to 0.38.0 ([#1574](https://github.com/fastly/cli/pull/1574))
- build(deps): `golang.org/x/oauth2` from 0.32.0 to 0.33.0 ([#1574](https://github.com/fastly/cli/pull/1574))
- build(deps): `golang.org/x/sync` from 0.17.0 to 0.18.0 ([#1574](https://github.com/fastly/cli/pull/1574))

## [v13.0.0](https://github.com/fastly/cli/releases/tag/v13.0.0) (2025-10-30)

### Breaking:

- breaking(tls-custom): correct 'tls-custom activation enable' command parameters to reflect expected input from API ([#1562](https://github.com/fastly/cli/pull/1562))
- breaking(compute/build): Block version 1.91.0 of Rust as it produces broken WASM packages. ([#1571](https://github.com/fastly/cli/pull/1571))

### Enhancements:

- feat(compute/serve): set sig_iss and sig_key to allow client code to test Grip-Sig signing ([#1569](https://github.com/fastly/cli/pull/1569))
- build(dockerfile-rust): add wasm tools to the rust docker container ([#1552](https://github.com/fastly/cli/pull/1552))
- feat(env): add detection for workspace ID ([#1560](https://github.com/fastly/cli/pull/1560))

### Bug fixes:

- fix(compute): clarify fastly.toml error message when file not found ([#1556](https://github.com/fastly/cli/pull/1556))
- fix(purge/key): ensures that single-key purges will work even if the key contains URL-unsafe characters ([#1566](https://github.com/fastly/cli/pull/1566))

### Dependencies:

- build(deps): `github.com/hashicorp/cap` from 0.10.0 to 0.11.0 ([#1546](https://github.com/fastly/cli/pull/1546))
- build(deps): `github.com/coreos/go-oidc/v3` from 3.15.0 to 3.16.0 ([#1546](https://github.com/fastly/cli/pull/1546))
- build(deps): `stefanzweifel/git-auto-commit-action` from 6 to 7 ([#1549](https://github.com/fastly/cli/pull/1549))
- build(deps): `golang.org/x/sys` from 0.36.0 to 0.37.0 ([#1548](https://github.com/fastly/cli/pull/1548))
- build(deps): `golang.org/x/term` from 0.35.0 to 0.36.0 ([#1548](https://github.com/fastly/cli/pull/1548))
- build(deps): `golang.org/x/crypto` from 0.42.0 to 0.43.0 ([#1548](https://github.com/fastly/cli/pull/1548))
- build(deps): `golang.org/x/mod` from 0.28.0 to 0.29.0 ([#1548](https://github.com/fastly/cli/pull/1548))
- build(deps): `golang.org/x/net` from 0.44.0 to 0.45.0 ([#1548](https://github.com/fastly/cli/pull/1548))
- build(deps): `golang.org/x/oauth2` from 0.31.0 to 0.32.0 ([#1548](https://github.com/fastly/cli/pull/1548))
- build(deps): `golang.org/x/text` from 0.29.0 to 0.30.0 ([#1548](https://github.com/fastly/cli/pull/1548))
- build(deps): `actions/setup-node` from 5 to 6 ([#1559](https://github.com/fastly/cli/pull/1559))
- build(deps): `actions/download-artifact` from 4 to 5 ([#1559](https://github.com/fastly/cli/pull/1559))
- build(deps): `github.com/klauspost/compress` from 1.18.0 to 1.18.1 ([#1558](https://github.com/fastly/cli/pull/1558))
- build(deps): `golang.org/x/net` from 0.45.0 to 0.46.0 ([#1558](https://github.com/fastly/cli/pull/1558))
- build(deps): `github.com/clipperhouse/uax29/v2` from 2.2.0 to 2.3.0 ([#1564](https://github.com/fastly/cli/pull/1564))
- build(deps): `actions/upload-artifact` from 4 to 5 ([#1565](https://github.com/fastly/cli/pull/1565))
- build(deps): `actions/download-artifact` from 5 to 6 ([#1565](https://github.com/fastly/cli/pull/1565))

## [v12.1.0](https://github.com/fastly/cli/releases/tag/v12.1.0) (2025-09-30)

### Breaking:

### Enhancements:

- feat(manifest): Enable loading Secret Store configuration through environment variables ([#1540](https://github.com/fastly/cli/pull/1540))
- feat(products): Add enable/disable support for API Discovery ([#1543](https://github.com/fastly/cli/pull/1543))

### Bug fixes:

### Dependencies:

- build(deps): `golang.org/x/net` from 0.43.0 to 0.44.0 ([#1538](https://github.com/fastly/cli/pull/1538))
- build(deps): `github.com/fastly/go-fastly/v11` from 11.3.1 to 12.0.0 ([#1541](https://github.com/fastly/cli/pull/1541))
- build(deps): `github.com/mattn/go-runewidth` from 0.0.16 to 0.0.19 ([#1542](https://github.com/fastly/cli/pull/1542))
- build(deps): `github.com/fastly/go-fastly/v11` from 11.3.1 to 12.0.0 ([#1541](https://github.com/fastly/cli/pull/1541))

## [v12.0.0](https://github.com/fastly/cli/releases/tag/v12.0.0) (2025-09-10)

### Breaking:

- breaking(kvstoreentry): The 'describe' command now returns only key attributes (ie: generation, metadata) instead of a given key's value ([#1529](https://github.com/fastly/cli/pull/1529))

### Enhancements:

- feat(logging): Add support for 'CompressionCodec' and 'GzipLevel' attribute to the HTTPS endpoint.
- feat(kvstoreentry): Add support for the 'prefix' parameter for List operations ([#1526](https://github.com/fastly/cli/pull/1526))
- feat(kvstoreentry): Add support for the add, append, prepend, metadata, if_generation_match, and background_fetch 'create' command operations ([#1529](https://github.com/fastly/cli/pull/1529))
- feat(kvstoreentry): Add support for the if_generation_match and metadata 'describe' command operations ([#1529](https://github.com/fastly/cli/pull/1529))
- feat(kvstoreentry): Add support for the if_generation_match and force 'delete' command operations ([#1529](https://github.com/fastly/cli/pull/1529))
- feat(kvstoreentry): Add the 'get' command operation which obtains the value of the item ([#1529](https://github.com/fastly/cli/pull/1529))
- feat(logging/https): Add support for 'Period' attribute. ([#1537](https://github.com/fastly/cli/pull/1537))

### Bug fixes:

- fix(manifest): Ensure pushpin section is persisted during manifest file update ([#1535](https://github.com/fastly/cli/pull/1535))

### Dependencies:

- build(deps): `github.com/ulikunitz/xz` from 0.5.12 to 0.5.13 ([#1524](https://github.com/fastly/cli/pull/1524))
- build(deps): `github.com/stretchr/testify` from 1.10.0 to 1.11.0 ([#1527](https://github.com/fastly/cli/pull/1527))
- build(deps): `github.com/ulikunitz/xz` from 0.5.13 to 0.5.14 ([#1528](https://github.com/fastly/cli/pull/1528))
- build(deps): `github.com/stretchr/testify` from 1.11.0 to 1.11.1 ([#1530](https://github.com/fastly/cli/pull/1530))
- build(deps): `github.com/ulikunitz/xz` from 0.5.14 to 0.5.15 ([#1530](https://github.com/fastly/cli/pull/1530))
- build(deps): `actions/setup-node` from 4 to 5 ([#1534](https://github.com/fastly/cli/pull/1534))
- build(deps): `actions/setup-go` from 5 to 6 ([#1534](https://github.com/fastly/cli/pull/1534))
- build(deps): `golang.org/x/sys` from 0.35.0 to 0.36.0 ([#1533](https://github.com/fastly/cli/pull/1533))
- build(deps): `golang.org/x/term` from 0.34.0 to 0.35.0 ([#1533](https://github.com/fastly/cli/pull/1533))
- build(deps): `github.com/fastly/go-fastly/v11` from 11.3.0 to 11.3.1 ([#1533](https://github.com/fastly/cli/pull/1533))
- build(deps): `golang.org/x/crypto` from 0.41.0 to 0.42.0 ([#1533](https://github.com/fastly/cli/pull/1533))
- build(deps): `golang.org/x/mod` from 0.27.0 to 0.28.0 ([#1533](https://github.com/fastly/cli/pull/1533))
- build(deps): `golang.org/x/oauth2` from 0.30.0 to 0.31.0 ([#1533](https://github.com/fastly/cli/pull/1533))
- build(deps): `golang.org/x/sync` from 0.16.0 to 0.17.0 ([#1533](https://github.com/fastly/cli/pull/1533))
- build(deps): `golang.org/x/text` from 0.28.0 to 0.29.0 ([#1533](https://github.com/fastly/cli/pull/1533))

## [v11.5.0](https://github.com/fastly/cli/releases/tag/v11.5.0) (2025-08-20)

### Enhancements:

- feat(vcl): Allow showing of generated VCL for a service version [#1498](https://github.com/fastly/cli/pull/1498)
- feat(compute/serve): Add experimental "enable Pushpin" mode ([#1509](https://github.com/fastly/cli/pull/1509), [#1520](https://github.com/fastly/cli/pull/1520))
- feat(object-storage): improve access-keys list output ([#1513](https://github.com/fastly/cli/pull/1513))
- refactor(domainv1,tools): use updated go-fastly domainmanagement imports and types ([#1517](https://github.com/fastly/cli/pull/1517))
- feat(imageoptimizerdefaults): Support for retrieving and updating Image Optimizer defaults for a given VCL service ([#1518](https://github.com/fastly/cli/pull/1518))

### Dependencies:

- build(deps): `github.com/fastly/go-fastly/v11` from 10 to 11 ([#1514](https://github.com/fastly/cli/pull/1514))
- build(deps): `golang.org/x/sys` from 0.33.0 to 0.34.0 ([#1508](https://github.com/fastly/cli/pull/1508))
- build(deps): `golang.org/x/term` from 0.32.0 to 0.33.0 ([#1508](https://github.com/fastly/cli/pull/1508))
- build(deps): `golang.org/x/crypto` from 0.39.0 to 0.40.0 ([#1508](https://github.com/fastly/cli/pull/1508))
- build(deps): `golang.org/x/mod` from 0.25.0 to 0.26.0 ([#1508](https://github.com/fastly/cli/pull/1508))
- build(deps): `golang.org/x/net` from 0.41.0 to 0.42.0 ([#1508](https://github.com/fastly/cli/pull/1508))
- build(deps): `golang.org/x/sync` from 0.15.0 to 0.16.0 ([#1508](https://github.com/fastly/cli/pull/1508))
- build(deps): `golang.org/x/text` from 0.26.0 to 0.27.0 ([#1508](https://github.com/fastly/cli/pull/1508))
- build(deps): `github.com/coreos/go-oidc/v3` from 3.14.1 to 3.15.0 ([#1510](https://github.com/fastly/cli/pull/1510))
- build(deps): `golang.org/x/sys` from 0.34.0 to 0.35.0 ([#1516](https://github.com/fastly/cli/pull/1516))
- build(deps): `golang.org/x/term` from 0.33.0 to 0.34.0 ([#1516](https://github.com/fastly/cli/pull/1516))
- build(deps): `github.com/hashicorp/cap` from 0.9.0 to 0.10.0 ([#1516](https://github.com/fastly/cli/pull/1516))
- build(deps): `golang.org/x/crypto` from 0.40.0 to 0.41.0 ([#1516](https://github.com/fastly/cli/pull/1516))
- build(deps): `golang.org/x/mod` from 0.26.0 to 0.27.0 ([#1516](https://github.com/fastly/cli/pull/1516))
- build(deps): `golang.org/x/net` from 0.42.0 to 0.43.0 ([#1516](https://github.com/fastly/cli/pull/1516))
- build(deps): `golang.org/x/text` from 0.27.0 to 0.28.0 ([#1516](https://github.com/fastly/cli/pull/1516))
- build(deps): `actions/checkout` from 4 to 5 ([#1515](https://github.com/fastly/cli/pull/1515))
- build(deps): `actions/download-artifact` from 4 to 5 ([#1515](https://github.com/fastly/cli/pull/1515))

## [v11.4.0](https://github.com/fastly/cli/releases/tag/v11.4.0) (2025-07-09)

### Enhancements:

- feat(env): Add environment variable for extending the UserAgent string. ([#1502](https://github.com/fastly/cli/pull/1502))

### Bug fixes:

- fix(sso): Ensure that OPTIONS requests sent by browsers do not break SSO authentication. ([#1496](https://github.com/fastly/cli/pull/1496))

### Dependencies:

- build(deps): `github.com/fastly/go-fastly/v10` from 10.3.0 to 10.4.0 ([#1499](https://github.com/fastly/cli/pull/1499))
- build(deps): `stefanzweifel/git-auto-commit-action` from 5 to 6 ([#1497](https://github.com/fastly/cli/pull/1497))
- build(deps): `github.com/fastly/go-fastly/v10` from 10.4.0 to 10.5.0 ([#1501](https://github.com/fastly/cli/pull/1501))
- build(deps): `github.com/andybalholm/brotli` from 1.1.1 to 1.2.0 ([#1501](https://github.com/fastly/cli/pull/1501))
- build(deps): `github.com/Masterminds/semver/v3` from 3.3.1 to 3.4.0 ([#1503](https://github.com/fastly/cli/pull/1503))
- build(deps): `github.com/fastly/go-fastly/v10` from 10.5.0 to 10.5.1 ([#1504](https://github.com/fastly/cli/pull/1504))

## [v11.3.0](https://github.com/fastly/cli/releases/tag/v11.3.0) (2025-06-11)

### Enhancements:

- feat(config-store): Allow for dynamic limits on Config Store entry lengths ([#1485](https://github.com/fastly/cli/pull/1485))
- feat(backend): Add support for 'prefer IPv6' attribute. ([#1487](https://github.com/fastly/cli/pull/1487))
- feat(tools/domain): add `suggest` and `status` domain tools endpoints ([#1482](https://github.com/fastly/cli/pull/1482))
- feat(logging): Add support for 'processing region' attribute. ([#1491](https://github.com/fastly/cli/pull/1491))
- feat(domains): add `description` to `domainv1` endpoints ([#1483](https://github.com/fastly/cli/pull/1483))

### Bug fixes:

- fix(sso): Don't display the token after authentication. ([#1490](https://github.com/fastly/cli/pull/1490))
- fix(service-version): Stop hiding the 'stage' and 'unstage' commands. ([#1492](https://github.com/fastly/cli/pull/1492))

### Dependencies:

- build(deps): `github.com/fastly/go-fastly/v10` from 10.0.1 to 10.1.0 ([#1476](https://github.com/fastly/cli/pull/1476))
- build(deps): `github.com/fastly/go-fastly/v10` from 10.0.0 to 10.0.1 ([#1467](https://github.com/fastly/cli/pull/1467))
- build(deps): `golang.org/x/net` from 0.37.0 to 0.39.0 ([#1467](https://github.com/fastly/cli/pull/1467))
- build(go.mod): upgrade to go 1.24.0 in order to take advantage of the new tooling mechanism ([#1469](https://github.com/fastly/cli/pull/1469))
- build(deps): `golang.org/x/image` from 0.15.0 to 0.18.0 ([#1470](https://github.com/fastly/cli/pull/1470))
- build(deps): `github.com/magiconair/properties` from 1.8.7 to 1.8.10 ([#1474](https://github.com/fastly/cli/pull/1474))
- build(deps): `golang.org/x/sys` from 0.32.0 to 0.33.0 ([#1472](https://github.com/fastly/cli/pull/1472))
- build(deps): `cel.dev/expr` from 0.22.1 to 0.23.1 ([#1472](https://github.com/fastly/cli/pull/1472))
- build(deps): `cloud.google.com/go` from 0.120.0 to 0.121.0 ([#1472](https://github.com/fastly/cli/pull/1472))
- build(deps): `cloud.google.com/go/ai` from 0.8.0 to 0.11.0 ([#1472](https://github.com/fastly/cli/pull/1472))
- build(deps): `cloud.google.com/go/auth` from 0.15.0 to 0.16.0 ([#1472](https://github.com/fastly/cli/pull/1472))
- build(deps): `cloud.google.com/go/iam` from 1.4.2 to 1.5.0 ([#1472](https://github.com/fastly/cli/pull/1472))
- build(deps): `cloud.google.com/go/kms` from 1.21.1 to 1.21.2 ([#1472](https://github.com/fastly/cli/pull/1472))
- build(deps): `cloud.google.com/go/longrunning` from 0.6.6 to 0.6.7 ([#1472](https://github.com/fastly/cli/pull/1472))
- build(deps): `cloud.google.com/go/monitoring` from 1.24.1 to 1.24.2 ([#1472](https://github.com/fastly/cli/pull/1472))
- build(deps): `cloud.google.com/go/storage` from 1.51.0 to 1.52.0 ([#1472](https://github.com/fastly/cli/pull/1472))
- build(deps): `github.com/42wim/httpsig` from 1.2.2 to 1.2.3 ([#1472](https://github.com/fastly/cli/pull/1472))
- build(deps): `github.com/Azure/azure-sdk-for-go/sdk/azcore` from 1.17.1 to 1.18.0 ([#1472](https://github.com/fastly/cli/pull/1472))
- build(deps): `github.com/Azure/azure-sdk-for-go/sdk/azidentity` from 1.8.2 to 1.9.0 ([#1472](https://github.com/fastly/cli/pull/1472))
- build(deps): `github.com/fastly/go-fastly/v10` from 10.1.0 to 10.2.0 ([#1481](https://github.com/fastly/cli/pull/1481))
- build(deps): `github.com/fastly/go-fastly/v10` from 10.2.0 to 10.3.0 ([#1488](https://github.com/fastly/cli/pull/1488))
- build(deps): `golang.org/x/mod` from 0.24.0 to 0.25.0 ([#1488](https://github.com/fastly/cli/pull/1488))
- build(deps): `golang.org/x/sync` from 0.14.0 to 0.15.0 ([#1488](https://github.com/fastly/cli/pull/1488))
- build(deps): `golang.org/x/text` from 0.25.0 to 0.26.0 ([#1488](https://github.com/fastly/cli/pull/1488))
- build(deps): `golang.org/x/crypto` from 0.38.0 to 0.39.0 ([#1489](https://github.com/fastly/cli/pull/1489))
- build(deps): `golang.org/x/net` from 0.40.0 to 0.41.0 ([#1489](https://github.com/fastly/cli/pull/1489))

## [v11.2.0](https://github.com/fastly/cli/releases/tag/v11.2.0) (2025-04-10)

### Enhancements:

- feat(config): Support file/format for kv_store and secret_store in fastly.toml
- feat(config): Support metadata for kv_store in fastly.toml
- feat(logging): add support for passing a filepath as an argument for format in logging commands

### Bug fixes:

- fix(language/rust): Check for wasm32-wasi output from build process and inform user how to reconfigure their project. [#1458](https://github.com/fastly/cli/pull/1458)

### Dependencies:

- dep(go.mod): upgrade go-fastly from v9 to v10 [#1448](https://github.com/fastly/cli/pull/1448)
- build(deps): `golang.org/x/oauth2` from 0.28.0 to 0.29.0 ([#1451](https://github.com/fastly/cli/pull/1451))
- build(deps): `golang.org/x/sys` from 0.31.0 to 0.32.0 ([#1454](https://github.com/fastly/cli/pull/1454))
- build(deps): `github.com/fsnotify/fsnotify` from 1.8.0 to 1.9.0 ([#1450](https://github.com/fastly/cli/pull/1450))
- build(deps): `golang.org/x/term` from 0.30.0 to 0.31.0 ([#1455](https://github.com/fastly/cli/pull/1455))
- build(deps): `golang.org/x/crypto` from 0.36.0 to 0.37.0 ([#1453](https://github.com/fastly/cli/pull/1453))
- build(deps): `github.com/coreos/go-oidc/v3` from 3.13.0 to 3.14.1 ([#1456](https://github.com/fastly/cli/pull/1456))
- build(deps): `actions/create-github-app-token` from 1 to 2 ([#1449](https://github.com/fastly/cli/pull/1449))

## [v11.1.0](https://github.com/fastly/cli/releases/tag/v11.1.0) (2025-03-27)

### Bug fixes:

- fix(logging): revert removal of placement param [#1444](https://github.com/fastly/cli/pull/1444)

## [v11.0.0](https://github.com/fastly/cli/releases/tag/v11.0.0) (2025-03-25)

### Breaking:

- breaking(logging): The 'placement' parameter to the logging commands
  has been removed; it was only used in combination with the Fastly
  WAF, which is no longer supported.
  [#1419](https://github.com/fastly/cli/pull/1419)
- breaking(language.rust): Switch Rust builds to wasm32-wasip1 instead of wasm32-wasi [#1382](https://github.com/fastly/cli/pull/1382)
- breaking(language.assemblyscript): Remove support for AssemblyScript [#1001](https://github.com/fastly/cli/pull/1001)
- breaking(compute/pack): use package name from manifest [#1025](https://github.com/fastly/cli/pull/1025)

### Enhancements:

- fix(compute/init): Updates for renamed TypeScript default starter kit [#1405](https://github.com/fastly/cli/pull/1405)
- feat(objectstorage/accesskeys): add support for access keys [#1428](https://github.com/fastly/cli/pull/1428)

### Dependencies

- build(deps): upgrade Go from 1.22 to 1.23 ([#624](https://github.com/fastly/cli/pull/1414))
- build(deps): `github.com/rogpeppe/go-internal` from 1.13.1 to 1.14.1 ([#1416](https://github.com/fastly/cli/pull/1416))
- build(deps): `golang.org/x/crypto` from 0.33.0 to 0.35.0 ([#1417](https://github.com/fastly/cli/pull/1417))
- build(deps): `github.com/go-jose/go-jose/v4` from 4.0.4 to 4.0.5 ([#1412](https://github.com/fastly/cli/pull/1412))
- build(deps): `github.com/klauspost/compress` from 1.17.11 to 1.18.0 ([#1411](https://github.com/fastly/cli/pull/1411))
- build(deps): `github.com/google/go-cmp` from 0.6.0 to 0.7.0 ([#1409](https://github.com/fastly/cli/pull/1409))
- build(deps): `golang.org/x/oauth2` from 0.26.0 to 0.27.0 ([#1421](https://github.com/fastly/cli/pull/1421))
- build(deps): `github.com/hashicorp/cap` from 0.8.0 to 0.9.0 ([#1422](https://github.com/fastly/cli/pull/1422))
- build(deps): `github.com/fastly/go-fastly/v9` from 9.13.1 to 9.14.0 ([#1433](https://github.com/fastly/cli/pull/1433))
- build(deps): `golang.org/x/crypto` from 0.35.0 to 0.36.0 ([#1430](https://github.com/fastly/cli/pull/1430))
- build(deps): `golang.org/x/oauth2` from 0.27.0 to 0.28.0 ([#1432](https://github.com/fastly/cli/pull/1432))
- build(deps): `golang.org/x/net` from 0.35.0 to 0.37.0 ([#1439](https://github.com/fastly/cli/pull/1439))
- build(deps): `github.com/golang/snappy` from 0.0.4 to 1.0.0 ([#1438](https://github.com/fastly/cli/pull/1438))
- build(deps): `golang.org/x/mod` from 0.23.0 to 0.24.0 ([#1437](https://github.com/fastly/cli/pull/1437))
- build(deps): `github.com/coreos/go-oidc/v3` from 3.12.0 to 3.13.0 ([#1442](https://github.com/fastly/cli/pull/1442))

## [v10.19.0](https://github.com/fastly/cli/releases/tag/v10.19.0) (2025-02-18)

**Enhancements:**

- feat(computeacl): add support for compute platform ACLs [#1388](https://github.com/fastly/cli/pull/1388)

**Dependencies:**

- build(deps): bump golang.org/x/net from 0.34.0 to 0.35.0 [#1394](https://github.com/fastly/cli/pull/1394)
- build(deps): bump golang.org/x/crypto from 0.32.0 to 0.33.0 [#1391](https://github.com/fastly/cli/pull/1391)
- build(deps): bump golang.org/x/term from 0.28.0 to 0.29.0[#1393](https://github.com/fastly/cli/pull/1393)
- build(deps): bump golang.org/x/oauth2 from 0.25.0 to 0.26.0 [#1390](https://github.com/fastly/cli/pull/1390)
- build(deps): bump github.com/fastly/go-fastly/v9 from 9.13.0 to 9.13.1 [#1388](https://github.com/fastly/cli/pull/1388)

## [v10.18.0](https://github.com/fastly/cli/releases/tag/v10.18.0) (2025-01-29)

**Enhancements:**

- feat(domains): add support for v1 functionality [#1374](https://github.com/fastly/cli/pull/1374)
- feat(dashboard): add support for Observability custom dashboards [#1357](https://github.com/fastly/cli/pull/1357)

**Bug fixes:**

- fix(npm): fix build checks for JavaScript code [#1354](https://github.com/fastly/cli/pull/1354)
- fix(build): pin Rust to 1.83.0 [#1368](https://github.com/fastly/cli/pull/1368)
- fix(build): correct generation of static configuration file [#1378](https://github.com/fastly/cli/pull/1378)
- fix(kvstoreentry/create): rework --dir flag [#1371](https://github.com/fastly/cli/pull/1371)

**Dependencies:**

- build(deps): bump golang.org/x/crypto from 0.31.0 to 0.32.0 [#1366](https://github.com/fastly/cli/pull/1366)
- build(deps): bump golang.org/x/text from 0.20.0 to 0.21.0 [#1360](https://github.com/fastly/cli/pull/1360)
- build(deps): bump github.com/otiai10/copy from 1.14.0 to 1.14.1 [#1364](https://github.com/fastly/cli/pull/1364)
- build(deps): bump github.com/hashicorp/cap from 0.7.0 to 0.8.0 [#1365](https://github.com/fastly/cli/pull/1365)
- build(deps): bump golang.org/x/net from 0.27.0 to 0.33.0 [#1370](https://github.com/fastly/cli/pull/1370)
- build(deps): bump github.com/rogpeppe/go-internal from 1.11.0 to 1.13.1 [#1379](https://github.com/fastly/cli/pull/1379)
- build(deps): bump github.com/dustinkirkland/golang-petname from 20240428194347 to eebcea082ee0 [#1377](https://github.com/fastly/cli/pull/1377)

## [v10.17.1](https://github.com/fastly/cli/releases/tag/v10.17.1) (2024-12-04)

**Bug fixes:**

- fix(sso): Ensure that only one authentication cycle is started. [#1355](https://github.com/fastly/cli/pull/1355)

**Dependencies:**

- build(deps): bump github.com/Masterminds/semver/v3 from 3.3.0 to 3.3.1 [#1352](https://github.com/fastly/cli/pull/1352)

## [v10.17.0](https://github.com/fastly/cli/releases/tag/v10.17.0) (2024-11-20)

**Enhancements:**

- feat(compute/build): Support 'upper bound' constraints on Rust versions. [#1350](https://github.com/fastly/cli/pull/1350)

**Bug fixes:**

- fix(compute/init): Init no longer fails if directory of same name as starter kit exists in current directory [#1349](https://github.com/fastly/cli/pull/1349)

## [v10.16.0](https://github.com/fastly/cli/releases/tag/v10.16.0) (2024-11-12)

**Enhancements:**

- Publish to GitHub packages in addition to npmjs [#1330](https://github.com/fastly/cli/pull/1330)
- feat(logging): Add support for Grafana Cloud Logs. [#1333](https://github.com/fastly/cli/pull/1333)
- feat(profile/token): Allow user to specify how long token must be valid. [#1340](https://github.com/fastly/cli/pull/1340)
- feat(products): Add support for Log Explorer & Insights. [#1341](https://github.com/fastly/cli/pull/1341)

**Bug fixes:**

- breaking(products): Remove support for NGWAF product. [#1338](https://github.com/fastly/cli/pull/1338)
- fix(profile/token): 'profile token' command must check the validity of the stored token. [#1339](https://github.com/fastly/cli/pull/1339)
- fix(lint): Update staticcheck and fix identified problems. [#1346](https://github.com/fastly/cli/pull/1346)

**Dependencies:**

- build(deps): bump golang.org/x/term from 0.24.0 to 0.25.0 [#1324](https://github.com/fastly/cli/pull/1324)
- build(deps): bump golang.org/x/crypto from 0.27.0 to 0.28.0 [#1325](https://github.com/fastly/cli/pull/1325)
- build(deps): bump github.com/fatih/color from 1.17.0 to 1.18.0 [#1331](https://github.com/fastly/cli/pull/1331)
- build(deps): bump github.com/fsnotify/fsnotify from 1.7.0 to 1.8.0 [#1334](https://github.com/fastly/cli/pull/1334)
- build(deps): Update to go-fastly v9.12.0. [#1337](https://github.com/fastly/cli/pull/1337)
- build(deps): bump golang.org/x/term from 0.25.0 to 0.26.0 [#1342](https://github.com/fastly/cli/pull/1342)
- build(deps): bump golang.org/x/crypto from 0.28.0 to 0.29.0 [#1343](https://github.com/fastly/cli/pull/1343)
- build(deps): bump golang.org/x/text from 0.19.0 to 0.20.0 [#1344](https://github.com/fastly/cli/pull/1344)
- build(deps): bump golang.org/x/mod from 0.21.0 to 0.22.0 [#1345](https://github.com/fastly/cli/pull/1345)

## [v10.15.0](https://github.com/fastly/cli/releases/tag/v10.15.0) (2024-10-03)

**Enhancements:**

- feat(products): Add support for NGWAF product [#1322](https://github.com/fastly/cli/pull/1322)

**Dependencies:**

- build(deps): Upgrade to go-fastly 9.11.0. [#1322](https://github.com/fastly/cli/pull/1322)

## [v10.14.1](https://github.com/fastly/cli/releases/tag/v10.14.1) (2024-09-16)

**Bug fixes:**

- fix(tls/subscription): Recognise Certainly CA as an option when creating TLS subscriptions. [#1315](https://github.com/fastly/cli/pull/1315)

## [v10.14.0](https://github.com/fastly/cli/releases/tag/v10.14.0) (2024-09-10)

**Enhancements:**

- feat(npm): Add TypeScript types to @fastly/cli [#1296](https://github.com/fastly/cli/pull/1296)
- feat(products): Add support for Fastly Bot Management product. [#1300](https://github.com/fastly/cli/pull/1300)

**Bug fixes:**

- fix(compute/publish): Don't change directory twice during execution. [#1295](https://github.com/fastly/cli/pull/1295)
- feat(npm): Properly handle error from npm-invoked cli [#1302](https://github.com/fastly/cli/pull/1302)

**Dependencies:**

- build(deps): bump github.com/Masterminds/semver/v3 from 3.2.1 to 3.3.0 [#1306](https://github.com/fastly/cli/pull/1306)
- build(deps): bump golang.org/x/text from 0.17.0 to 0.18.0 [#1309](https://github.com/fastly/cli/pull/1309)
- build(deps): bump golang.org/x/term from 0.23.0 to 0.24.0 [#1310](https://github.com/fastly/cli/pull/1310)
- build(deps): bump golang.org/x/crypto from 0.26.0 to 0.27.0 [#1311](https://github.com/fastly/cli/pull/1311)
- build(deps): bump golang.org/x/mod from 0.20.0 to 0.21.0 [#1312](https://github.com/fastly/cli/pull/1312)

## [v10.13.3](https://github.com/fastly/cli/releases/tag/v10.13.3) (2024-08-15)

This release does not contain any code changes, but was made in order
to trigger the new 'NPM release' workflow after resolving some flaws
in that workflow.

## [v10.13.2](https://github.com/fastly/cli/releases/tag/v10.13.2) (2024-08-15)

This release does not contain any code changes, but was made in order
to trigger the new 'NPM release' workflow after resolving an
authentication flaw in that workflow.

## [v10.13.1](https://github.com/fastly/cli/releases/tag/v10.13.1) (2024-08-14)

This release does not contain any code changes, but was made in order
to trigger the new 'NPM release' workflow.

## [v10.13.0](https://github.com/fastly/cli/releases/tag/v10.13.0) (2024-08-14)

**Enhancements:**

- feat(tls): add optional `--key-path` parameter to `tls-custom private-key create` command [#1215](https://github.com/fastly/cli/pull/1215)
- feat: add debug-mode around all network requests [#1239](https://github.com/fastly/cli/pull/1239)
- logtail: add --timestamps flag [#1254](https://github.com/fastly/cli/pull/1254)
- Distribute binaries via npm module [#1269](https://github.com/fastly/cli/pull/1269)
- Enable quiet mode when `--json` flag is supplied [#1271](https://github.com/fastly/cli/pull/1271)
- Support configuring connection keepalive parameters [#1275](https://github.com/fastly/cli/pull/1275)

**Bug fixes:**

- fix(update): Ensure that the CLI binary will be executable after an update [#1244](https://github.com/fastly/cli/pull/1244)
- fix(service-version): Allow 'locked' services to be activated. [#1245](https://github.com/fastly/cli/pull/1245)
- fix(compute/serve): don't fail the serve workflow if github errors [#1246](https://github.com/fastly/cli/pull/1246)
- fix(all commands): --service-name flag should have priority. [#1264](https://github.com/fastly/cli/pull/1264)
- fix(products): Display product names in API style [#1270](https://github.com/fastly/cli/pull/1270)

**Dependencies:**

- build(deps): bump goreleaser/goreleaser-action from 5 to 6 [#1220](https://github.com/fastly/cli/pull/1220)
- build(deps): bump golang.org/x/text from 0.15.0 to 0.16.0 [#1222](https://github.com/fastly/cli/pull/1222)
- build(deps): bump golang.org/x/mod from 0.17.0 to 0.18.0 [#1223](https://github.com/fastly/cli/pull/1223)
- build(deps): bump golang.org/x/term from 0.20.0 to 0.21.0 [#1224](https://github.com/fastly/cli/pull/1224)
- build(deps): bump golang.org/x/crypto from 0.23.0 to 0.24.0 [#1225](https://github.com/fastly/cli/pull/1225)
- build(deps): bump github.com/fastly/go-fastly/v9 from 9.5.0 to 9.7.0 [#1235](https://github.com/fastly/cli/pull/1235)
- build(deps): bump golang.org/x/term from 0.21.0 to 0.22.0 [#1240](https://github.com/fastly/cli/pull/1240)
- build(deps): bump golang.org/x/crypto from 0.24.0 to 0.25.0 [#1241](https://github.com/fastly/cli/pull/1241)
- build(deps): bump golang.org/x/mod from 0.18.0 to 0.19.0 [#1242](https://github.com/fastly/cli/pull/1242)
- build(deps): 'tomlq' package now installs a 'tq' binary [#1243](https://github.com/fastly/cli/pull/1243)
- build(deps): bump github.com/hashicorp/cap from 0.6.0 to 0.7.0 [#1272](https://github.com/fastly/cli/pull/1272)
- build(deps): bump golang.org/x/mod from 0.19.0 to 0.20.0 [#1273](https://github.com/fastly/cli/pull/1273)
- build(deps): bump golang.org/x/text from 0.16.0 to 0.17.0 [#1281](https://github.com/fastly/cli/pull/1281)
- build(deps): bump golang.org/x/crypto from 0.25.0 to 0.26.0 [#1282](https://github.com/fastly/cli/pull/1282)
- build(deps): bump golang.org/x/term from 0.22.0 to 0.23.0 [#1283](https://github.com/fastly/cli/pull/1283)

## [v10.12.3](https://github.com/fastly/cli/releases/tag/v10.12.3) (2024-06-14)

**Bug fixes:**

- fix(sso): correct the behaviour for direct sso invocation [#1230](https://github.com/fastly/cli/pull/1230)
- fix(compute/deploy): dereference service number pointer [#1231](https://github.com/fastly/cli/pull/1231)
- fix(sso): update output to reflect default profile behaviour [#1232](https://github.com/fastly/cli/pull/1232)

## [v10.12.2](https://github.com/fastly/cli/releases/tag/v10.12.2) (2024-06-13)

**Bug fixes:**

- fix(sso): re-auth on profile switch + support MAUA [#1226](https://github.com/fastly/cli/pull/1226)

## [v10.12.1](https://github.com/fastly/cli/releases/tag/v10.12.1) (2024-06-10)

**Enhancements:**

- expose SSO commands and flags [#1218](https://github.com/fastly/cli/pull/1218)

## [v10.12.0](https://github.com/fastly/cli/releases/tag/v10.12.0) (2024-06-10)

**Enhancements:**

- feat(sso): support active session account switching [#1207](https://github.com/fastly/cli/pull/1207)

## [v10.11.0](https://github.com/fastly/cli/releases/tag/v10.11.0) (2024-06-06)

**Enhancements:**

- feat(app): improve error messaging when Fastly servers are unresponsive [#1212](https://github.com/fastly/cli/pull/1212)
- feat(compute): clone starter kit source with init --from=serviceID [#1213](https://github.com/fastly/cli/pull/1213)
- Adds --cert-path argument to `tls-custom certificate update` command to pass in a path to a certificate file [#1214](https://github.com/fastly/cli/pull/1214)

## [v10.10.0](https://github.com/fastly/cli/releases/tag/v10.10.0) (2024-05-20)

**Enhancements:**

- Adds --cert-path argument to `tls-custom certificate create` command to pass in a path to a certificate file [#1189](https://github.com/fastly/cli/pull/1189)
- feat(observability/alerts): Alerts support [#1192](https://github.com/fastly/cli/pull/1192)
- feat(compute/rust) Handle Cargo config filename for Rust >=1.78.0 [#1199](https://github.com/fastly/cli/pull/1199)
- add project-id to gcs logging setting [#1202](https://github.com/fastly/cli/pull/1202)

**Dependencies:**

- build(deps): bump github.com/fastly/go-fastly/v9 from 9.3.1 to 9.3.2 [#1204](https://github.com/fastly/cli/pull/1204)
- build(deps): bump github.com/fatih/color from 1.16.0 to 1.17.0 [#1205](https://github.com/fastly/cli/pull/1205)

## [v10.9.0](https://github.com/fastly/cli/releases/tag/v10.9.0) (2024-05-08)

**Enhancements:**

- chore: grammar and capitalization fixes for KV Store commands [#1178](https://github.com/fastly/cli/pull/1178)
- feat(kvstores): add support for specifying location when creating KV stores [#1182](https://github.com/fastly/cli/pull/1182)
- feat(compute/build): support wasm-tools installed into `$PATH` [#1183](https://github.com/fastly/cli/pull/1183)
- feat(compute/serve): support arbitrary arguments to Viceroy [#1186](https://github.com/fastly/cli/pull/1186)
- ci: update tinygo version used in tests [#1188](https://github.com/fastly/cli/pull/1188)
- feat(compute/init): allow `--from` to take a Service ID [#1187](https://github.com/fastly/cli/pull/1187)

**Bug fixes:**

- fix(kvstore): delete all keys [#1181](https://github.com/fastly/cli/pull/1181)
- fix(compute/rust) handling of 'cargo version' output [#1197](https://github.com/fastly/cli/pull/1197)
- fix(compute/serve): skip build if `--file` set [#1200](https://github.com/fastly/cli/pull/1200)

**Dependencies:**

- build(deps): bump github.com/fastly/go-fastly/v9 from 9.2.1 to 9.2.2 [#1180](https://github.com/fastly/cli/pull/1180)
- build(deps): bump golang.org/x/crypto from 0.22.0 to 0.23.0 [#1194](https://github.com/fastly/cli/pull/1194)

## [v10.8.10](https://github.com/fastly/cli/releases/tag/v10.8.10) (2024-04-10)

**Dependencies:**

- build(deps): bump golang.org/x/crypto from 0.21.0 to 0.22.0 [#1173](https://github.com/fastly/cli/pull/1173)
- build(deps): bump golang.org/x/mod from 0.16.0 to 0.17.0 [#1175](https://github.com/fastly/cli/pull/1175)

## [v10.8.9](https://github.com/fastly/cli/releases/tag/v10.8.9) (2024-03-27)

**Bug fixes:**

- fix(stats/historical): avoid runtime SIGSEGV [#1169](https://github.com/fastly/cli/pull/1169)

## [v10.8.8](https://github.com/fastly/cli/releases/tag/v10.8.8) (2024-03-15)

**Enhancements:**

- feat(logging/scalyr): add project-id [#1166](https://github.com/fastly/cli/pull/1166)
- Update all URLs for developer.fastly.com to their new forms [#1164](https://github.com/fastly/cli/pull/1164)

**Dependencies:**

- build(deps): bump google.golang.org/protobuf from 1.28.1 to 1.33.0 [#1158](https://github.com/fastly/cli/pull/1158)

## [v10.8.7](https://github.com/fastly/cli/releases/tag/v10.8.7) (2024-03-14)

**Bug fixes:**

- fix(text): deref pointers [#1161](https://github.com/fastly/cli/pull/1161)
- fix(compute/serve): let wasm-tools fail more gracefully [#1160](https://github.com/fastly/cli/pull/1160)
- fix(compute/serve): support Windows [#1159](https://github.com/fastly/cli/pull/1159)

**Enhancements:**

- refactor: avoid duplicate path strings [#1162](https://github.com/fastly/cli/pull/1162)

## [v10.8.6](https://github.com/fastly/cli/releases/tag/v10.8.6) (2024-03-12)

**Dependencies:**

- build(deps): bump golang.org/x/crypto from 0.20.0 to 0.21.0 [#1153](https://github.com/fastly/cli/pull/1153)
- build: bump go-fastly to v9.0.1 [#1155](https://github.com/fastly/cli/pull/1155)
- build(deps): bump actions/setup-go from 4 to 5 [#1106](https://github.com/fastly/cli/pull/1106)
- build(deps): bump github.com/go-jose/go-jose/v3 from 3.0.1 to 3.0.3 [#1149](https://github.com/fastly/cli/pull/1149)
- build(deps): bump actions/download-artifact and actions/upload-artifact from 3 to 4 [#1156](https://github.com/fastly/cli/pull/1156)

## [v10.8.5](https://github.com/fastly/cli/releases/tag/v10.8.5) (2024-03-11)

**Bug fixes:**

- fix(compute/serve): avoid wasm validation when --file is set [#1150](https://github.com/fastly/cli/pull/1150)

**Enhancements:**

- refactor(app): update list of commands that require a token [#1145](https://github.com/fastly/cli/pull/1145)

**Dependencies:**

- build(deps): bump golang.org/x/crypto from 0.19.0 to 0.20.0 [#1146](https://github.com/fastly/cli/pull/1146)
- build(deps): bump golang.org/x/mod from 0.15.0 to 0.16.0 [#1147](https://github.com/fastly/cli/pull/1147)

## [v10.8.4](https://github.com/fastly/cli/releases/tag/v10.8.4) (2024-03-01)

**Bug fixes:**

- fix(compute/build): avoid persisting old metadata [#1142](https://github.com/fastly/cli/pull/1142)

## [v10.8.3](https://github.com/fastly/cli/releases/tag/v10.8.3) (2024-02-21)

**Bug fixes:**

- fix(github): update wasm-tools path [#1136](https://github.com/fastly/cli/pull/1136)
- fix(compute/serve): avoid `text.Output` when dealing with large `bytes.Buffer` [#1138](https://github.com/fastly/cli/pull/1138)

**Enhancements:**

- resolve GitHub linter issues [#1137](https://github.com/fastly/cli/pull/1137)

**Dependencies:**

- build(deps): bump golang.org/x/mod from 0.14.0 to 0.15.0 [#1135](https://github.com/fastly/cli/pull/1135)

## [v10.8.2](https://github.com/fastly/cli/releases/tag/v10.8.2) (2024-02-15)

**Bug fixes:**

- fix: directory switching logic [#1132](https://github.com/fastly/cli/pull/1132)

## [v10.8.1](https://github.com/fastly/cli/releases/tag/v10.8.1) (2024-02-14)

**Bug fixes:**

- fix(compute/build): normalise and bucket heap allocations [#1130](https://github.com/fastly/cli/pull/1130)

**Enhancements:**

- refactor(all): support go-fastly v9 [#1124](https://github.com/fastly/cli/pull/1124)

**Dependencies:**

- build(deps): bump actions/cache from 3 to 4 [#1122](https://github.com/fastly/cli/pull/1122)
- build(deps): bump github.com/hashicorp/cap from 0.3.4 to 0.5.0 [#1128](https://github.com/fastly/cli/pull/1128)
- build(deps): bump golang.org/x/crypto from 0.18.0 to 0.19.0 [#1127](https://github.com/fastly/cli/pull/1127)

## [v10.8.0](https://github.com/fastly/cli/releases/tag/v10.8.0) (2024-01-17)

**Bug fixes:**

- doc(tls/custom): correct flag descriptions [#1116](https://github.com/fastly/cli/pull/1116)
- fix(profile/create): support sso [#1117](https://github.com/fastly/cli/pull/1117)
- fix: update list of commands that require auth server [#1120](https://github.com/fastly/cli/pull/1120)

**Enhancements:**

- feat: install CLI version command [#1104](https://github.com/fastly/cli/pull/1104)
- refactor(cmd): rename package to argparser [#1105](https://github.com/fastly/cli/pull/1105)
- refactor: rename test function names [#1107](https://github.com/fastly/cli/pull/1107)

**Dependencies:**

- build(deps): bump golang.org/x/crypto from 0.15.0 to 0.18.0 [#1119](https://github.com/fastly/cli/pull/1119)

## [v10.7.0](https://github.com/fastly/cli/releases/tag/v10.7.0) (2023-11-30)

The Fastly CLI internal configuration file has `config_version` bumped to version `6`. We've added a new `[wasm-metadata.script_info]` field so that users can omit script info (which comes from the fastly.toml) from the metadata annotated onto their compiled Wasm binaries.

When upgrading to this version of the CLI, and running a command for the first time, the config file should automatically update, but this can also be manually triggered by executing:

```shell
fastly config --reset
```

**Bug fixes:**

- fix: move auth setup so it doesn't run for non-token based commands [#1099](https://github.com/fastly/cli/pull/1099)

**Enhancements:**

- remove(profile/update): APIClientFactory [#1094](https://github.com/fastly/cli/pull/1094)
- feat: switch on metadata collection [#1097](https://github.com/fastly/cli/pull/1097)

## [v10.6.4](https://github.com/fastly/cli/releases/tag/v10.6.4) (2023-11-15)

**Bug fixes:**

- fix(errors): ensure help output is displayed [#1092](https://github.com/fastly/cli/pull/1092)

## [v10.6.3](https://github.com/fastly/cli/releases/tag/v10.6.3) (2023-11-15)

The Fastly CLI internal configuration file has `config_version` bumped to version `5`. We've added a new account endpoint field (used as an override for Single-Sign On testing).

When upgrading to this version of the CLI, and running a command for the first time, the config file should automatically update, but this can also be manually triggered by executing:

```shell
fastly config --reset
```

**Bug fixes:**

- fix(text): prompt colour [#1089](https://github.com/fastly/cli/pull/1089)
- fix(app): allow config override for account endpoint [#1090](https://github.com/fastly/cli/pull/1090)

**Enhancements:**

- feat: support SSO (Single Sign-On) [#1010](https://github.com/fastly/cli/pull/1010)

**Dependencies:**

- build(deps): bump golang.org/x/(crypto|term) [#1088](https://github.com/fastly/cli/pull/1088)

## [v10.6.2](https://github.com/fastly/cli/releases/tag/v10.6.2) (2023-11-09)

**Bug fixes:**

- fix(github): corrections for Windows users downloading wasm-tools [#1083](https://github.com/fastly/cli/pull/1083)
- fix(compute/build): don't block user if wasm-tool fails [#1084](https://github.com/fastly/cli/pull/1084)

**Enhancements:**

- refactor: apply linting fixes [#1080](https://github.com/fastly/cli/pull/1080)
- refactor(compute/serve): replace log.Fatal usage with channel [#1081](https://github.com/fastly/cli/pull/1081)
- refactor(logtail): replace log.Fatal usage with channel [#1081](https://github.com/fastly/cli/pull/1082)

**Dependencies:**

- build(deps): bump golang.org/x/mod from 0.13.0 to 0.14.0 [#1079](https://github.com/fastly/cli/pull/1079)
- build(deps): bump golang.org/x/text from 0.13.0 to 0.14.0 [#1078](https://github.com/fastly/cli/pull/1078)
- build(deps): bump github.com/fatih/color from 1.15.0 to 1.16.0 [#1077](https://github.com/fastly/cli/pull/1077)

## [v10.6.1](https://github.com/fastly/cli/releases/tag/v10.6.1) (2023-11-03)

**Bug fixes:**

- fix(manifest): only reset EnvVars if EnvFile set [#1073](https://github.com/fastly/cli/pull/1073)
- fix(github): check architecture when fetching wasm-tools [#1074](https://github.com/fastly/cli/pull/1074)

## [v10.6.0](https://github.com/fastly/cli/releases/tag/v10.6.0) (2023-11-03)

**Bug fixes:**

- fix(backend): support disabling `ssl-check-cert` [#1055](https://github.com/fastly/cli/pull/1055)

**Enhancements:**

- feat(compute): add metadata subcommand [#1013](https://github.com/fastly/cli/pull/1013)
- feat(telemetry): add wasm-tools wasm binary annotations [#1016](https://github.com/fastly/cli/pull/1016)
- feat: add `--consistency` flag to `kv-store-entry list` command [#1058](https://github.com/fastly/cli/pull/1058)
- feat: add `--debug-mode` [#1056](https://github.com/fastly/cli/pull/1056)
- ci: replace setup-tinygo fork with original [#1057](https://github.com/fastly/cli/pull/1057)

**Dependencies:**

- build(deps): bump github.com/docker/docker [#1060](https://github.com/fastly/cli/pull/1060)
- build(deps): bump google.golang.org/grpc from 1.56.2 to 1.56.3 [#1061](https://github.com/fastly/cli/pull/1061)
- build(deps): bump all go.mod dependencies [#1062](https://github.com/fastly/cli/pull/1062)

## [v10.5.1](https://github.com/fastly/cli/releases/tag/v10.5.1) (2023-10-25)

**Bug fixes:**

- fix(compute/deploy): ignore package comparison error [#1053](https://github.com/fastly/cli/pull/1053)
- remove: trufflehog [#1064](https://github.com/fastly/cli/pull/1064)
- fix(cmd/flags): handle zero length check separately [#1065](https://github.com/fastly/cli/pull/1065)
- fix(compute/deploy): only cleanup service if there is an ID [#1066](https://github.com/fastly/cli/pull/1066)

**Enhancements:**

- refactor(compute/deploy): add setup message for existing service users [#1052](https://github.com/fastly/cli/pull/1052)
- feat(manifest): support env_file [#1067](https://github.com/fastly/cli/pull/1067)
- fix(compute/build): improve redaction logic [#1068](https://github.com/fastly/cli/pull/1068)
- feat(compute/secrets): redact common org secrets [#1069](https://github.com/fastly/cli/pull/1069)

**Dependencies:**

- build(deps): bump github.com/fsnotify/fsnotify from 1.6.0 to 1.7.0 [#1050](https://github.com/fastly/cli/pull/1050)
- build(deps): bump actions/setup-node from 3 to 4 [#1051](https://github.com/fastly/cli/pull/1051)

## [v10.5.0](https://github.com/fastly/cli/releases/tag/v10.5.0) (2023-10-18)

The Fastly CLI internal configuration file has been updated to version `4`, with the only change being the addition of the Fastly [TinyGo Compute Starter Kit](https://github.com/fastly/compute-starter-kit-go-tinygo).

When upgrading to this version of the CLI, and running a command for the first time, the config file should automatically update, but this can also be manually triggered by executing:

```shell
fastly config --reset
```

The other change worth noting is to the parsing of the `fastly.toml` manifest file, which now supports a `file` field inside `[setup.kv_stores.<T>.items]` which can be used in place of the `value` field. Assigning a file path to the `file` field will use the content of the file as the value for the key. See: https://www.fastly.com/documentation/reference/compute/fastly-toml

**Bug fixes:**

- fix(compute/init): `post_init` to support `env_vars` [#1014](https://github.com/fastly/cli/pull/1014)
- fix(app): return error when input is `--` only [#1022](https://github.com/fastly/cli/pull/1022)
- fix(compute/deploy): check package before service clone [#1026](https://github.com/fastly/cli/pull/1026)
- fix: spinner wraps original error [#1029](https://github.com/fastly/cli/pull/1029)
- fix(compute/serve): ensure `--env` files are processed [#1039](https://github.com/fastly/cli/pull/1039)

**Enhancements:**

- add: vcl condition commands [#1008](https://github.com/fastly/cli/pull/1008)
- feat(compute/build): support `env_vars` for JavaScript/Rust [#1012](https://github.com/fastly/cli/pull/1012)
- feat(config): add tinygo starter kit [#1011](https://github.com/fastly/cli/pull/1011)
- feat(compute/serve): support guest profiler under Viceroy [#1019](https://github.com/fastly/cli/pull/1019)
- fix(packaging): Improve metadata in Linux packages [#1021](https://github.com/fastly/cli/pull/1021)
- feat(compute/build): support Cargo Workspaces [#1023](https://github.com/fastly/cli/pull/1023)
- feat(spinner): abstract common pattern [#1024](https://github.com/fastly/cli/pull/1024)
- fix(text): consistent formatting and output alignment [#1030](https://github.com/fastly/cli/pull/1030)
- feat(product_enablement): add `products` command [#1036](https://github.com/fastly/cli/pull/1036)
- fix(compute/serve): update Viceroy guest profile flag [#1033](https://github.com/fastly/cli/pull/1033)
- fix(compute/deploy): support file field for `kv_store` setup [#1040](https://github.com/fastly/cli/pull/1040)
- refactor(compute/deploy): simplify logic flows [#1032](https://github.com/fastly/cli/pull/1032)
- feat(compute/build): allow user to specify project directory to build [#1043](https://github.com/fastly/cli/pull/1043)
- feat(compute/deploy): avoid store conflicts [#1041](https://github.com/fastly/cli/pull/1041)
- feat: support `--env` flag [#1046](https://github.com/fastly/cli/pull/1046)

**Dependencies:**

- build(deps): bump goreleaser/goreleaser-action from 4 to 5 [#1015](https://github.com/fastly/cli/pull/1015)
- build(deps): bump golang.org/x/crypto from 0.12.0 to 0.13.0 [#1009](https://github.com/fastly/cli/pull/1009)
- build(deps): bump actions/checkout from 3 to 4 [#1006](https://github.com/fastly/cli/pull/1006)
- build(deps): bump github.com/fastly/go-fastly/v8 from 8.6.1 to 8.6.2 [#1028](https://github.com/fastly/cli/pull/1028)
- build(deps): bump github.com/otiai10/copy from 1.12.0 to 1.14.0 [#1027](https://github.com/fastly/cli/pull/1027)
- build(deps): bump golang.org/x/crypto from 0.13.0 to 0.14.0 [#1034](https://github.com/fastly/cli/pull/1034)
- build(deps): bump golang.org/x/net from 0.10.0 to 0.17.0 [#1042](https://github.com/fastly/cli/pull/1042)
- build(deps): bump github.com/google/go-cmp from 0.5.9 to 0.6.0 [#1045](https://github.com/fastly/cli/pull/1045)

**Documentation:**

- fix(DEVELOP.MD): clarify Go version requirement and document Rust requirement [#1017](https://github.com/fastly/cli/pull/1017)
- doc(compute/serve): update GetViceroy doc [#1038](https://github.com/fastly/cli/pull/1038)
- branding: Replace all Compute@Edge/C@E references with Compute [#1044](https://github.com/fastly/cli/pull/1044)

## [v10.4.0](https://github.com/fastly/cli/releases/tag/v10.4.0) (2023-08-31)

The Fastly CLI internal configuration file has been updated to version `3`, with the primary change being updates to the toolchain constraints within the `[language.go]` section ([diff](https://github.com/fastly/cli/pull/995/files#diff-8b30a64872c0f304cd83a24f92c57f62b12d6ba81c6a51428da7d1ed3ceb83fd)).

When upgrading to this version of the CLI, and running a command for the first time, the config file should automatically update, but this can also be manually triggered by executing:

```shell
fastly config --reset
```

The changes to the internal configuration correlate with another change in this release, which is adding support for standard Go alongside TinyGo.

If your fastly.toml has no custom `[scripts.build]` defined, then TinyGo will continue to be the default compiler used for building your Compute@Edge project. Otherwise, adding the following will enable you to use the Wasm support that Go 1.21+ provides:

```toml
[scripts]
env_vars = ["GOARCH=wasm", "GOOS=wasip1"]
build = "go build -o bin/main.wasm ."
```

**Deprecations:**

- remove(compute/init): assemblyscript [#1002](https://github.com/fastly/cli/pull/1002)

**Enhancements:**

- feat(compute/build): support native go [#995](https://github.com/fastly/cli/pull/995)
- Add support for interacting with the New Relic OTLP logging endpoint [#990](https://github.com/fastly/cli/pull/990)

**Dependencies:**

- build: bump go-fastly to v8.6.1 [#1000](https://github.com/fastly/cli/pull/1000)
- build(deps): bump golang.org/x/crypto from 0.11.0 to 0.12.0 [#994](https://github.com/fastly/cli/pull/994)
- build(deps): bump github.com/fastly/go-fastly/v8 from 8.5.7 to 8.5.9 [#996](https://github.com/fastly/cli/pull/996)

## [v10.3.0](https://github.com/fastly/cli/releases/tag/v10.3.0) (2023-08-16)

**Enhancements:**

- feat(compute/init): support post_init [#997](https://github.com/fastly/cli/pull/997)

**Bug fixes:**

- build(scripts): use /usr/bin/env bash to retrieve system bash path [#987](https://github.com/fastly/cli/pull/987)
- fix(kvstores/list): support pagination [#988](https://github.com/fastly/cli/pull/988)
- fix(secretstore): pagination + support for json [#991](https://github.com/fastly/cli/pull/991)

## [v10.2.4](https://github.com/fastly/cli/releases/tag/v10.2.4) (2023-07-28)

**Enhancements:**

- fix(kvstoreentry): improve error handling for batch processing [#980](https://github.com/fastly/cli/pull/980)
- feat(kvstore): support deleting all keys [#981](https://github.com/fastly/cli/pull/981)
- feat(configstoreentry): support deleting all keys [#983](https://github.com/fastly/cli/pull/983)

**Bug fixes:**

- fix(compute/deploy): support --service-name for publishing to a non-manifest specific service [#979](https://github.com/fastly/cli/pull/979)
- fix(compute/validate): remove broken decompression bomb check [#984](https://github.com/fastly/cli/pull/984)

## [v10.2.3](https://github.com/fastly/cli/releases/tag/v10.2.3) (2023-07-20)

**Enhancements:**

- refactor(compute): clean-up logic surrounding filesHash generation [#969](https://github.com/fastly/cli/pull/969)
- fix: increase text width [#970](https://github.com/fastly/cli/pull/970)

**Bug fixes:**

- Correctly check if the package is up to date [#967](https://github.com/fastly/cli/pull/967)
- fix(flags): ensure ListServices call is paginated [#976](https://github.com/fastly/cli/pull/976)

**Dependencies:**

- build(deps): bump github.com/fastly/go-fastly/v8 from 8.5.1 to 8.5.2 [#966](https://github.com/fastly/cli/pull/966)
- build(deps): bump github.com/fastly/go-fastly/v8 from 8.5.2 to 8.5.4 [#968](https://github.com/fastly/cli/pull/968)
- build(deps): bump golang.org/x/crypto from 0.10.0 to 0.11.0 [#972](https://github.com/fastly/cli/pull/972)
- build(deps): bump golang.org/x/term from 0.9.0 to 0.10.0 [#971](https://github.com/fastly/cli/pull/971)

## [v10.2.2](https://github.com/fastly/cli/releases/tag/v10.2.2) (2023-06-22)

**Enhancements:**

- refactor(ci): disable setup-go caching to avoid later cache restoration errors [#960](https://github.com/fastly/cli/pull/960)

**Bug fixes:**

- fix(update): use consistent pattern for replacing binary [#961](https://github.com/fastly/cli/pull/961)
- fix(kvstoreentry): avoid runtime panic for out of bound slice index [#964](https://github.com/fastly/cli/pull/964)

**Dependencies:**

- build(deps): bump golang.org/x/term from 0.8.0 to 0.9.0 [#959](https://github.com/fastly/cli/pull/959)
- build(deps): bump github.com/otiai10/copy from 1.11.0 to 1.12.0 [#958](https://github.com/fastly/cli/pull/958)
- build(deps): bump golang.org/x/crypto from 0.9.0 to 0.10.0 [#957](https://github.com/fastly/cli/pull/957)

## [v10.2.1](https://github.com/fastly/cli/releases/tag/v10.2.1) (2023-06-19)

**Enhancements:**

- feat(logging/s3): add --file-max-bytes flag [#952](https://github.com/fastly/cli/pull/952)
- ci: better caching support [#951](https://github.com/fastly/cli/pull/951)
- fix: remove sentry [#954](https://github.com/fastly/cli/pull/954)
- refactor: logic clean-up [#955](https://github.com/fastly/cli/pull/955)

**Bug fixes:**

- ci: fix cache restore bug [#953](https://github.com/fastly/cli/pull/953)

**Dependencies:**

- build(deps): bump github.com/fastly/go-fastly/v8 from 8.4.1 to 8.5.0 [#949](https://github.com/fastly/cli/pull/949)

## [v10.2.0](https://github.com/fastly/cli/releases/tag/v10.2.0) (2023-06-12)

**Enhancements:**

- feat: support viceroy pinning [#947](https://github.com/fastly/cli/pull/947)
- Enable environment variable hints for `--token` flag [#945](https://github.com/fastly/cli/pull/945)
- secret store: add `--recreate` and `--recreate-must` options [#930](https://github.com/fastly/cli/pull/930)

**Dependencies:**

- build(deps): bump github.com/fastly/go-fastly/v8 from 8.3.0 to 8.4.1 [#946](https://github.com/fastly/cli/pull/946)

## [v10.1.0](https://github.com/fastly/cli/releases/tag/v10.1.0) (2023-05-18)

Deprecation notice: `fastly compute hashsum` is being phased out in favour of `fastly compute hash-files`.

**Enhancements:**

- feat(compute/hashfiles): add hash-files subcommand [#943](https://github.com/fastly/cli/pull/943)

## [v10.0.1](https://github.com/fastly/cli/releases/tag/v10.0.1) (2023-05-17)

**Bug fixes:**

- fix(kvstoreentry): support JSON output for bulk processing [#940](https://github.com/fastly/cli/pull/940)

## [v10.0.0](https://github.com/fastly/cli/releases/tag/v10.0.0) (2023-05-16)

**Breaking:**

This release introduces a breaking interface change to the `kv-store-entry` command. The `--key-name` flag is renamed to `--key` to be consistent with the other 'stores' supported within the CLI.

**Bug fixes:**

- fastly backend create: override host cannot be an empty string [#936](https://github.com/fastly/cli/pull/936)
- fix(profile): support automation tokens [#938](https://github.com/fastly/cli/pull/938)

**Enhancements:**

- feat(kvstore): Bulk Import [#927](https://github.com/fastly/cli/pull/927)
- refactor: make config/kv/secret store output consistent [#937](https://github.com/fastly/cli/pull/937)

**Dependencies:**

- build(deps): bump github.com/fastly/go-fastly/v8 from 8.0.0 to 8.0.1 [#926](https://github.com/fastly/cli/pull/926)
- build(deps): bump golang.org/x/term from 0.7.0 to 0.8.0 [#928](https://github.com/fastly/cli/pull/928)
- build(deps): bump github.com/getsentry/sentry-go from 0.20.0 to 0.21.0 [#929](https://github.com/fastly/cli/pull/929)
- build(deps): bump golang.org/x/crypto from 0.8.0 to 0.9.0 [#934](https://github.com/fastly/cli/pull/934)

## [v9.0.3](https://github.com/fastly/cli/releases/tag/v9.0.3) (2023-04-26)

**Bug fixes:**

- Omit errors from Sentry reporting [#922](https://github.com/fastly/cli/pull/922)

**Enhancements:**

- fix(compute/serve): always set verbose mode for viceroy [#924](https://github.com/fastly/cli/pull/924)

**Dependencies:**

- build(deps): bump github.com/otiai10/copy from 1.10.0 to 1.11.0 [#923](https://github.com/fastly/cli/pull/923)

## [v9.0.2](https://github.com/fastly/cli/releases/tag/v9.0.2) (2023-04-19)

**Bug fixes:**

- fix(kvstore): alias `object-store` [#920](https://github.com/fastly/cli/pull/920)

## [v9.0.1](https://github.com/fastly/cli/releases/tag/v9.0.1) (2023-04-19)

**Bug fixes:**

- fix: reinstate support for `[setup.object_stores]` [#918](https://github.com/fastly/cli/pull/918)

## [v9.0.0](https://github.com/fastly/cli/releases/tag/v9.0.0) (2023-04-19)

There are a couple of important 'breaking' changes in this release.

The `object-store` command has been renamed to `kv-store` and the `fastly.toml` manifest (used by the Fastly CLI) has updated its data model (see https://www.fastly.com/documentation/reference/compute/fastly-toml) by renaming `[setup.dictionaries]` and `[local_server.dictionaries]` to their `config_stores` equivalent, which has resulted in a new `manifest_version` number due to the change to the consumer interface.

**Breaking:**

- breaking(objectstore): rename object-store command to kv-store [#904](https://github.com/fastly/cli/pull/904)
- breaking(manifest): support latest fastly.toml manifest data model [#907](https://github.com/fastly/cli/pull/907)

**Bug fixes:**

- fix(manifest): re-raise remediation error to avoid go-toml wrapping issue [#915](https://github.com/fastly/cli/pull/915)
- fix(compute/deploy): shorten message to avoid spinner bug [#916](https://github.com/fastly/cli/pull/916)

**Enhancements:**

- feat(compute/deploy): add Secret Store to manifest `[setup]` [#769](https://github.com/fastly/cli/pull/769)
- feat(config): add TypeScript Starter Kit [#908](https://github.com/fastly/cli/pull/908)
- fix(errors/log): support filtering errors to Sentry [#909](https://github.com/fastly/cli/pull/909)
- fix(manifest): improve output message for fastly.toml related errors [#910](https://github.com/fastly/cli/pull/910)
- feat(service): support `--json` for service search subcommand [#911](https://github.com/fastly/cli/pull/911)
- refactor: consistent `--json` implementation [#912](https://github.com/fastly/cli/pull/912)

**Dependencies:**

- build(deps): bump github.com/otiai10/copy from 1.9.0 to 1.10.0 [#900](https://github.com/fastly/cli/pull/900)
- build(deps): bump golang.org/x/crypto from 0.7.0 to 0.8.0 [#901](https://github.com/fastly/cli/pull/901)
- build(deps): bump golang.org/x/term from 0.6.0 to 0.7.0 [#902](https://github.com/fastly/cli/pull/902)
- build(deps): bump github.com/Masterminds/semver/v3 from 3.2.0 to 3.2.1 [#903](https://github.com/fastly/cli/pull/903)

## [v8.2.4](https://github.com/fastly/cli/releases/tag/v8.2.4) (2023-04-06)

**Enhancements:**

- feat(compute/serve): support forcing a viceroy check [#898](https://github.com/fastly/cli/pull/898)

## [v8.2.3](https://github.com/fastly/cli/releases/tag/v8.2.3) (2023-04-05)

[Full Changelog](https://github.com/fastly/cli/compare/v8.2.2...v8.2.3)

**Enhancements:**

- fix(profile): always prompt for token [#896](https://github.com/fastly/cli/pull/896)

**Dependencies:**

- build(deps): bump github.com/getsentry/sentry-go from 0.19.0 to 0.20.0 [#895](https://github.com/fastly/cli/pull/895)
- build(deps): bump actions/setup-go from 3 to 4 [#882](https://github.com/fastly/cli/pull/882)
- build(deps): bump github.com/fatih/color from 1.14.1 to 1.15.0 [#865](https://github.com/fastly/cli/pull/865)

## [v8.2.2](https://github.com/fastly/cli/releases/tag/v8.2.2) (2023-03-31)

[Full Changelog](https://github.com/fastly/cli/compare/v8.2.1...v8.2.2)

**Enhancements:**

- feat(ratelimit): add missing properties [#891](https://github.com/fastly/cli/pull/891)
- feat(ratelimiter): add uri-dict-name flag [#892](https://github.com/fastly/cli/pull/892)

## [v8.2.1](https://github.com/fastly/cli/releases/tag/v8.2.1) (2023-03-30)

[Full Changelog](https://github.com/fastly/cli/compare/v8.2.0...v8.2.1)

**Dependencies:**

- build(deps): bump tinygo baseline version [#888](https://github.com/fastly/cli/pull/888)

**Bug fixes:**

- fix(toolchain): bump go version to align with updated tinygo constraint [#889](https://github.com/fastly/cli/pull/889)

## [v8.2.0](https://github.com/fastly/cli/releases/tag/v8.2.0) (2023-03-28)

[Full Changelog](https://github.com/fastly/cli/compare/v8.1.2...v8.2.0)

**Enhancements:**

- feat(ratelimit): implement rate-limiter API [#886](https://github.com/fastly/cli/pull/886)

## [v8.1.2](https://github.com/fastly/cli/releases/tag/v8.1.2) (2023-03-21)

[Full Changelog](https://github.com/fastly/cli/compare/v8.1.1...v8.1.2)

**Bug fixes:**

- fix(service/create): input.Type assigned wrong value [#881](https://github.com/fastly/cli/pull/881)

## [v8.1.1](https://github.com/fastly/cli/releases/tag/v8.1.1) (2023-03-20)

[Full Changelog](https://github.com/fastly/cli/compare/v8.1.0...v8.1.1)

**Bug fixes:**

- Pass verbosity flag along to viceroy binary [#878](https://github.com/fastly/cli/pull/878)
- fix(compute/serve): always display local server address [#879](https://github.com/fastly/cli/pull/879)

## [v8.1.0](https://github.com/fastly/cli/releases/tag/v8.1.0) (2023-03-17)

[Full Changelog](https://github.com/fastly/cli/compare/v8.0.1...v8.1.0)

**Enhancements:**

- fix various lint and CI issues [#873](https://github.com/fastly/cli/pull/873)
- feat(config-store): Add Config Store commands [#829](https://github.com/fastly/cli/pull/829)
- fix(compute/deploy): service availability [#875](https://github.com/fastly/cli/pull/875)
- fix(compute/deploy): check status code range [#876](https://github.com/fastly/cli/pull/876)

## [v8.0.1](https://github.com/fastly/cli/releases/tag/v8.0.1) (2023-03-15)

[Full Changelog](https://github.com/fastly/cli/compare/v8.0.0...v8.0.1)

**Bug fixes:**

- fix(compute/serve): stop spinner before starting another instance [#867](https://github.com/fastly/cli/pull/867)
- fix(http/client): address confusion with timeout error [#869](https://github.com/fastly/cli/pull/869)
- fix(http/client): bump timeout to account for poor network conditions [#870](https://github.com/fastly/cli/pull/870)

**Enhancements:**

- refactor(compute/deploy): change default port from 80 to 443 [#866](https://github.com/fastly/cli/pull/866)

## [v8.0.0](https://github.com/fastly/cli/releases/tag/v8.0.0) (2023-03-08)

[Full Changelog](https://github.com/fastly/cli/compare/v7.0.1...v8.0.0)

**Breaking:**

This release contains a small breaking interface change that has required us to bump to a new major version.

When viewing a profile token using `fastly profile token` the `--name` flag is no longer supported. It has been moved to a positional argument to make it consistent with the other profile subcommands. The `profile token` command now respects the global `--profile` flag, which allows a user to switch profiles for the lifetime of a single command execution.

Examples:

- `fastly profile token --name=example` -> `fastly profile token example`
- `fastly profile token --profile=example`

* breaking(profiles): replace `--name` with positional arg + allow global override [#862](https://github.com/fastly/cli/pull/862)

**Bug fixes:**

- fix(build): show build output with `--verbose` flag [#853](https://github.com/fastly/cli/pull/853)

**Enhancements:**

- fix(profile/update): update active profile as default behaviour [#857](https://github.com/fastly/cli/pull/857)
- fix(compute/serve): allow overriding of viceroy binary [#859](https://github.com/fastly/cli/pull/859)
- feat(compute/deploy): check service availability [#860](https://github.com/fastly/cli/pull/860)

**Dependencies:**

- build(deps): bump github.com/getsentry/sentry-go from 0.18.0 to 0.19.0 [#856](https://github.com/fastly/cli/pull/856)
- build(deps): bump golang.org/x/crypto [#855](https://github.com/fastly/cli/pull/855)

## [v7.0.1](https://github.com/fastly/cli/releases/tag/v7.0.1) (2023-03-02)

[Full Changelog](https://github.com/fastly/cli/compare/v7.0.0...v7.0.1)

**Bug fixes:**

- fix(compute/build): move log calls before subprocess call [#847](https://github.com/fastly/cli/pull/847)
- fix(compute/serve): ensure spinner is closed for all logic branches [#849](https://github.com/fastly/cli/pull/849)

**Enhancements:**

- feat(dict/create): display dictionary ID on creation [#848](https://github.com/fastly/cli/pull/848)
- refactor: clean-up nil error checks [#851](https://github.com/fastly/cli/pull/851)

## [v7.0.0](https://github.com/fastly/cli/releases/tag/v7.0.0) (2023-02-23)

[Full Changelog](https://github.com/fastly/cli/compare/v6.0.6...v7.0.0)

**Breaking:**

There are a couple of small breaking changes to the CLI.

Prior versions of the CLI would consult the following files to ignore specific files while running `compute serve --watch`:

- `.ignore`
- `.gitignore`
- The user's global git ignore configuration

We are dropping support for these files and will instead consult `.fastlyignore`, which is already used by `compute build`.

We've removed support for the `logging logentries` subcommand as the third-party logging product has been deprecated.

- fix(compute/serve): replace separate ignore files with `.fastlyignore` [#834](https://github.com/fastly/cli/pull/834)
- breaking(logging): remove logentries [#835](https://github.com/fastly/cli/pull/835)

**Bug fixes:**

- fix(compute/build): ignore all files except manifest and wasm binary [#836](https://github.com/fastly/cli/pull/836)
- fix(compute/serve): output rendering [#839](https://github.com/fastly/cli/pull/839)
- Fix compute build rendered output [#842](https://github.com/fastly/cli/pull/842)

**Enhancements:**

- use secret store client keys when creating secret store entries [#805](https://github.com/fastly/cli/pull/805)
- fix(compute/serve): check for missing override_host [#832](https://github.com/fastly/cli/pull/832)
- feat(resource-link): Add Service Resource commands [#800](https://github.com/fastly/cli/pull/800)
- Replace custom spinner with less buggy third-party package [#838](https://github.com/fastly/cli/pull/838)
- refactor(spinner): hide `...` after spinner has stopped [#840](https://github.com/fastly/cli/pull/840)
- fix(compute/serve): make override_host a default behaviour [#843](https://github.com/fastly/cli/pull/843)

**Dependencies:**

- build(deps): bump golang.org/x/net from 0.2.0 to 0.7.0 [#830](https://github.com/fastly/cli/pull/830)
- build(deps): bump github.com/fastly/go-fastly/v7 from 7.2.0 to 7.3.0 [#831](https://github.com/fastly/cli/pull/831)

**Clean-ups:**

- refactor: linter issues resolved [#833](https://github.com/fastly/cli/pull/833)

## [v6.0.6](https://github.com/fastly/cli/releases/tag/v6.0.6) (2023-02-15)

[Full Changelog](https://github.com/fastly/cli/compare/v6.0.5...v6.0.6)

**Bug fixes:**

- build(goreleaser): build with explicit `CGO_ENABLED=0` [#826](https://github.com/fastly/cli/pull/826)

## [v6.0.5](https://github.com/fastly/cli/releases/tag/v6.0.5) (2023-02-15)

[Full Changelog](https://github.com/fastly/cli/compare/v6.0.4...v6.0.5)

**Enhancements:**

- fix(dns): migrate to go1.20 [#824](https://github.com/fastly/cli/pull/824)

## [v6.0.4](https://github.com/fastly/cli/releases/tag/v6.0.4) (2023-02-13)

[Full Changelog](https://github.com/fastly/cli/compare/v6.0.3...v6.0.4)

**Bug fixes:**

- fix(compute/build): only use default build script if none defined [#814](https://github.com/fastly/cli/pull/814)
- fix(compute/deploy): replace spinner implementation [#820](https://github.com/fastly/cli/pull/820)

**Enhancements:**

- fix(compute/build): ensure build output doesn't show unless --verbose is set [#815](https://github.com/fastly/cli/pull/815)

**Documentation:**

- docs: remove --skip-verification [#816](https://github.com/fastly/cli/pull/816)

**Dependencies:**

- build(deps): bump github.com/fastly/go-fastly/v7 from 7.1.0 to 7.2.0 [#819](https://github.com/fastly/cli/pull/819)
- build(deps): bump github.com/getsentry/sentry-go from 0.17.0 to 0.18.0 [#818](https://github.com/fastly/cli/pull/818)
- build(deps): bump golang.org/x/term from 0.4.0 to 0.5.0 [#817](https://github.com/fastly/cli/pull/817)

## [v6.0.3](https://github.com/fastly/cli/releases/tag/v6.0.3) (2023-02-09)

[Full Changelog](https://github.com/fastly/cli/compare/v6.0.2...v6.0.3)

**Bug fixes:**

- fix(compute/setup): fix duplicated domains [#808](https://github.com/fastly/cli/pull/808)
- fix(setup/domain): allow user to correct a domain already in use [#811](https://github.com/fastly/cli/pull/811)

**Enhancements:**

- build(goreleaser): replace deprecated flag [#807](https://github.com/fastly/cli/pull/807)
- refactor: add type annotations [#809](https://github.com/fastly/cli/pull/809)
- build(lint): implement semgrep for local validation [#810](https://github.com/fastly/cli/pull/810)

## [v6.0.2](https://github.com/fastly/cli/releases/tag/v6.0.2) (2023-02-08)

[Full Changelog](https://github.com/fastly/cli/compare/v6.0.1...v6.0.2)

**Bug fixes:**

- fix(compute/build): ensure we only parse stdout from cargo command [#804](https://github.com/fastly/cli/pull/804)

## [v6.0.1](https://github.com/fastly/cli/releases/tag/v6.0.1) (2023-02-08)

[Full Changelog](https://github.com/fastly/cli/compare/v6.0.0...v6.0.1)

**Enhancements:**

- refactor(compute): add command output when there is an error [#801](https://github.com/fastly/cli/pull/801)

## [v6.0.0](https://github.com/fastly/cli/releases/tag/v6.0.0) (2023-02-07)

[Full Changelog](https://github.com/fastly/cli/compare/v5.1.1...v6.0.0)

**Breaking:**

There are three breaking changes in this release.

The first comes from the removal of logic related to user environment
validation. This logic existed as an attempt to reduce the number of possible
errors when trying to compile a Compute project. The reality was that this
validation logic was tightly coupled to specific expectations of the CLI
(and of its starter kits) and consequently resulted in errors that were often
difficult to understand and debug, as well as restricting users from using their
own tools and scripts. By simplifying the logic flow we hope to reduce friction
for users who want to switch the tooling used, as well as reduce the general
confusion caused for users when there are environment validation errors, while
also reducing the maintenance overhead for contributors to the CLI code base.
This change has meant we no longer need to define a `--skip-validation` flag and
that resulted in a breaking interface change.

The second breaking change is to the `objectstore` command. This has now been
renamed to `object-store`. Additionally, there is no `keys`, `get` or `insert`
commands for manipulating the object-store entries. These operations have been
moved to a separate subcommand `object-store-entry` as this keeps the naming and
structural convention consistent with ACLs and Edge Dictionaries.

The third breaking change is to Edge Dictionaries, which sees the
`dictionary-item` subcommand renamed to `dictionary-entry`, again for
consistency with other similar subcommands.

- Remove user environment validation logic [#785](https://github.com/fastly/cli/pull/785)
- Rework objectstore subcommand [#792](https://github.com/fastly/cli/pull/792)
- Rename object store 'keys' to 'entry' for consistency [#795](https://github.com/fastly/cli/pull/795)
- refactor(dictionaryitem): rename from item to entry [#798](https://github.com/fastly/cli/pull/798)

**Bug fixes:**

- Fix description in the manifest [#788](https://github.com/fastly/cli/pull/788)

**Enhancements:**

- Update `local_server` object and secret store formats [#789](https://github.com/fastly/cli/pull/789)

**Clean-ups:**

- refactor: move global struct and config.Source types into separate packages [#796](https://github.com/fastly/cli/pull/796)
- refactor(secretstore): divide command files into separate packages [#797](https://github.com/fastly/cli/pull/797)

## [v5.1.1](https://github.com/fastly/cli/releases/tag/v5.1.1) (2023-02-01)

[Full Changelog](https://github.com/fastly/cli/compare/v5.1.0...v5.1.1)

**Bug fixes:**

- fix(compute/build): AssemblyScript bugs [#786](https://github.com/fastly/cli/pull/786)

**Dependencies:**

- Bump github.com/fatih/color from 1.14.0 to 1.14.1 [#783](https://github.com/fastly/cli/pull/783)

## [v5.1.0](https://github.com/fastly/cli/releases/tag/v5.1.0) (2023-01-27)

[Full Changelog](https://github.com/fastly/cli/compare/v5.0.0...v5.1.0)

**Enhancements:**

- Add Secret Store support [#717](https://github.com/fastly/cli/pull/717)
- refactor(compute/deploy): reduce size of `Exec()` [#775](https://github.com/fastly/cli/pull/775)
- refactor(compute/deploy): add messaging to explain `[setup]` [#779](https://github.com/fastly/cli/pull/779)

**Bug fixes:**

- fix(objectstore/get): output value unless verbose/json flag passed [#774](https://github.com/fastly/cli/pull/774)
- fix(compute/init): add warning for paths with spaces [#778](https://github.com/fastly/cli/pull/778)
- fix(compute/deploy): clean-up new service creation on-error [#776](https://github.com/fastly/cli/pull/776)

**Dependencies:**

- Bump github.com/fatih/color from 1.13.0 to 1.14.0 [#772](https://github.com/fastly/cli/pull/772)

## [v5.0.0](https://github.com/fastly/cli/releases/tag/v5.0.0) (2023-01-19)

[Full Changelog](https://github.com/fastly/cli/compare/v4.6.2...v5.0.0)

**Breaking:**

The `objectstore` command was incorrectly configured to have a long flag using
a single character (e.g. `--k` and `--v`). These were corrected to `--key` and
`--value` (and a short flag variant for `-k` was added as well).

- feat(objectstore): add --json support to keys/list subcommands [#762](https://github.com/fastly/cli/pull/762)
- feat(objectstore/get): implement --json flag for getting key value [#763](https://github.com/fastly/cli/pull/763)

**Enhancements:**

- feat(compute/deploy): add Object Store to manifest \[setup\] [#764](https://github.com/fastly/cli/pull/764)
- feat(compute/build): support locating language manifests outside project directory [#765](https://github.com/fastly/cli/pull/765)
- feat(compute/serve): implement --watch-dir flag [#758](https://github.com/fastly/cli/pull/758)

**Bug fixes:**

- fix(setup): object_store needs to be linked to service [#767](https://github.com/fastly/cli/pull/767)

**Dependencies:**

- Bump github.com/getsentry/sentry-go from 0.16.0 to 0.17.0 [#759](https://github.com/fastly/cli/pull/759)

## [v4.6.2](https://github.com/fastly/cli/releases/tag/v4.6.2) (2023-01-12)

[Full Changelog](https://github.com/fastly/cli/compare/v4.6.1...v4.6.2)

**Bug fixes:**

- fix(pkg/commands/compute/serve): prevent 386 arch users executing command [#753](https://github.com/fastly/cli/pull/753)
- build(goreleaser): fix Windows archive generation to include zips [#756](https://github.com/fastly/cli/pull/756)

**Dependencies:**

- Bump golang.org/x/term from 0.3.0 to 0.4.0 [#754](https://github.com/fastly/cli/pull/754)

## [v4.6.1](https://github.com/fastly/cli/releases/tag/v4.6.1) (2023-01-05)

[Full Changelog](https://github.com/fastly/cli/compare/v4.6.0...v4.6.1)

**Bug fixes:**

- fix(pkg/commands/vcl/snippet): set default dynamic value [#751](https://github.com/fastly/cli/pull/751)

**Dependencies:**

- Bump github.com/mattn/go-isatty from 0.0.16 to 0.0.17 [#748](https://github.com/fastly/cli/pull/748)

**Enhancements:**

- build(makefile): add goreleaser target for testing builds locally [#750](https://github.com/fastly/cli/pull/750)

## [v4.6.0](https://github.com/fastly/cli/releases/tag/v4.6.0) (2023-01-03)

[Full Changelog](https://github.com/fastly/cli/compare/v4.5.0...v4.6.0)

**Bug fixes:**

- vcl/snippet: pass AllowActiveLocked if --dynamic was passed [#742](https://github.com/fastly/cli/pull/742)

**Dependencies:**

- Bump goreleaser/goreleaser-action from 3 to 4 [#746](https://github.com/fastly/cli/pull/746)

**Enhancements:**

- Use DevHub endpoint for acquiring CLI/Viceroy metadata [#739](https://github.com/fastly/cli/pull/739)

## [v4.5.0](https://github.com/fastly/cli/releases/tag/v4.5.0) (2022-12-15)

[Full Changelog](https://github.com/fastly/cli/compare/v4.4.1...v4.5.0)

**Documentation:**

- docs(pkg/compute): remove PLC labels from supported languages [#740](https://github.com/fastly/cli/pull/740)

**Enhancements:**

- refactor(pkg/commands/update): move versioner logic to separate package [#735](https://github.com/fastly/cli/pull/735)
- fix(compute): don't validate js-compute-runtime binary location [#731](https://github.com/fastly/cli/pull/731)
- Link to Starter Kits during compute init [#730](https://github.com/fastly/cli/pull/730)
- Update tinygo default build command [#727](https://github.com/fastly/cli/pull/727)
- CI/Dockerfiles: minor dockerfiles improvements [#722](https://github.com/fastly/cli/pull/722)
- Switch JavaScript build script based on webpack in package.json prebuild [#728](https://github.com/fastly/cli/pull/728)
- Add support for TOML secret_store section [#726](https://github.com/fastly/cli/pull/726)

**Dependencies:**

- Bump golang.org/x/term from 0.2.0 to 0.3.0 [#733](https://github.com/fastly/cli/pull/733)
- Bump github.com/getsentry/sentry-go from 0.15.0 to 0.16.0 [#734](https://github.com/fastly/cli/pull/734)
- Bump github.com/Masterminds/semver/v3 from 3.1.1 to 3.2.0 [#724](https://github.com/fastly/cli/pull/724)

## [v4.4.1](https://github.com/fastly/cli/releases/tag/v4.4.1) (2022-12-02)

[Full Changelog](https://github.com/fastly/cli/compare/v4.4.0...v4.4.1)

**Bug fixes:**

- Avoid sending empty string to Backend create API [#720](https://github.com/fastly/cli/pull/720)

## [v4.4.0](https://github.com/fastly/cli/releases/tag/v4.4.0) (2022-11-29)

[Full Changelog](https://github.com/fastly/cli/compare/v4.3.0...v4.4.0)

**Enhancements:**

- Add `PrintLines` to `text` package and use in logging [#698](https://github.com/fastly/cli/pull/698)
- Add dependabot workflow automation for updating dependency [#701](https://github.com/fastly/cli/pull/701)
- Add account name to pubsub and bigquery [#699](https://github.com/fastly/cli/pull/699)

**Bug fixes:**

- Add missing `--help` flag to globals [#695](https://github.com/fastly/cli/pull/695)
- Fix check for mutual exclusion flags [#696](https://github.com/fastly/cli/pull/696)
- Fix object store TOML definitions, add test data [#715](https://github.com/fastly/cli/pull/715)

**Dependencies:**

- Bump github.com/otiai10/copy from 1.7.0 to 1.9.0 [#706](https://github.com/fastly/cli/pull/706)
- Bump github.com/mholt/archiver/v3 from 3.5.0 to 3.5.1 [#703](https://github.com/fastly/cli/pull/703)
- Bump github.com/fastly/go-fastly/v6 from 6.6.0 to 6.8.0 [#704](https://github.com/fastly/cli/pull/704)
- Bump github.com/mattn/go-isatty from 0.0.14 to 0.0.16 [#702](https://github.com/fastly/cli/pull/702)
- Bump github.com/google/go-cmp from 0.5.6 to 0.5.9 [#708](https://github.com/fastly/cli/pull/708)
- Bump github.com/mitchellh/mapstructure from 1.4.3 to 1.5.0 [#709](https://github.com/fastly/cli/pull/709)
- Bump github.com/bep/debounce from 1.2.0 to 1.2.1 [#711](https://github.com/fastly/cli/pull/711)
- Bump github.com/getsentry/sentry-go from 0.12.0 to 0.15.0 [#712](https://github.com/fastly/cli/pull/712)
- Bump github.com/pelletier/go-toml from 1.9.3 to 1.9.5 [#710](https://github.com/fastly/cli/pull/710)
- Bump go-fastly to v7 [#707](https://github.com/fastly/cli/pull/707)
- Bump github.com/fsnotify/fsnotify from 1.5.1 to 1.6.0 [#716](https://github.com/fastly/cli/pull/716)

## [v4.3.0](https://github.com/fastly/cli/releases/tag/v4.3.0) (2022-10-26)

[Full Changelog](https://github.com/fastly/cli/compare/v4.2.0...v4.3.0)

**Enhancements:**

- Fix release process to not use external config [#688](https://github.com/fastly/cli/pull/688)
- Skip exit code 1 for 'help' output [#689](https://github.com/fastly/cli/pull/689)
- Implement dynamic package name [#686](https://github.com/fastly/cli/pull/686)
- Replace fiddle.fastly.dev with fiddle.fastlydemo.net [#687](https://github.com/fastly/cli/pull/687)
- Code clean-up [#685](https://github.com/fastly/cli/pull/685)
- Implement --quiet flag [#690](https://github.com/fastly/cli/pull/690)
- Make `compute build` respect `--quiet` [#694](https://github.com/fastly/cli/pull/694)

**Bug fixes:**

- Fix runtime panic [#683](https://github.com/fastly/cli/pull/683)
- Fix runtime panic caused by outdated global flags [#693](https://github.com/fastly/cli/pull/693)
- Fix runtime panic caused by missing `--help` global flag [#695](https://github.com/fastly/cli/pull/695)
- Fix check for mutual exclusion flags[#696](https://github.com/fastly/cli/pull/696)
- Correct installation instructions for Go [#682](https://github.com/fastly/cli/pull/682)

## [v4.2.0](https://github.com/fastly/cli/releases/tag/v4.2.0) (2022-10-18)

[Full Changelog](https://github.com/fastly/cli/compare/v4.1.0...v4.2.0)

**Enhancements:**

- Service Authorization [#660](https://github.com/fastly/cli/pull/660)
- Add Object Store API calls [#670](https://github.com/fastly/cli/pull/670)
- Remove upper limit on Go toolchain [#678](https://github.com/fastly/cli/pull/678)

**Bug fixes:**

- Fix `compute pack` to produce expected `package.tar.gz` filename [#662](https://github.com/fastly/cli/pull/662)
- Fix `--help` flag to not display an error [#672](https://github.com/fastly/cli/pull/672)
- Fix command substitution issue for Windows OS [#677](https://github.com/fastly/cli/pull/677)
- Fix Makefile for Windows [#679](https://github.com/fastly/cli/pull/679)

## [v4.1.0](https://github.com/fastly/cli/releases/tag/v4.1.0) (2022-10-11)

[Full Changelog](https://github.com/fastly/cli/compare/v4.0.1...v4.1.0)

**Bug fixes:**

- Fix Rust validation step for fastly crate dependency [#661](https://github.com/fastly/cli/pull/661)
- Fix `compute build --first-byte-timeout` [#667](https://github.com/fastly/cli/pull/667)
- Ensure the ./bin directory is present even with `--skip-verification` [#665](https://github.com/fastly/cli/pull/665)

**Enhancements:**

- Reduce duplication of strings in logging package [#653](https://github.com/fastly/cli/pull/653)
- Support `cert_host` and `use_sni` Viceroy properties [#663](https://github.com/fastly/cli/pull/663)

## [v4.0.1](https://github.com/fastly/cli/releases/tag/v4.0.1) (2022-10-05)

[Full Changelog](https://github.com/fastly/cli/compare/v4.0.0...v4.0.1)

**Bug fixes:**

- Fix JS dependency lookup [#656](https://github.com/fastly/cli/pull/656)
- Fix Rust 'existing project' bug [#657](https://github.com/fastly/cli/pull/657)
- Fix Rust toolchain lookup regression [#658](https://github.com/fastly/cli/pull/658)

## [v4.0.0](https://github.com/fastly/cli/releases/tag/v4.0.0) (2022-10-04)

[Full Changelog](https://github.com/fastly/cli/compare/v3.3.0...v4.0.0)

**Enhancements:**

- Bump go-fastly to v6.5.1 [#635](https://github.com/fastly/cli/pull/635)
- Update `--ssl-ciphers` description [#636](https://github.com/fastly/cli/pull/636)
- Improve JS error message when a dependency is missing [#637](https://github.com/fastly/cli/pull/637)
- Change default service version selection behaviour [#638](https://github.com/fastly/cli/pull/638)
- Support for additional S3 storage classes [#641](https://github.com/fastly/cli/pull/641)
- Change `compute serve --watch` flag to default to the project root directory [#642](https://github.com/fastly/cli/pull/642)
- Document the newly supported Datadog sites for logging [#576](https://github.com/fastly/cli/pull/576)
- Move the internal build scripts to the fastly.toml manifest [#640](https://github.com/fastly/cli/pull/640)
- Implement `compute hashsum` [#649](https://github.com/fastly/cli/pull/649)
- Add support for TOML `object_store` section [#651](https://github.com/fastly/cli/pull/651)
- Add `--account-name` to GCS logging endpoint [#549](https://github.com/fastly/cli/pull/549)

**Bug fixes:**

- errors/log: be defensive against nil pointer dereference [#650](https://github.com/fastly/cli/pull/650)

**Documentation:**

- Fix typos [#652](https://github.com/fastly/cli/pull/652)

## [v3.3.0](https://github.com/fastly/cli/releases/tag/v3.3.0) (2022-09-05)

[Full Changelog](https://github.com/fastly/cli/compare/v3.2.5...v3.3.0)

**Enhancements:**

- TLS Support [#630](https://github.com/fastly/cli/pull/630)
- CI to use community TinyGo action [#624](https://github.com/fastly/cli/pull/624)
- Improve compute init remediation [#627](https://github.com/fastly/cli/pull/627)
- Change default Makefile target [#629](https://github.com/fastly/cli/pull/629)
- Refactor after remote config removal [#626](https://github.com/fastly/cli/pull/626)
- Refactor for revive linter [#632](https://github.com/fastly/cli/pull/632)

## [v3.2.5](https://github.com/fastly/cli/releases/tag/v3.2.5) (2022-08-10)

[Full Changelog](https://github.com/fastly/cli/compare/v3.2.4...v3.2.5)

**Enhancements:**

- Remove dynamic configuration [#620](https://github.com/fastly/cli/pull/620)
- Static analysis updates [#621](https://github.com/fastly/cli/pull/621)
- Semgrep updates [#619](https://github.com/fastly/cli/pull/619)

**Bug fixes:**

- Fix `fastly help` tests to work with Go 1.19 [#623](https://github.com/fastly/cli/pull/623)

## [v3.2.4](https://github.com/fastly/cli/releases/tag/v3.2.4) (2022-07-28)

[Full Changelog](https://github.com/fastly/cli/compare/v3.2.3...v3.2.4)

**Bug fixes:**

- Fix `--completion-script-zsh` [#617](https://github.com/fastly/cli/pull/617)

## [v3.2.3](https://github.com/fastly/cli/releases/tag/v3.2.3) (2022-07-28)

[Full Changelog](https://github.com/fastly/cli/releases/tag/v3.2.2...v3.2.3)

**Bug fixes:**

- Block for config update if CLI version updated [#615](https://github.com/fastly/cli/pull/615)

## [v3.2.2](https://github.com/fastly/cli/releases/tag/v3.2.2) (2022-07-28)

[Full Changelog](https://github.com/fastly/cli/compare/v3.2.1...v3.2.2)

**Bug fixes:**

- Ignore TTL & update config if app version doesn't match config version [#612](https://github.com/fastly/cli/pull/612)

## [v3.2.1](https://github.com/fastly/cli/releases/tag/v3.2.1) (2022-07-27)

[Full Changelog](https://github.com/fastly/cli/compare/v3.2.0...v3.2.1)

**Enhancements:**

- Print subprocess commands in verbose mode [#608](https://github.com/fastly/cli/pull/608)

**Bug fixes:**

- Ensure application configuration is updated after `fastly update` [#610](https://github.com/fastly/cli/pull/610)
- Don't include language manifest in packages [#609](https://github.com/fastly/cli/pull/609)

## [v3.2.0](https://github.com/fastly/cli/releases/tag/v3.2.0) (2022-07-27)

[Full Changelog](https://github.com/fastly/cli/compare/v3.1.1...v3.2.0)

**Enhancements:**

- Compute@Edge TinyGo Support [#594](https://github.com/fastly/cli/pull/594)
- `pkg/commands/profile`: add `--json` flag for `list` command [#602](https://github.com/fastly/cli/pull/602)

**Bug fixes:**

- `pkg/commands/compute/deploy.go` (`getHashSum`): sort key order [#596](https://github.com/fastly/cli/pull/596)
- `pkg/errors/log.go`: prevent runtime panic due to a `nil` reference [#601](https://github.com/fastly/cli/pull/601)

## [v3.1.1](https://github.com/fastly/cli/releases/tag/v3.1.1) (2022-07-04)

[Full Changelog](https://github.com/fastly/cli/compare/v3.1.0...v3.1.1)

**Enhancements:**

- Handle build info more accurately [#588](https://github.com/fastly/cli/pull/588)

**Bug fixes:**

- Fix version check [#589](https://github.com/fastly/cli/pull/589)
- Address profile data loss [#590](https://github.com/fastly/cli/pull/590)

## [v3.1.0](https://github.com/fastly/cli/releases/tag/v3.1.0) (2022-06-24)

[Full Changelog](https://github.com/fastly/cli/compare/v3.0.1...v3.1.0)

**Enhancements:**

- Implement `profile token` command [#578](https://github.com/fastly/cli/pull/578)

**Bug fixes:**

- Fix `compute publish --non-interactive` [#583](https://github.com/fastly/cli/pull/583)
- Support `fastly --help <command>` format [#581](https://github.com/fastly/cli/pull/581)

## [v3.0.1](https://github.com/fastly/cli/releases/tag/v3.0.1) (2022-06-23)

[Full Changelog](https://github.com/fastly/cli/compare/v3.0.0...v3.0.1)

**Enhancements:**

- Makefile: when building binary, depend on .go files [#579](https://github.com/fastly/cli/pull/579)
- Include `fastly.toml` hashsum [#575](https://github.com/fastly/cli/pull/575)
- Hash main.wasm and not the package [#574](https://github.com/fastly/cli/pull/574)

## [v3.0.0](https://github.com/fastly/cli/releases/tag/v3.0.0) (2022-05-30)

[Full Changelog](https://github.com/fastly/cli/compare/v2.0.3...v3.0.0)

**Breaking changes:**

- Implement new global flags for handling interactive prompts [#568](https://github.com/fastly/cli/pull/568)

**Bug fixes:**

- The `backend create` command should set `--port` value if specified [#566](https://github.com/fastly/cli/pull/566)
- Don't overwrite `file.Load` error with `nil` [#569](https://github.com/fastly/cli/pull/569)

**Enhancements:**

- Support `[scripts.post_build]` [#565](https://github.com/fastly/cli/pull/565)
- Support Viceroy "inline-toml" `format` and new `contents` field [#567](https://github.com/fastly/cli/pull/567)
- Add example inline-toml dictionary to tests [#570](https://github.com/fastly/cli/pull/570)
- Avoid config update checks when handling 'completion' flags [#554](https://github.com/fastly/cli/pull/554)

## [v2.0.3](https://github.com/fastly/cli/releases/tag/v2.0.3) (2022-05-20)

[Full Changelog](https://github.com/fastly/cli/compare/v2.0.2...v2.0.3)

**Bug fixes:**

- Update Sentry DSN [#563](https://github.com/fastly/cli/pull/563)

## [v2.0.2](https://github.com/fastly/cli/releases/tag/v2.0.2) (2022-05-18)

[Full Changelog](https://github.com/fastly/cli/compare/v2.0.1...v2.0.2)

**Enhancements:**

- Remove user identifiable data [#561](https://github.com/fastly/cli/pull/561)

## [v2.0.1](https://github.com/fastly/cli/releases/tag/v2.0.1) (2022-05-17)

[Full Changelog](https://github.com/fastly/cli/compare/v2.0.0...v2.0.1)

**Security:**

- Omit data from Sentry [#559](https://github.com/fastly/cli/pull/559)

## [v2.0.0](https://github.com/fastly/cli/releases/tag/v2.0.0) (2022-04-05)

[Full Changelog](https://github.com/fastly/cli/compare/v1.7.1...v2.0.0)

**Bug fixes:**

- Update `--request-max-entries`/`--request-max-bytes` description defaults [#541](https://github.com/fastly/cli/pull/541)

**Enhancements:**

- Add `--debug` flag to `compute serve` [#545](https://github.com/fastly/cli/pull/545)
- Support multiple profiles via `[profiles]` configuration [#546](https://github.com/fastly/cli/pull/546)
- Reorder C@E languages and make JS 'Limited Availability' [#548](https://github.com/fastly/cli/pull/548)

## [v1.7.1](https://github.com/fastly/cli/releases/tag/v1.7.1) (2022-03-14)

[Full Changelog](https://github.com/fastly/cli/compare/v1.7.0...v1.7.1)

**Bug fixes:**

- Fix runtime panic in arg parser [#542](https://github.com/fastly/cli/pull/542)

## [v1.7.0](https://github.com/fastly/cli/releases/tag/v1.7.0) (2022-02-22)

[Full Changelog](https://github.com/fastly/cli/compare/v1.6.0...v1.7.0)

**Enhancements:**

- Add `fastly` user to Dockerfiles [#521](https://github.com/fastly/cli/pull/521)
- Support Sentry 'suspect commit' feature [#508](https://github.com/fastly/cli/pull/508)
- Populate language manifest `name` field with project name [#527](https://github.com/fastly/cli/pull/527)
- Make `--name` flag for `service search` command a required flag [#529](https://github.com/fastly/cli/pull/529)
- Update config `last_checked` field even on config load error [#528](https://github.com/fastly/cli/pull/528)
- Implement Compute@Edge Free Trial Activation [#531](https://github.com/fastly/cli/pull/531)
- Bump Rust toolchain constraint to `1.56.1` for 2021 edition [#533](https://github.com/fastly/cli/pull/533)
- Support Arch User Repositories [#530](https://github.com/fastly/cli/pull/530)

## [v1.6.0](https://github.com/fastly/cli/releases/tag/v1.6.0) (2022-01-20)

[Full Changelog](https://github.com/fastly/cli/compare/v1.5.0...v1.6.0)

**Enhancements:**

- Display the requested command in Sentry breadcrumb [#519](https://github.com/fastly/cli/pull/519)

## [v1.5.0](https://github.com/fastly/cli/releases/tag/v1.5.0) (2022-01-20)

[Full Changelog](https://github.com/fastly/cli/compare/v1.4.0...v1.5.0)

**Enhancements:**

- Implement `--json` output for describe/list operations [#505](https://github.com/fastly/cli/pull/505)
- Omit unix file permissions from error message [#507](https://github.com/fastly/cli/pull/507)
- Implement new go-fastly pagination types [#511](https://github.com/fastly/cli/pull/511)

## [v1.4.0](https://github.com/fastly/cli/releases/tag/v1.4.0) (2022-01-07)

[Full Changelog](https://github.com/fastly/cli/compare/v1.3.0...v1.4.0)

**Enhancements:**

- Add `viceroy.ttl` to CLI app config [#489](https://github.com/fastly/cli/pull/489)
- Display `viceroy --version` if installed [#487](https://github.com/fastly/cli/pull/487)
- Support `compute build` for 'other' language option using `[scripts.build]` [#484](https://github.com/fastly/cli/pull/484)
- Pass parent environment to subprocess [#491](https://github.com/fastly/cli/pull/491)
- Implement a yes/no user prompt abstraction [#500](https://github.com/fastly/cli/pull/500)
- Ensure build compilation errors are displayed [#492](https://github.com/fastly/cli/pull/492)
- Implement `--service-name` as swap-in replacement for `--service-id` [#495](https://github.com/fastly/cli/pull/495)
- Support `FASTLY_CUSTOMER_ID` environment variable [#494](https://github.com/fastly/cli/pull/494)
- Support `gotest` [#501](https://github.com/fastly/cli/pull/501)

**Bug fixes:**

- Fix the `--watch` flag for AssemblyScript [#493](https://github.com/fastly/cli/pull/493)
- Fix `compute init --from` for Windows [#490](https://github.com/fastly/cli/pull/490)
- Avoid triggering GitHub API rate limit when running Viceroy in CI [#488](https://github.com/fastly/cli/pull/488)
- Fix Windows ANSI escape code rendering [#503](https://github.com/fastly/cli/pull/503)
- Prevent runtime panic when global flag set with no command [#502](https://github.com/fastly/cli/pull/502)

## [v1.3.0](https://github.com/fastly/cli/releases/tag/v1.3.0) (2021-12-01)

[Full Changelog](https://github.com/fastly/cli/compare/v1.2.0...v1.3.0)

**Enhancements:**

- Implement custom `[scripts.build]` operation [#480](https://github.com/fastly/cli/pull/480)
- Move `manifest` package into top-level `pkg` directory [#478](https://github.com/fastly/cli/pull/478)
- Refactor AssemblyScript logic to call out to the JavaScript implementation [#479](https://github.com/fastly/cli/pull/479)

## [v1.2.0](https://github.com/fastly/cli/releases/tag/v1.2.0) (2021-11-25)

[Full Changelog](https://github.com/fastly/cli/compare/v1.1.1...v1.2.0)

**Enhancements:**

- Implement `SEE ALSO` section in help output [#472](https://github.com/fastly/cli/pull/472)
- Add command 'API' metadata [#473](https://github.com/fastly/cli/pull/473)

## [v1.1.1](https://github.com/fastly/cli/releases/tag/v1.1.1) (2021-11-11)

[Full Changelog](https://github.com/fastly/cli/compare/v1.1.0...v1.1.1)

**Bug fixes:**

- Avoid displaying a wildcard domain [#468](https://github.com/fastly/cli/pull/468)
- Set sensible defaults for host related flags on `backend create` [#469](https://github.com/fastly/cli/pull/469)
- Fix error extracting package files from `.tgz` archive [#470](https://github.com/fastly/cli/pull/470)

## [v1.1.0](https://github.com/fastly/cli/releases/tag/v1.1.0) (2021-11-08)

[Full Changelog](https://github.com/fastly/cli/compare/v1.0.1...v1.1.0)

**Enhancements:**

- Implement `--watch` flag for `compute serve` [#464](https://github.com/fastly/cli/pull/464)

## [v1.0.1](https://github.com/fastly/cli/releases/tag/v1.0.1) (2021-11-08)

[Full Changelog](https://github.com/fastly/cli/compare/v1.0.0...v1.0.1)

**Bug fixes:**

- Allow git repo to be used as a value at the starter kit prompt [#465](https://github.com/fastly/cli/pull/465)

## [v1.0.0](https://github.com/fastly/cli/releases/tag/v1.0.0) (2021-11-02)

[Full Changelog](https://github.com/fastly/cli/compare/v0.43.0...v1.0.0)

**Changed:**

- Use `EnumsVar` for `auth-token --scope` [#447](https://github.com/fastly/cli/pull/447)
- Rename `logs tail` to `log-tail` [#456](https://github.com/fastly/cli/pull/456)
- Rename `dictionaryitem` to `dictionary-item` [#459](https://github.com/fastly/cli/pull/459)
- Rename `fastly compute ... --path` flags [#460](https://github.com/fastly/cli/pull/460)
- Rename `--force` to `--skip-verification` [#461](https://github.com/fastly/cli/pull/461)

## [v0.43.0](https://github.com/fastly/cli/releases/tag/v0.43.0) (2021-11-01)

[Full Changelog](https://github.com/fastly/cli/compare/v0.42.0...v0.43.0)

**Bug fixes:**

- Ignore possible `rustup` 'sync' output when calling `rustc --version` [#453](https://github.com/fastly/cli/pull/453)
- Bump goreleaser to avoid Homebrew warning [#455](https://github.com/fastly/cli/pull/455)
- Prevent `.Hidden()` flags/commands from being documented via `--format json` [#454](https://github.com/fastly/cli/pull/454)

## [v0.42.0](https://github.com/fastly/cli/releases/tag/v0.42.0) (2021-10-22)

[Full Changelog](https://github.com/fastly/cli/compare/v0.41.0...v0.42.0)

**Enhancements:**

- Fallback to existing viceroy binary in case of network error [#445](https://github.com/fastly/cli/pull/445)
- Remove `text.ServiceType` abstraction [#449](https://github.com/fastly/cli/pull/449)

**Bug fixes:**

- Avoid fetching packages when manifest exists [#448](https://github.com/fastly/cli/pull/448)
- Implement `--path` lookup fallback for manifest [#446](https://github.com/fastly/cli/pull/446)
- Fix broken Windows support [#450](https://github.com/fastly/cli/pull/450)

## [v0.41.0](https://github.com/fastly/cli/releases/tag/v0.41.0) (2021-10-19)

[Full Changelog](https://github.com/fastly/cli/compare/v0.40.2...v0.41.0)

**Enhancements:**

- Implement `[setup.log_endpoints.<name>]` support [#443](https://github.com/fastly/cli/pull/443)
- The `compute init --from` flag should support archives [#428](https://github.com/fastly/cli/pull/428)
- Add region support for logentries logging endpoint [#375](https://github.com/fastly/cli/pull/375)

## [v0.40.2](https://github.com/fastly/cli/releases/tag/v0.40.2) (2021-10-14)

[Full Changelog](https://github.com/fastly/cli/compare/v0.40.1...v0.40.2)

**Bug fixes:**

- Fix shell autocomplete evaluation [#441](https://github.com/fastly/cli/pull/441)

## [v0.40.1](https://github.com/fastly/cli/releases/tag/v0.40.1) (2021-10-14)

[Full Changelog](https://github.com/fastly/cli/compare/v0.40.0...v0.40.1)

**Bug fixes:**

- Fix shell completion (and Homebrew upgrade) [#439](https://github.com/fastly/cli/pull/439)

## [v0.40.0](https://github.com/fastly/cli/releases/tag/v0.40.0) (2021-10-13)

[Full Changelog](https://github.com/fastly/cli/compare/v0.39.3...v0.40.0)

**Bug fixes:**

- Auto-migrate `manifest_version` from 1 to 2 when applicable [#434](https://github.com/fastly/cli/pull/434)
- Better error handling for manifest parsing [#436](https://github.com/fastly/cli/pull/436)

**Enhancements:**

- Implement `[setup.dictionaries]` support [#431](https://github.com/fastly/cli/pull/431)
- Tests for `[setup.dictionaries]` support [#438](https://github.com/fastly/cli/pull/438)
- Refactor `app.Run()` [#429](https://github.com/fastly/cli/pull/429)
- Ensure manifest is read only once for all missed references [#433](https://github.com/fastly/cli/pull/433)

## [v0.39.3](https://github.com/fastly/cli/releases/tag/v0.39.3) (2021-10-06)

[Full Changelog](https://github.com/fastly/cli/compare/v0.39.2...v0.39.3)

**Bug fixes:**

- Add missing description for `user list --customer-id` [#425](https://github.com/fastly/cli/pull/425)
- Trim the rust version to fix parse errors [#427](https://github.com/fastly/cli/pull/427)

**Enhancements:**

- Abstraction layer for `[setup.backends]` [#421](https://github.com/fastly/cli/pull/421)

## [v0.39.2](https://github.com/fastly/cli/releases/tag/v0.39.2) (2021-09-29)

[Full Changelog](https://github.com/fastly/cli/compare/v0.39.1...v0.39.2)

**Bug fixes:**

- Provide better remediation for unrecognised `manifest_version` [#422](https://github.com/fastly/cli/pull/422)
- Bump `go-fastly` to `v5.0.0` to fix ACL entries bug [#417](https://github.com/fastly/cli/pull/417)
- Remove Rust debug flags [#416](https://github.com/fastly/cli/pull/416)

**Enhancements:**

- Clarify Starter Kit options in `compute init` flow [#418](https://github.com/fastly/cli/pull/418)
- Avoid excessive manifest reads [#420](https://github.com/fastly/cli/pull/420)

## [v0.39.1](https://github.com/fastly/cli/releases/tag/v0.39.1) (2021-09-21)

[Full Changelog](https://github.com/fastly/cli/compare/v0.39.0...v0.39.1)

**Bug fixes:**

- Bug fixes for `auth-token` [#413](https://github.com/fastly/cli/pull/413)

## [v0.39.0](https://github.com/fastly/cli/releases/tag/v0.39.0) (2021-09-21)

[Full Changelog](https://github.com/fastly/cli/compare/v0.38.0...v0.39.0)

**Enhancements:**

- Implement `user` commands [#406](https://github.com/fastly/cli/pull/406)
- Implement `auth-token` commands [#409](https://github.com/fastly/cli/pull/409)
- Add region support for New Relic logging endpoint [#378](https://github.com/fastly/cli/pull/378)

**Bug fixes:**

- Add the `--name` flag to `compute deploy` [#410](https://github.com/fastly/cli/pull/410)

## [v0.38.0](https://github.com/fastly/cli/releases/tag/v0.38.0) (2021-09-15)

[Full Changelog](https://github.com/fastly/cli/compare/v0.37.1...v0.38.0)

**Enhancements:**

- Add support for `override_host` to Local Server configuration [#394](https://github.com/fastly/cli/pull/394)
- Add support for Dictionaries to Local Server configuration [#395](https://github.com/fastly/cli/pull/395)
- Integrate domain validation [#402](https://github.com/fastly/cli/pull/402)
- Refactor Versioner `GitHub.Download()` logic [#403](https://github.com/fastly/cli/pull/403)

**Bug fixes:**

- Pass down `compute publish --name` to `compute deploy` [#398](https://github.com/fastly/cli/pull/398)
- Sanitise name when packing the wasm file [#401](https://github.com/fastly/cli/pull/401)
- Use a non-interactive progress writer in non-TTY environments [#405](https://github.com/fastly/cli/pull/405)

**Removed:**

- Remove support for Scoop, the Window's command-line installer [#396](https://github.com/fastly/cli/pull/396)
- Remove unused 'rename local binary' code [#399](https://github.com/fastly/cli/pull/399)

## [v0.37.1](https://github.com/fastly/cli/releases/tag/v0.37.1) (2021-09-06)

[Full Changelog](https://github.com/fastly/cli/compare/v0.37.0...v0.37.1)

**Enhancements:**

- Bump `go-github` dependency to latest release [#388](https://github.com/fastly/cli/pull/388)
- Add Service ID to `--verbose` output [#383](https://github.com/fastly/cli/pull/383)

**Bug fixes:**

- Download Viceroy to a _randomly_ generated directory [#386](https://github.com/fastly/cli/pull/386)
- Bug fix for ensuring assets are downloaded into a randomly generated directory [#389](https://github.com/fastly/cli/pull/389)

## [v0.37.0](https://github.com/fastly/cli/releases/tag/v0.37.0) (2021-09-03)

[Full Changelog](https://github.com/fastly/cli/compare/v0.36.0...v0.37.0)

**Enhancements:**

- Update CLI config using flag on `update` command [#382](https://github.com/fastly/cli/pull/382)
- Validate package size doesn't exceed limit [#380](https://github.com/fastly/cli/pull/380)
- Log tailing should respect the configured `--endpoint` [#374](https://github.com/fastly/cli/pull/374)
- Support Windows arm64 [#372](https://github.com/fastly/cli/pull/372)
- Refactor compute deploy logic to better support `[setup]` configuration [#370](https://github.com/fastly/cli/pull/370)
- Omit messaging when using `--accept-defaults` [#366](https://github.com/fastly/cli/pull/366)
- Implement `[setup]` configuration for backends [#355](https://github.com/fastly/cli/pull/355)
- Refactor code to help CI performance [#360](https://github.com/fastly/cli/pull/360)

**Bug fixes:**

- Add executable permissions to Viceroy binary after renaming/moving it [#368](https://github.com/fastly/cli/pull/368)
- Update rust toolchain validation steps [#371](https://github.com/fastly/cli/pull/371)

**Security:**

- Update dependency to avoid dependabot warning in GitHub UI [#381](https://github.com/fastly/cli/pull/381)

## [v0.36.0](https://github.com/fastly/cli/releases/tag/v0.36.0) (2021-07-30)

[Full Changelog](https://github.com/fastly/cli/compare/v0.35.0...v0.36.0)

**Enhancements:**

- Implement `logging newrelic` command [#354](https://github.com/fastly/cli/pull/354)

## [v0.35.0](https://github.com/fastly/cli/releases/tag/v0.35.0) (2021-07-29)

[Full Changelog](https://github.com/fastly/cli/compare/v0.34.0...v0.35.0)

**Enhancements:**

- Support for Compute@Edge JS SDK (Beta) [#347](https://github.com/fastly/cli/pull/347)
- Implement `--override-host` and `--ssl-sni-hostname` [#352](https://github.com/fastly/cli/pull/352)
- Implement `acl` command [#350](https://github.com/fastly/cli/pull/350)
- Implement `acl-entry` command [#351](https://github.com/fastly/cli/pull/351)
- Separate command files from other logic files [#349](https://github.com/fastly/cli/pull/349)
- Log a record of errors to disk [#340](https://github.com/fastly/cli/pull/340)

**Bug fixes:**

- Fix nondeterministic flag parsing [#353](https://github.com/fastly/cli/pull/353)
- Fix `compute serve --addr` description to reference port requirement [#348](https://github.com/fastly/cli/pull/348)

## [v0.34.0](https://github.com/fastly/cli/releases/tag/v0.34.0) (2021-07-16)

[Full Changelog](https://github.com/fastly/cli/compare/v0.33.0...v0.34.0)

**Enhancements:**

- Implement `compute serve` subcommand [#252](https://github.com/fastly/cli/pull/252)
- Simplify logic for prefixing fastly spec to file [#345](https://github.com/fastly/cli/pull/345)
- `fastly compute publish` and `deploy` should accept a comment [#328](https://github.com/fastly/cli/pull/328)
- Improve GitHub Actions intermittent test timeouts [#336](https://github.com/fastly/cli/pull/336)
- New flags for displaying the CLI config, and its location [#338](https://github.com/fastly/cli/pull/338)
- Don't allow stats short help to wrap [#331](https://github.com/fastly/cli/pull/331)

**Bug fixes:**

- Ensure incompatibility message only shown when config is invalid [#335](https://github.com/fastly/cli/pull/335)
- Check-in static config for traditional golang workflows [#337](https://github.com/fastly/cli/pull/337)

## [v0.33.0](https://github.com/fastly/cli/releases/tag/v0.33.0) (2021-07-06)

[Full Changelog](https://github.com/fastly/cli/compare/v0.32.0...v0.33.0)

**Enhancements:**

- Improve CI workflow [#333](https://github.com/fastly/cli/pull/333)
- Support multiple versions of Rust [#330](https://github.com/fastly/cli/pull/330)
- Replace `app.Run` positional signature with a struct [#329](https://github.com/fastly/cli/pull/329)
- Test suite improvements [#327](https://github.com/fastly/cli/pull/327)

## [v0.32.0](https://github.com/fastly/cli/releases/tag/v0.32.0) (2021-06-30)

[Full Changelog](https://github.com/fastly/cli/compare/v0.31.0...v0.32.0)

**Enhancements:**

- Embed app config into compiled CLI binary [#312](https://github.com/fastly/cli/pull/312)
- Service ID lookup includes `$FASTLY_SERVICE_ID` environment variable [#320](https://github.com/fastly/cli/pull/320)
- Implement `vcl custom` commands [#310](https://github.com/fastly/cli/pull/310)
- Implement `vcl snippet` commands [#316](https://github.com/fastly/cli/pull/316)
- Implement `purge` command [#323](https://github.com/fastly/cli/pull/323)

**Bug fixes:**

- Correctly set the port if `--use-ssl` is used [#317](https://github.com/fastly/cli/pull/317)
- Fixed a regression in `compute publish` [#321](https://github.com/fastly/cli/pull/321)

## [v0.31.0](https://github.com/fastly/cli/releases/tag/v0.31.0) (2021-06-17)

[Full Changelog](https://github.com/fastly/cli/compare/v0.30.0...v0.31.0)

**Enhancements:**

- Add new `pops` command [#309](https://github.com/fastly/cli/pull/309)
- Add new `ip-list` command [#308](https://github.com/fastly/cli/pull/308)
- Implement new `--version` and `--autoclone` flags [#302](https://github.com/fastly/cli/pull/302)
- Reword `backend create --use-ssl` warning output [#303](https://github.com/fastly/cli/pull/303)
- Define new `--version` and `--autoclone` flags [#300](https://github.com/fastly/cli/pull/300)
- Implement remediation for dynamic config context deadline error [#298](https://github.com/fastly/cli/pull/298)
- Capitalise 'n' for `[y/N]` prompt [#299](https://github.com/fastly/cli/pull/299)
- Move exec behaviour from `common` package to its own package [#297](https://github.com/fastly/cli/pull/297)
- Move command behaviour from `common` package to its own package [#296](https://github.com/fastly/cli/pull/296)
- Move time behaviour from `common` package to its own package [#295](https://github.com/fastly/cli/pull/295)
- Move sync behaviour from `common` package to its own package [#294](https://github.com/fastly/cli/pull/294)
- Move undo behaviour from `common` package to its own package [#293](https://github.com/fastly/cli/pull/293)
- Surface any cargo metadata errors [#286](https://github.com/fastly/cli/pull/286)

**Bug fixes:**

- Don't persist `--service-id` flag value to manifest [#307](https://github.com/fastly/cli/pull/307)
- Fix broken `--service-id` flag in `compute publish` [#292](https://github.com/fastly/cli/pull/292)
- Fix parsing backend port number [#291](https://github.com/fastly/cli/pull/291)

**Documentation:**

- Update broken link in `stats historical` [#285](https://github.com/fastly/cli/pull/285)

## [v0.30.0](https://github.com/fastly/cli/releases/tag/v0.30.0) (2021-05-19)

[Full Changelog](https://github.com/fastly/cli/compare/v0.29.0...v0.30.0)

**Enhancements:**

- Update messaging for `rustup self update` [#281](https://github.com/fastly/cli/pull/281)
- Replace archived go-git dependency [#283](https://github.com/fastly/cli/pull/283)
- Implement `pack` subcommand [#282](https://github.com/fastly/cli/pull/282)

## [v0.29.0](https://github.com/fastly/cli/releases/tag/v0.29.0) (2021-05-13)

[Full Changelog](https://github.com/fastly/cli/compare/v0.28.0...v0.29.0)

**Enhancements:**

- Add arm64 to macOS build [#277](https://github.com/fastly/cli/pull/277)

**Bug fixes:**

- Validate package before prompting inside `compute deploy` flow [#279](https://github.com/fastly/cli/pull/279)
- Clear Service ID from manifest when service is deleted [#278](https://github.com/fastly/cli/pull/278)

## [v0.28.0](https://github.com/fastly/cli/releases/tag/v0.28.0) (2021-05-11)

[Full Changelog](https://github.com/fastly/cli/compare/v0.27.2...v0.28.0)

**Enhancements:**

- Add `isBool` to command flags [#267](https://github.com/fastly/cli/pull/267)
- Move service creation to `fastly compute deploy`. [#266](https://github.com/fastly/cli/pull/266)

**Bug fixes:**

- Fix runtime panic when dealing with empty manifest. [#274](https://github.com/fastly/cli/pull/274)
- Fix `--force` flag not being respected. [#272](https://github.com/fastly/cli/pull/272)
- Clean-out `service_id` from manifest when deleting a service. [#268](https://github.com/fastly/cli/pull/268)

## [v0.27.2](https://github.com/fastly/cli/releases/tag/v0.27.2) (2021-04-21)

[Full Changelog](https://github.com/fastly/cli/compare/v0.27.1...v0.27.2)

**Bug fixes:**

- Fix bug where legacy creds are reset after call to configure subcommand. [#260](https://github.com/fastly/cli/pull/260)

## [v0.27.1](https://github.com/fastly/cli/releases/tag/v0.27.1) (2021-04-16)

[Full Changelog](https://github.com/fastly/cli/compare/v0.27.0...v0.27.1)

**Bug fixes:**

- Track CLI version. [#257](https://github.com/fastly/cli/pull/257)

## [v0.27.0](https://github.com/fastly/cli/releases/tag/v0.27.0) (2021-04-15)

[Full Changelog](https://github.com/fastly/cli/compare/v0.26.3...v0.27.0)

**Enhancements:**

- Support IAM role in Kinesis logging endpoint [#255](https://github.com/fastly/cli/pull/255)
- Support IAM role in S3 and Kinesis logging endpoints [#253](https://github.com/fastly/cli/pull/253)
- Add support for `file_max_bytes` configuration for Azure logging endpoint [#251](https://github.com/fastly/cli/pull/251)
- Warn on empty directory [#247](https://github.com/fastly/cli/pull/247)
- Add `compute publish` subcommand [#242](https://github.com/fastly/cli/pull/242)
- Allow local binary to be renamed [#240](https://github.com/fastly/cli/pull/240)
- Retain `RUSTFLAGS` values from the environment [#239](https://github.com/fastly/cli/pull/239)
- Make GitHub Versioner configurable [#236](https://github.com/fastly/cli/pull/236)
- Add support for `compression_codec` to logging file sink endpoints [#190](https://github.com/fastly/cli/pull/190)

**Bug fixes:**

- Remove flaky test logic. [#249](https://github.com/fastly/cli/pull/249)
- Check the rustup version [#248](https://github.com/fastly/cli/pull/248)
- Print all commands and subcommands in usage [#244](https://github.com/fastly/cli/pull/244)
- pkg/logs: fix typo in error message [#238](https://github.com/fastly/cli/pull/238)

## [v0.26.3](https://github.com/fastly/cli/releases/tag/v0.26.3) (2021-03-26)

[Full Changelog](https://github.com/fastly/cli/compare/v0.26.2...v0.26.3)

**Enhancements:**

- Default to port 443 if UseSSL set. [#234](https://github.com/fastly/cli/pull/234)

**Bug fixes:**

- Ensure all UPDATE operations don't set optional fields. [#235](https://github.com/fastly/cli/pull/235)
- Avoid setting fields that cause API to fail when given zero value. [#233](https://github.com/fastly/cli/pull/233)

## [v0.26.2](https://github.com/fastly/cli/releases/tag/v0.26.2) (2021-03-22)

[Full Changelog](https://github.com/fastly/cli/compare/v0.26.1...v0.26.2)

**Enhancements:**

- Extra error handling around loading remote configuration data. [#229](https://github.com/fastly/cli/pull/229)

**Bug fixes:**

- `fastly compute build` exits with error 1 [#227](https://github.com/fastly/cli/issues/227)
- Set GOVERSION for goreleaser. [#228](https://github.com/fastly/cli/pull/228)

## [v0.26.1](https://github.com/fastly/cli/releases/tag/v0.26.1) (2021-03-19)

[Full Changelog](https://github.com/fastly/cli/compare/v0.26.0...v0.26.1)

**Bug fixes:**

- Fix manifest_version as a section bug. [#225](https://github.com/fastly/cli/pull/225)

## [v0.26.0](https://github.com/fastly/cli/releases/tag/v0.26.0) (2021-03-18)

[Full Changelog](https://github.com/fastly/cli/compare/v0.25.2...v0.26.0)

**Enhancements:**

- Remove version from fastly.toml manifest. [#222](https://github.com/fastly/cli/pull/222)
- Don't run "cargo update" before building rust app. [#221](https://github.com/fastly/cli/pull/221)

**Bug fixes:**

- Loading remote config.toml should fail gracefully. [#223](https://github.com/fastly/cli/pull/223)
- Update the fastly.toml manifest if missing manifest_version. [#220](https://github.com/fastly/cli/pull/220)
- Refactor UserAgent. [#219](https://github.com/fastly/cli/pull/219)

## [v0.25.2](https://github.com/fastly/cli/releases/tag/v0.25.2) (2021-03-16)

[Full Changelog](https://github.com/fastly/cli/compare/v0.25.1...v0.25.2)

**Bug fixes:**

- Fix duplicate warning messages and missing SetOutput(). [#216](https://github.com/fastly/cli/pull/216)

## [v0.25.1](https://github.com/fastly/cli/releases/tag/v0.25.1) (2021-03-16)

[Full Changelog](https://github.com/fastly/cli/compare/v0.25.0...v0.25.1)

**Bug fixes:**

- The manifest_version should default to 1 if missing. [#214](https://github.com/fastly/cli/pull/214)

## [v0.25.0](https://github.com/fastly/cli/releases/tag/v0.25.0) (2021-03-16)

[Full Changelog](https://github.com/fastly/cli/compare/v0.24.2...v0.25.0)

**Enhancements:**

- Replace deprecated ioutil functions with go 1.16. [#212](https://github.com/fastly/cli/pull/212)
- Replace TOML parser [#211](https://github.com/fastly/cli/pull/211)
- Implement manifest_version into the fastly.toml [#210](https://github.com/fastly/cli/pull/210)
- Dynamic Configuration [#187](https://github.com/fastly/cli/pull/187)

**Bug fixes:**

- Log output should be simplified when running in CI [#175](https://github.com/fastly/cli/issues/175)
- Override error message in compute init [#204](https://github.com/fastly/cli/pull/204)

## [v0.24.2](https://github.com/fastly/cli/releases/tag/v0.24.2) (2021-02-15)

[Full Changelog](https://github.com/fastly/cli/compare/v0.24.1...v0.24.2)

**Bug fixes:**

- Fix CI binary overlap [#209](https://github.com/fastly/cli/pull/209)
- Fix CI workflow by switching from old syntax to new [#208](https://github.com/fastly/cli/pull/208)
- Fix goreleaser version lookup [#207](https://github.com/fastly/cli/pull/207)
- LogTail: Properly close response body [#205](https://github.com/fastly/cli/pull/205)
- Add port prompt for compute init [#203](https://github.com/fastly/cli/pull/203)
- Update GitHub Action to not use commit hash [#200](https://github.com/fastly/cli/pull/200)

## [v0.24.1](https://github.com/fastly/cli/releases/tag/v0.24.1) (2021-02-03)

[Full Changelog](https://github.com/fastly/cli/compare/v0.24.0...v0.24.1)

**Bug fixes:**

- Logs Tail: Give the user better feedback when --from flag errors [#201](https://github.com/fastly/cli/pull/201)

## [v0.24.0](https://github.com/fastly/cli/releases/tag/v0.24.0) (2021-02-02)

[Full Changelog](https://github.com/fastly/cli/compare/v0.23.0...v0.24.0)

**Enhancements:**

- Add static content starter kit [#197](https://github.com/fastly/cli/pull/197)
- 🦀 Update rust toolchain [#196](https://github.com/fastly/cli/pull/196)

**Bug fixes:**

- Fix go vet error related to missing docstring [#198](https://github.com/fastly/cli/pull/198)

## [v0.23.0](https://github.com/fastly/cli/releases/tag/v0.23.0) (2021-01-22)

[Full Changelog](https://github.com/fastly/cli/compare/v0.22.0...v0.23.0)

**Enhancements:**

- Update Go-Fastly dependency to v3.0.0 [#193](https://github.com/fastly/cli/pull/193)
- Support for Compute@Edge Log Tailing [#192](https://github.com/fastly/cli/pull/192)

**Bug fixes:**

- Resolve issues with Rust integration tests. [#194](https://github.com/fastly/cli/pull/194)
- Update URL for default Rust starter [#191](https://github.com/fastly/cli/pull/191)

## [v0.22.0](https://github.com/fastly/cli/releases/tag/v0.22.0) (2021-01-07)

[Full Changelog](https://github.com/fastly/cli/compare/v0.21.2...v0.22.0)

**Enhancements:**

- Add support for TLS client and batch size options for splunk [#183](https://github.com/fastly/cli/pull/183)
- Add support for Kinesis logging endpoint [#177](https://github.com/fastly/cli/pull/177)

## [v0.21.2](https://github.com/fastly/cli/releases/tag/v0.21.2) (2021-01-06)

[Full Changelog](https://github.com/fastly/cli/compare/v0.21.1...v0.21.2)

**Bug fixes:**

- Switch from third-party dependency to our own mirror [#184](https://github.com/fastly/cli/pull/184)

## [v0.21.1](https://github.com/fastly/cli/releases/tag/v0.21.1) (2020-12-18)

[Full Changelog](https://github.com/fastly/cli/compare/v0.21.0...v0.21.1)

**Bug fixes:**

- CLI shouldn't recommend Rust crate prerelease versions [#168](https://github.com/fastly/cli/issues/168)
- Run cargo update before attempting to build Rust compute packages [#179](https://github.com/fastly/cli/pull/179)

## [v0.21.0](https://github.com/fastly/cli/releases/tag/v0.21.0) (2020-12-14)

[Full Changelog](https://github.com/fastly/cli/compare/v0.20.0...v0.21.0)

**Enhancements:**

- Adds support for managing edge dictionaries [#159](https://github.com/fastly/cli/pull/159)

## [v0.20.0](https://github.com/fastly/cli/releases/tag/v0.20.0) (2020-11-24)

[Full Changelog](https://github.com/fastly/cli/compare/v0.19.0...v0.20.0)

**Enhancements:**

- Migrate to Go-Fastly 2.0.0 [#169](https://github.com/fastly/cli/pull/169)

**Bug fixes:**

- Build failure with Cargo workspaces [#171](https://github.com/fastly/cli/issues/171)
- Support cargo workspaces [#172](https://github.com/fastly/cli/pull/172)

## [v0.19.0](https://github.com/fastly/cli/releases/tag/v0.19.0) (2020-11-19)

[Full Changelog](https://github.com/fastly/cli/compare/v0.18.1...v0.19.0)

**Enhancements:**

- Support sasl kafka endpoint options in Fastly CLI [#161](https://github.com/fastly/cli/pull/161)

## [v0.18.1](https://github.com/fastly/cli/releases/tag/v0.18.1) (2020-11-03)

[Full Changelog](https://github.com/fastly/cli/compare/v0.18.0...v0.18.1)

**Enhancements:**

- Update the default Rust template to fastly-0.5.0 [#163](https://github.com/fastly/cli/pull/163)

**Bug fixes:**

- Constrain Version Upgrade Suggestion [#165](https://github.com/fastly/cli/pull/165)
- Fix AssemblyScript compilation messaging [#164](https://github.com/fastly/cli/pull/164)

## [v0.18.0](https://github.com/fastly/cli/releases/tag/v0.18.0) (2020-10-27)

[Full Changelog](https://github.com/fastly/cli/compare/v0.17.0...v0.18.0)

**Enhancements:**

- Add AssemblyScript support to compute init and build commands [#160](https://github.com/fastly/cli/pull/160)

## [v0.17.0](https://github.com/fastly/cli/releases/tag/v0.17.0) (2020-09-24)

[Full Changelog](https://github.com/fastly/cli/compare/v0.16.1...v0.17.0)

**Enhancements:**

- Bump supported Rust toolchain version to 1.46 [#156](https://github.com/fastly/cli/pull/156)
- Add service search command [#152](https://github.com/fastly/cli/pull/152)

**Bug fixes:**

- Broken link in usage info [#148](https://github.com/fastly/cli/issues/148)

## [v0.16.1](https://github.com/fastly/cli/releases/tag/v0.16.1) (2020-07-21)

[Full Changelog](https://github.com/fastly/cli/compare/v0.16.0...v0.16.1)

**Bug fixes:**

- Display the correct version number on error [#144](https://github.com/fastly/cli/pull/144)
- Fix bug where name was not added to the manifest [#143](https://github.com/fastly/cli/pull/143)

## [v0.16.0](https://github.com/fastly/cli/releases/tag/v0.16.0) (2020-07-09)

[Full Changelog](https://github.com/fastly/cli/compare/v0.15.0...v0.16.0)

**Enhancements:**

- Compare package hashsum during deployment [#139](https://github.com/fastly/cli/pull/139)
- Allow compute init to be reinvoked within an existing package directory [#138](https://github.com/fastly/cli/pull/138)

## [v0.15.0](https://github.com/fastly/cli/releases/tag/v0.15.0) (2020-06-29)

[Full Changelog](https://github.com/fastly/cli/compare/v0.14.0...v0.15.0)

**Enhancements:**

- Adds OpenStack logging support [#132](https://github.com/fastly/cli/pull/132)

## [v0.14.0](https://github.com/fastly/cli/releases/tag/v0.14.0) (2020-06-25)

[Full Changelog](https://github.com/fastly/cli/compare/v0.13.0...v0.14.0)

**Enhancements:**

- Bump default Rust template version to v0.4.0 [#133](https://github.com/fastly/cli/pull/133)

## [v0.13.0](https://github.com/fastly/cli/releases/tag/v0.13.0) (2020-06-15)

[Full Changelog](https://github.com/fastly/cli/compare/v0.12.0...v0.13.0)

**Enhancements:**

- Allow compute services to be initialised from an existing service ID [#125](https://github.com/fastly/cli/pull/125)

**Bug fixes:**

- Fix bash completion [#128](https://github.com/fastly/cli/pull/128)

**Closed issues:**

- Bash Autocomplete is broken [#127](https://github.com/fastly/cli/issues/127)

## [v0.12.0](https://github.com/fastly/cli/releases/tag/v0.12.0) (2020-06-05)

[Full Changelog](https://github.com/fastly/cli/compare/v0.11.0...v0.12.0)

**Enhancements:**

- Adds MessageType field to SFTP [#118](https://github.com/fastly/cli/pull/118)
- Adds User field to Cloudfiles Updates [#117](https://github.com/fastly/cli/pull/117)
- Adds Region field to Scalyr [#116](https://github.com/fastly/cli/pull/116)
- Adds PublicKey field to S3 [#114](https://github.com/fastly/cli/pull/114)
- Adds MessageType field to GCS Updates [#113](https://github.com/fastly/cli/pull/113)
- Adds ResponseCondition and Placement fields to BigQuery Creates [#111](https://github.com/fastly/cli/pull/111)

**Bug fixes:**

- Unable to login with API key [#94](https://github.com/fastly/cli/issues/94)

## [v0.11.0](https://github.com/fastly/cli/releases/tag/v0.11.0) (2020-05-29)

[Full Changelog](https://github.com/fastly/cli/compare/v0.10.0...v0.11.0)

**Enhancements:**

- Add ability to exclude files from build package [#87](https://github.com/fastly/cli/pull/87)

**Bug fixes:**

- unintended files included in upload package [#24](https://github.com/fastly/cli/issues/24)

## [v0.10.0](https://github.com/fastly/cli/releases/tag/v0.10.0) (2020-05-28)

[Full Changelog](https://github.com/fastly/cli/compare/v0.9.0...v0.10.0)

**Enhancements:**

- Adds Google Cloud Pub/Sub logging endpoint support [#96](https://github.com/fastly/cli/pull/96)
- Adds Datadog logging endpoint support [#92](https://github.com/fastly/cli/pull/92)
- Adds HTTPS logging endpoint support [#91](https://github.com/fastly/cli/pull/91)
- Adds Elasticsearch logging endpoint support [#90](https://github.com/fastly/cli/pull/90)
- Adds Azure Blob Storage logging endpoint support [#89](https://github.com/fastly/cli/pull/89)

## [v0.9.0](https://github.com/fastly/cli/releases/tag/v0.9.0) (2020-05-21)

[Full Changelog](https://github.com/fastly/cli/compare/v0.8.0...v0.9.0)

**Breaking changes:**

- Describe subcommand consistent --name short flag -d -> -n [#85](https://github.com/fastly/cli/pull/85)

**Enhancements:**

- Adds Kafka logging endpoint support [#95](https://github.com/fastly/cli/pull/95)
- Adds DigitalOcean Spaces logging endpoint support [#80](https://github.com/fastly/cli/pull/80)
- Adds Rackspace Cloudfiles logging endpoint support [#79](https://github.com/fastly/cli/pull/79)
- Adds Log Shuttle logging endpoint support [#78](https://github.com/fastly/cli/pull/78)
- Adds SFTP logging endpoint support [#77](https://github.com/fastly/cli/pull/77)
- Adds Heroku logging endpoint support [#76](https://github.com/fastly/cli/pull/76)
- Adds Honeycomb logging endpoint support [#75](https://github.com/fastly/cli/pull/75)
- Adds Loggly logging endpoint support [#74](https://github.com/fastly/cli/pull/74)
- Adds Scalyr logging endpoint support [#73](https://github.com/fastly/cli/pull/73)
- Verify fastly crate version during compute build. [#67](https://github.com/fastly/cli/pull/67)
- Basic support for historical & realtime stats [#66](https://github.com/fastly/cli/pull/66)
- Adds Splunk endpoint [#64](https://github.com/fastly/cli/pull/64)
- Adds FTP logging endpoint support [#63](https://github.com/fastly/cli/pull/63)
- Adds GCS logging endpoint support [#62](https://github.com/fastly/cli/pull/62)
- Adds Sumo Logic logging endpoint support [#59](https://github.com/fastly/cli/pull/59)
- Adds Papertrail logging endpoint support [#57](https://github.com/fastly/cli/pull/57)
- Adds Logentries logging endpoint support [#56](https://github.com/fastly/cli/pull/56)

**Bug fixes:**

- Fallback to a file copy during update if the file rename fails [#72](https://github.com/fastly/cli/pull/72)

## [v0.8.0](https://github.com/fastly/cli/releases/tag/v0.8.0) (2020-05-13)

[Full Changelog](https://github.com/fastly/cli/compare/v0.7.1...v0.8.0)

**Enhancements:**

- Add a --force flag to compute build to skip verification steps. [#68](https://github.com/fastly/cli/pull/68)
- Improve `compute build` rust compilation error messaging [#60](https://github.com/fastly/cli/pull/60)
- Adds Syslog logging endpoint support [#55](https://github.com/fastly/cli/pull/55)

**Bug fixes:**

- debian package doesn't install in default $PATH [#58](https://github.com/fastly/cli/issues/58)
- deb and rpm packages install the binary in `/usr/local` instead of `/usr/local/bin` [#53](https://github.com/fastly/cli/issues/53)

**Closed issues:**

- ERROR: error during compilation process: exit status 101. [#52](https://github.com/fastly/cli/issues/52)

## [v0.7.1](https://github.com/fastly/cli/releases/tag/v0.7.1) (2020-05-04)

[Full Changelog](https://github.com/fastly/cli/compare/v0.7.0...v0.7.1)

**Bug fixes:**

- Ensure compute deploy selects the most ideal version to clone/activate [#50](https://github.com/fastly/cli/pull/50)

## [v0.7.0](https://github.com/fastly/cli/releases/tag/v0.7.0) (2020-04-28)

[Full Changelog](https://github.com/fastly/cli/compare/v0.6.0...v0.7.0)

**Enhancements:**

- Publish scoop package manifest during release process [#45](https://github.com/fastly/cli/pull/45)
- Generate dep and rpm packages during release process [#44](https://github.com/fastly/cli/pull/44)
- 🦀 🆙date to Rust 1.43.0 [#40](https://github.com/fastly/cli/pull/40)

**Closed issues:**

- README's build instructions do not work without additional dependencies met [#35](https://github.com/fastly/cli/issues/35)

## [v0.6.0](https://github.com/fastly/cli/releases/tag/v0.6.0) (2020-04-24)

[Full Changelog](https://github.com/fastly/cli/compare/v0.5.0...v0.6.0)

**Enhancements:**

- Bump default Rust template to v0.3.0 [#32](https://github.com/fastly/cli/pull/32)
- Publish to homebrew [#26](https://github.com/fastly/cli/pull/26)

**Bug fixes:**

- Don't display the fastly token in the terminal when doing `fastly configure` [#27](https://github.com/fastly/cli/issues/27)
- Documentation typo in `fastly service-version update` [#22](https://github.com/fastly/cli/issues/22)
- Fix typo in service-version update command [#31](https://github.com/fastly/cli/pull/31)
- Tidy up `fastly configure` text output [#30](https://github.com/fastly/cli/pull/30)
- compute/init: make space after Author prompt match other prompts [#25](https://github.com/fastly/cli/pull/25)

## [v0.5.0](https://github.com/fastly/cli/releases/tag/v0.5.0) (2020-04-08)

[Full Changelog](https://github.com/fastly/cli/compare/v0.4.1...v0.5.0)

**Enhancements:**

- Add the ability to initialise a compute project from a specific branch [#14](https://github.com/fastly/cli/pull/14)

## [v0.4.1](https://github.com/fastly/cli/releases/tag/v0.4.1) (2020-03-27)

[Full Changelog](https://github.com/fastly/cli/compare/v0.4.0...v0.4.1)

**Bug fixes:**

- Fix persistence of author string to fastly.toml [#12](https://github.com/fastly/cli/pull/12)
- Fix up undoStack.RunIfError [#11](https://github.com/fastly/cli/pull/11)

## [v0.4.0](https://github.com/fastly/cli/releases/tag/v0.4.0) (2020-03-20)

[Full Changelog](https://github.com/fastly/cli/compare/v0.3.0...v0.4.0)

**Enhancements:**

- Add commands for S3 logging endpoints [#9](https://github.com/fastly/cli/pull/9)
- Add useful next step links to compute deploy [#8](https://github.com/fastly/cli/pull/8)
- Persist version to manifest file when deploying compute services [#7](https://github.com/fastly/cli/pull/7)

**Bug fixes:**

- Fix comment for --use-ssl flag [#6](https://github.com/fastly/cli/pull/6)

## [v0.3.0](https://github.com/fastly/cli/releases/tag/v0.3.0) (2020-03-11)

[Full Changelog](https://github.com/fastly/cli/compare/v0.2.0...v0.3.0)

**Enhancements:**

- Interactive init [#5](https://github.com/fastly/cli/pull/5)

## [v0.2.0](https://github.com/fastly/cli/releases/tag/v0.2.0) (2020-02-24)

[Full Changelog](https://github.com/fastly/cli/compare/v0.1.0...v0.2.0)

**Enhancements:**

- Improve toolchain installation help messaging [#3](https://github.com/fastly/cli/pull/3)

**Bug fixes:**

- Filter unwanted files from template repository whilst initialising [#1](https://github.com/fastly/cli/pull/1)

## [v0.1.0](https://github.com/fastly/cli/releases/tag/v0.1.0) (2020-02-05)

[Full Changelog](https://github.com/fastly/cli/compare/5a8d21b6b1973abe7a27f985856d910f4396ce95...v0.1.0)

Initial release :tada:

\* _This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)_
