# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is an Arch Linux AUR (Arch User Repository) package for kubelogin, a kubectl plugin for Kubernetes OpenID Connect authentication. The package downloads precompiled binaries from the upstream project at https://github.com/int128/kubelogin/.

## Key Files

- `PKGBUILD`: Main package build script defining package metadata, dependencies, sources, and installation steps
- `.SRCINFO`: Generated metadata file for AUR (auto-generated from PKGBUILD)
- `checksum.sh`: Utility script to fetch SHA256 checksums for new releases

## Common Commands

### Building and Testing
```bash
# Build the package
makepkg -si

# Build without installing
makepkg

# Clean build (removes src/ and pkg/ directories first)
makepkg -C

# Generate new checksums for PKGBUILD
makepkg -g

# Validate package with namcap
namcap PKGBUILD
namcap *.pkg.tar.zst
```

### Package Maintenance
```bash
# Update checksums for new version (replace X.Y.Z with version)
./checksum.sh X.Y.Z

# Generate .SRCINFO after PKGBUILD changes
makepkg --printsrcinfo > .SRCINFO
```

## Architecture

This is a binary package that:
1. Downloads precompiled kubelogin binaries for x86_64 and aarch64 from GitHub releases
2. Installs the binary to `/usr/bin/kubelogin` 
3. Creates a symlink at `/usr/bin/kubectl-oidc_login` for kubectl plugin compatibility

The package supports both x86_64 and aarch64 architectures with separate source URLs and checksums for each.

## Version Updates

When updating to a new kubelogin version:
1. Update `pkgver` in PKGBUILD
2. Reset `pkgrel` to 1
3. Run `./checksum.sh <new_version>` to get new SHA256 sums
4. Update `sha256sums_x86_64` and `sha256sums_aarch64` in PKGBUILD
5. Regenerate .SRCINFO with `makepkg --printsrcinfo > .SRCINFO`
6. Test build with `makepkg -si`
7. Validate with `namcap`