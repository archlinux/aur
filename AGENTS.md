# AGENTS.md

AUR `-bin` package for xdg-desktop-portal-gtk4, prebuilt from upstream `master`.
The Print portal fixes that used to live in `print-single-call.patch` are
upstream since commit `3461d7e`, so the recipe builds the upstream tree as is.
The package installs a prebuilt binary and does not compile anything.

## Files

- `PKGBUILD` — `-bin` recipe; downloads the GitLab release asset.
- `.SRCINFO` — generated from the PKGBUILD; never edit it by hand.
- `README.md` — rebuild instructions; keep it in English.
- Ignored: `src/`, `pkg/`, `*.pkg.tar.zst`, `*.tar.gz`, `*.log`.

## Checks

After any `PKGBUILD` change:

```sh
makepkg --printsrcinfo > .SRCINFO
makepkg -f
```

`makepkg` downloads the release asset and verifies `sha256sums`. Inspect the
payload with `pacman -Qlp` or `bsdtar -tf`. Never ship a package whose
checksum does not match the asset.

## Version bumps and release asset

The binary is built outside this repository:

1. Download the upstream snapshot (tag or master commit), then
   `cargo build --release --locked`.
2. Stage the binary, `gtk4.portal`, the D-Bus service, the systemd user unit,
   the desktop file and `LICENSE`; create the tarball.
3. Create a GitLab release for the new `pkgver` and attach the tarball as an
   asset.
4. Update `pkgver`, `source` and `sha256sums`, regenerate `.SRCINFO`, then
   `makepkg -f`.
5. If upstream ships a release with the Print fix, prefer it as the source and
   consider dropping this package.

The release asset URL lives under
`https://gitlab.com/nisby/xdg-desktop-portal-gtk4-printfix-bin/-/releases/`.

## Publishing

```sh
git push origin master   # GitLab mirror
git push aur master      # AUR
```

AUR may print “.SRCINFO unchanged” when only extra files (README, patch)
change; that is normal. The package database is only updated when `.SRCINFO`
changes.

## Gotchas

- A `-bin` package with a locally built binary is not strictly AUR-compliant
  and can be removed; the rebuild notes keep it traceable.
- `provides`/`conflicts` cover `xdg-desktop-portal-gtk4`, `-git` and the old
  `-printfix` source package.
- `PKGBUILD.bak` in this directory is a local backup: leave it untracked.
- Comments, strings and docs are in English.
