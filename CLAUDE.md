# CLAUDE.md

## Repository Overview

This is the AUR package for the [Kei CLI](https://haikeilabs.com) from Haikei Labs, built from the **released binaries**.
It replaces upstream's `curl https://haikeilabs.com/install.sh | sh` installer with something pacman owns.

It installs two programs from one upstream archive: `kei` and `kei-proxy`.
They are versioned separately upstream (kei 0.5.2 shipped kei-proxy 0.9.1), and `pkgver` follows `kei`.

## Package-Specific Files

- `checksum.sh`: prints both architectures' checksums, read from the release's own checksums file; with no argument it resolves upstream's `latest.txt`
- `kei-cli-bin.install`: the post-install and post-upgrade hints, covering the two things the upstream installer did that a package cannot

## Package Maintenance

```bash
# Checksums for a new version (omit the version for upstream's latest)
./checksum.sh X.Y.Z

# Then bump pkgver, reset pkgrel to 1, and regenerate
makepkg --printsrcinfo > .SRCINFO

# Build and check before committing
makepkg -f
namcap PKGBUILD kei-cli-bin-*.pkg.tar.zst
```

`.SRCINFO` must be regenerated and committed with every `PKGBUILD` change, or the AUR will serve stale metadata.

**Both architectures must be bumped together.**
`makepkg` on an x86_64 machine never touches `sha256sums_aarch64`, so a wrong aarch64 checksum is invisible here and fails only for the person on that machine.

## Architecture

A binary package.
It downloads the release tarball for the building machine's architecture from upstream's public S3 bucket, verifies its sha256, and installs the two binaries, the README, and the licence.
Both binaries are static Go builds with no `NEEDED` entries, so there is no `depends` array.

Releases live at `https://kei-cli-releases.s3.us-east-1.amazonaws.com/kei-cli/<version>/`, not on GitHub.
`latest.txt` beside the version directories names the current release.

### What the upstream installer does that this package does not

- **Restarting the runtime service.**
  `install.sh` runs `systemctl --user restart kei` when `~/.config/systemd/user/kei.service` exists.
  A pacman scriptlet runs as root and has no business in a user's session, so `post_upgrade` prints the command instead.
- **The `.kei-install-manifest` file.**
  It exists so `install.sh --uninstall` knows what to remove.
  pacman tracks the files, so it is not written.
- **The `~/.local/bin` fallback and `--proxy-only` mode.**
  Neither means anything for a system package.

### `kei upgrade`

The binary can replace itself and `kei-proxy` in place.
Under this package it fails for an ordinary user, because `/usr/bin` is not writable, and that is the wanted outcome.
Run as root it would succeed and leave pacman's database describing files it no longer installed.
`post_install` says not to use it.

### Conflicts

`conflicts` names `kei`, which is an unrelated AUR package (a photo sync tool) that also installs `/usr/bin/kei`.
Without the entry the two would fail at install time on a file conflict instead of being reported up front.

### Signature verification

Upstream signs each release's checksums file (`kei-cli_<version>_checksums.txt.sig`) with the `kei-cli-releases@haikeilabs.com` key, fingerprint `BA6DF1D58BA30A692EABFA6F12604CCEDB8C42AF`.
The package does not check it.
The PKGBUILD pins the tarball's sha256 directly, which protects the download; the signature would only add assurance at bump time, when the sums are copied in.
Wiring it into `source` with `validpgpkeys` would make every user import the key before `makepkg` works, and upstream's own installer treats the check as optional.

### namcap

The PIE and RELRO warnings are properties of upstream's build and not fixable here.
`options=('!strip' '!debug')`: the binaries arrive already stripped, and a debug package would have no source to pair with.
