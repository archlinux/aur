# CLAUDE.md

## Repository Overview

This is an Arch Linux AUR package for Inkdrop, a note-taking app with a robust Markdown editor.
The package downloads the precompiled Linux zip from Inkdrop's distribution host and installs it with the desktop entry, icon, and AppStream metainfo that ship inside the zip.

## Inkdrop-Specific Files

- `checksum.sh`: Prints the sha512 checksum of the x86_64 and aarch64 zips for a release (requires `curl` and `jq`)

## Package Maintenance

```bash
# Print checksums for a version (replace X.Y.Z with version)
./checksum.sh X.Y.Z
# x86_64: <sha512>   → sha512sums_x86_64
# aarch64: <sha512>  → sha512sums_aarch64

# Generate .SRCINFO after PKGBUILD changes
makepkg --printsrcinfo > .SRCINFO
```

`checksum.sh` reads checksums from the release API when the version is the latest release.
For any other version it downloads both zips (~140 MB each) and hashes them locally,
because the API only describes the latest release.

### Version Discovery

The latest version is published by Inkdrop's release API:

```bash
curl -s https://api.inkdrop.app/download/latest | jq -r .version
```

Release notes are announced at https://forum.inkdrop.app/c/announcements/14.

Do not probe versions by guessing URLs.
Missing files on the distribution host return 403 rather than 404,
and the pre-v6 CDN (`d3ip0rje8grhnl.cloudfront.net`) stopped receiving releases after 5.11.10.

## Architecture

This is a binary package that:
1. Downloads the precompiled Inkdrop Linux zip from `https://dist.inkdrop.app/releases/inkdrop-X.Y.Z-{x64,arm64}-linux.zip`
2. Installs the application files to `/usr/lib/inkdrop/`
3. Creates a symlink at `/usr/bin/inkdrop` for command-line access
4. Installs the bundled `app.inkdrop.Inkdrop` desktop entry, 256x256 hicolor icon, and metainfo

The package supports x86_64 and aarch64 and depends on typical Electron app dependencies (gtk3, libsecret, gnome-keyring, etc.).
Since v6 the app is packaged as `resources/app.asar`, and the standalone `ipm` CLI is no longer shipped.
