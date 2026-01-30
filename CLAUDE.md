# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an AUR (Arch User Repository) package for `data-peek-bin` - a minimal, fast SQL client desktop application for developers. The package repackages the upstream `.deb` release for Arch Linux.

- **Upstream**: https://github.com/Rohithgilla12/data-peek
- **Website**: https://www.datapeek.dev

## Build Commands

```bash
# Build the package
makepkg -s

# Build and install
makepkg -si

# Update checksums after changing source URL
updpkgsums

# Generate/update .SRCINFO (required before pushing to AUR)
makepkg --printsrcinfo > .SRCINFO
```

## Updating the Package

1. Update `pkgver` in PKGBUILD to match new upstream version
2. Update sha256sum from GitHub releases page (shown next to each asset)
3. Run `makepkg --printsrcinfo > .SRCINFO`
4. Test with `makepkg -si`
