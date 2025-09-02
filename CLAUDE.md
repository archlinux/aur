# CLAUDE.md

## Repository Overview

This is an Arch Linux AUR (Arch User Repository) package for kubelogin, a kubectl plugin for Kubernetes OpenID Connect authentication. The package downloads precompiled binaries from the upstream project at https://github.com/int128/kubelogin/.

## Package-Specific Files

- `checksum.sh`: Utility script to fetch SHA256 checksums for new releases

## Package Maintenance
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
