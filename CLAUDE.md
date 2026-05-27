# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

AUR package for `codexbar-cli` — a prebuilt binary CLI (AI coding provider usage tracker). Upstream: https://github.com/steipete/CodexBar. No source compilation; the PKGBUILD fetches arch-specific tarballs and installs the binary.

## Key files

- `PKGBUILD` — package definition; edit this to bump versions or change deps
- `.SRCINFO` — generated from PKGBUILD; never edit manually

## Common commands

```bash
# Build the package locally
makepkg -si

# Regenerate .SRCINFO after editing PKGBUILD
makepkg --printsrcinfo > .SRCINFO

# Verify checksums match
makepkg -g    # prints updated sha256sums for source arrays

# Push update to AUR (requires AUR SSH remote configured)
git add PKGBUILD .SRCINFO
git commit -m "upgpkg: codexbar-cli <version>"
git push
```

## Upgrade workflow

1. Update `pkgver` and `pkgrel` in `PKGBUILD`
2. Run `makepkg -g` to get new `sha256sums` / `sha256sums_x86_64` / `sha256sums_aarch64`
3. Replace the checksum arrays in `PKGBUILD`
4. Run `makepkg --printsrcinfo > .SRCINFO`
5. Test with `makepkg -si`
6. Commit and push to AUR

## PKGBUILD notes

- Binary no longer links `libxml2` (dropped upstream in v0.28.0); `patchelf` and `libxml2` dependency removed
- `VERSION` file from tarball is installed to `/usr/share/codexbar-cli/VERSION`
- Binary installs to `/usr/bin/codexbar` (provides/conflicts with `codexbar` package)
- Supports `x86_64` and `aarch64` via separate `source_*` / `sha256sums_*` arrays
