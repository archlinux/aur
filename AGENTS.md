# AGENTS.md

This file provides guidance to Qoder (qoder.com) when working with code in this repository.

## Overview

AUR (Arch User Repository) package for `qodercli-bin`, packaging the pre-built Qoder CLI binary for Arch Linux. Supports `x86_64` and `aarch64` architectures.

## Key Files

- `PKGBUILD` — Arch package build recipe. Downloads pre-built binaries from `download.qoder.com` and installs them to `/usr/bin/qodercli`.
- `.SRCINFO` — Auto-generated metadata from PKGBUILD. **Never edit manually.**
- `LICENSE` — Local HTML copy of the Qoder Product Service license (fetched from `https://qoder.com/product-service` by `update.sh`). This is a committed local file, not downloaded during `makepkg`.
- `update.sh` — Automation script that checks for new upstream releases and license changes, then updates PKGBUILD/SRCINFO accordingly. Requires: `curl`, `jq`, `sed`, `sha256sum`, `makepkg`, `cmp`.
- `qodercli.bash`, `qodercli.zsh`, `qodercli.fish` — Shell completion scripts installed by the package. Maintained manually; must be updated when upstream adds/changes CLI commands or flags.

## Commands

### Update to latest upstream version

When user says "检查升级", "check update", or wants to update the package:

1. **Check for updates**
   ```bash
   ./update.sh
   git diff
   ```

2. **Check completions**
   ```bash
   qodercli --help
   qodercli <subcommand> --help
   ```
   Compare with completion scripts. Update if CLI changed.

3. **Validate** (before commit)
   ```bash
   bash -n qodercli.bash && zsh -n qodercli.zsh && fish -n qodercli.fish
   namcap PKGBUILD
   makepkg -si  # optional: local test build
   ```

4. **Commit** (only after validation passed)
   Use conventional commits format, e.g.:
   - `chore(aur): bump pkgrel=N, update LICENSE checksum`
   - `chore(aur): upgrade to vX.Y.Z`

5. **Push** (only when user explicitly requests)
   ```bash
   git push
   ```

### Other Commands

```bash
makepkg --printsrcinfo > .SRCINFO  # Regenerate after manual PKGBUILD edits
makepkg -si                        # Test-build locally
namcap PKGBUILD                    # Validate PKGBUILD
```

## Workflow Notes

- When `pkgver` changes, `pkgrel` resets to `1`.
- When only the LICENSE changes (no version bump), `pkgrel` is incremented.
- `.SRCINFO` must always be regenerated and committed alongside any PKGBUILD change.
- Checksums (`sha256sums_x86_64`, `sha256sums_aarch64`, `sha256sums`) must match the actual source files. Use `update.sh` or `updpkgsums` to recalculate.
- After a version bump, check if new CLI commands/flags were added and update the shell completion scripts accordingly.
- This package conflicts with `qoder-cli` (a hypothetical source-built variant). The binary is installed as `/usr/bin/qodercli`.
- **AUR repositories must not contain subdirectories.** All files must be at the repo root.

- `update.sh` relies on line-oriented `sed` — do not reformat PKGBUILD fields (`pkgver=`, `sha256sums=()` block, etc.) or the script will silently break.
- `source+=()` and `sha256sums` arrays must stay in the same order (LICENSE, bash, zsh, fish).
- AUR repo — changes are published via `git push` directly (no pull requests).

## Updating Shell Completions

After a `pkgver` bump or when completions are reported incorrect, update all three scripts (`qodercli.bash`, `qodercli.zsh`, `qodercli.fish`) consistently:

1. Run `qodercli --help` and each subcommand's `--help` (recursively for `mcp` sub-subcommands) to discover new/changed/removed commands or flags
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
