# AUR Publishing Guide

## Prerequisites

1. Create an AUR account at https://aur.archlinux.org/register/
2. Add your SSH public key to your AUR account
3. Install required tools:
   ```bash
   sudo pacman -S base-devel git
   ```

## First Time Setup

1. Clone the AUR repository:
   ```bash
   git clone ssh://aur@aur.archlinux.org/timesup.git timesup-aur
   cd timesup-aur
   ```

2. Copy the PKGBUILD:
   ```bash
   cp ../PKGBUILD .
   ```

3. Generate the `.SRCINFO`:
   ```bash
   makepkg --printsrcinfo > .SRCINFO
   ```

4. Update the `sha256sums` in PKGBUILD:
   ```bash
   # After creating a GitHub release tag v0.1.0
   updpkgsums
   ```

## Publishing to AUR

1. Commit and push:
   ```bash
   git add PKGBUILD .SRCINFO
   git commit -m "Initial release: v0.1.0"
   git push
   ```

## Updating the Package

1. Update `pkgver` in PKGBUILD
2. Regenerate checksums:
   ```bash
   updpkgsums
   makepkg --printsrcinfo > .SRCINFO
   ```
3. Commit and push:
   ```bash
   git add PKGBUILD .SRCINFO
   git commit -m "Update to v0.2.0"
   git push
   ```

## Testing Locally

Before publishing, test the build:
```bash
makepkg -si
```

This will build and install the package locally.

## Notes

- You MUST create a GitHub release with a tag (e.g., `v0.1.0`) before publishing
- The tag version must match `pkgver` in PKGBUILD
- Update `sha256sums` after creating the release using `updpkgsums`
- The `.SRCINFO` file is auto-generated, never edit it manually
