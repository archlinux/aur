# AGENTS.md

This file provides guidance to Qoder (qoder.com) when working with code in this repository.

## Overview

AUR (Arch User Repository) package for `qodercli-bin`, packaging the pre-built Qoder CLI binary for Arch Linux. Supports `x86_64` and `aarch64` architectures.

## Key Files

- `PKGBUILD` — Arch package build recipe. Downloads pre-built binaries from `download.qoder.com` and installs them to `/usr/bin/qodercli`.
- `.SRCINFO` — Auto-generated metadata from PKGBUILD. **Never edit manually.**
- `LICENSE` — Local HTML copy of the Qoder Product Service license (fetched from `https://qoder.com/product-service`). Committed local file.
- `qodercli.bash`, `qodercli.zsh`, `qodercli.fish` — Shell completion scripts. Maintained manually.

## Update Workflow

When user says "检查升级", "check update", or wants to update the package:

### 1. Fetch upstream info

```bash
curl -fsSL https://download.qoder.com/qodercli/channels/manifest.json
```

Extract from manifest:
- `latest` — new version string
- `sha256` for `os=linux, arch=amd64` — for x86_64
- `sha256` for `os=linux, arch=arm64` — for aarch64

```bash
curl -fsSL https://qoder.com/product-service -o /tmp/LICENSE.new
sha256sum /tmp/LICENSE.new
```

### 2. Compare and update PKGBUILD

**If version changed:**
- Update `pkgver=<new_version>`
- Reset `pkgrel=1`
- Update `sha256sums_x86_64=('<amd64_sha256>')`
- Update `sha256sums_aarch64=('<arm64_sha256>')`

**If LICENSE changed** (compare sha256):
- Replace `LICENSE` file with new content
- Update `sha256sums=('<new_license_sha256>'` (first entry)
- If version didn't change: increment `pkgrel`

**Regenerate .SRCINFO:**
```bash
makepkg --printsrcinfo > .SRCINFO
```

### 3. Check completions (only if version changed)

Reference sources:
- `qodercli --help`, `qodercli <subcommand> --help`
- https://docs.qoder.com/cli/using-cli

Compare with completion scripts. Update if CLI changed.

### 4. Validate

```bash
bash -n qodercli.bash && zsh -n qodercli.zsh && fish -n qodercli.fish
namcap PKGBUILD
makepkg -si  # optional: local test build
```

### 5. Commit

Use conventional commits format.

### 6. Push

Only when user explicitly requests: `git push`

## Other Commands

```bash
makepkg --printsrcinfo > .SRCINFO  # Regenerate after manual PKGBUILD edits
makepkg -si                        # Test-build locally
namcap PKGBUILD                    # Validate PKGBUILD
```

## Workflow Notes

- When `pkgver` changes, `pkgrel` resets to `1`.
- When only the LICENSE changes (no version bump), `pkgrel` is incremented.
- `.SRCINFO` must always be regenerated and committed alongside any PKGBUILD change.
- Checksums (`sha256sums_x86_64`, `sha256sums_aarch64`, `sha256sums`) must match the actual source files.
- After a version bump, check if new CLI commands/flags were added and update the shell completion scripts accordingly.
- This package conflicts with `qoder-cli` (a hypothetical source-built variant). The binary is installed as `/usr/bin/qodercli`.
- **AUR repositories must not contain subdirectories.** All files must be at the repo root.
- `source+=()` and `sha256sums` arrays must stay in the same order (LICENSE, bash, zsh, fish).
- AUR repo — changes are published via `git push` directly (no pull requests).

## Updating Shell Completions

After a `pkgver` bump or when completions are reported incorrect, update all three scripts (`qodercli.bash`, `qodercli.zsh`, `qodercli.fish`) consistently:

1. Discover new/changed/removed commands or flags via:
   - `qodercli --help` and each subcommand's `--help` (recursively for `mcp` sub-subcommands)
   - https://docs.qoder.com/cli/using-cli
2. Update all three scripts, following existing patterns in each file
3. Validate syntax: `bash -n qodercli.bash && zsh -n qodercli.zsh && fish -n qodercli.fish`

### CLI Structure

```
qodercli [flags]
qodercli <command> [flags]
```

Discover actual commands/subcommands/flags via `qodercli --help`, `qodercli <command> --help`, etc. Exclude the `completion` command from completion scripts (it doesn't work correctly).

### Flag Type Mapping

| Type | Bash | Zsh | Fish |
|------|------|-----|------|
| bool | `compgen -W` | `'[desc]'` | (no `-r`) |
| enum | `compgen -W "a b c"` | `:label:(a b c)` | `-r -a 'a b c'` |
| string | return (no completion) | `:label:` | `-r` |
| file | `compgen -f` | `:file:_files` | `-r -F` |
| dir | `compgen -d` | `:dir:_directories` | `-r -F` |
