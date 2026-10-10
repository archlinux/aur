# CLAUDE.md

## Repository Overview

This is the AUR package for [botropolis](https://github.com/Botropolis-City/botropolis), which draws every Claude Code session on the machine as a city.
It builds from the tagged source tarball, so it tracks releases rather than `main`.

Upstream publishes `.deb`, `.rpm` and Arch packages on each release, built by CI.
This package exists so `botropolis` is installable the way an Arch user expects, and so it builds for `aarch64`, which the released binaries do not cover.

## Package-Specific Files

- `checksum.sh`: prints the sha256 of a release's source tarball
- `botropolis.install`: the post-install hint, because three things have to be switched on that a package cannot switch on for you

## Package Maintenance

```bash
# Checksum for a new version (replace X.Y.Z)
./checksum.sh X.Y.Z

# Then bump pkgver, reset pkgrel to 1, and regenerate
makepkg --printsrcinfo > .SRCINFO

# Build and check before committing
makepkg -f
namcap PKGBUILD botropolis-*.pkg.tar.zst
```

`.SRCINFO` must be regenerated and committed with every `PKGBUILD` change, or the AUR will serve stale metadata.

## Identity

**This repository commits as `Aria Vesta <dev@ariavesta.com>` with SSH signing, set repo-locally.**
The global git identity is a work one, and the other AUR packages in `~/workspaces/aur` use it.
Botropolis is personal, upstream is signed the same way, and a personal package should not carry an employer's domain.
The five `git config` lines are `user.name`, `user.email`, `user.signingkey`, `gpg.format=ssh` and `commit.gpgsign`, plus `gpg.ssh.allowedsignersfile`.

## Architecture

A source package:

1. Downloads the release source tarball from GitHub and verifies its sha256
2. Builds the three binaries with `-buildmode=pie -trimpath`, stamping `pkgver` into `pkg/version.Version` so `botropolis --version` matches the package
3. Runs the unit tests in `check()` — **not** the integration or acceptance suites, which generate a fixture from the building user's own `~/.claude` and must never run in a package build
4. Installs the binaries, both systemd user units, the desktop entry, the icon, the shell integration, the docs, and the licences for the artwork and typeface compiled into the binaries

The runtime dependencies are the X11, GL and ALSA libraries the renderer needs.
Arch ships headers in the same packages, so they are build dependencies too and `go` is the only makedepend.
