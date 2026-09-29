# Maintainer: RKD <no-reply@rkd.chat>

# Tracks stable release.yml tags (git.rkd.nanoya.biz/rkd/releases), e.g.
# v0.2.0. Bumped automatically by aur-sync.yml's check-rkd-bin/sync-rkd-bin
# jobs once a stable (non-draft, non-prerelease) release is published — same
# polling pattern already used for rkd-dev-bin, see that workflow's header
# comment for why polling instead of chaining on release.yml's own publish
# job (#477 review round 3: a chained job would race a still-draft release).
#
# Placeholder values below (pkgver=0.0.0, _tag=v0.0.0-unreleased) until the
# first real stable tag exists — no v0.0.0 release will ever be published,
# so aur-sync.yml's "already tracks this tag" short-circuit can't falsely
# skip the first real bump (#485). This package has not been bootstrap-
# pushed to the AUR yet; that happens by hand once, at the same time as the
# first stable (0.2.0) release cut.
#
# Installs alongside rkd-dev-bin under a distinct path (/opt/rkd-bin) — real
# coexistence (#822): this is the channel that keeps the original app
# identity unchanged (Electron app name "RKD", .desktop filename rkd.desktop)
# so existing installs/data aren't disrupted; rkd-dev-bin moved to its own
# name and rkd-dev.desktop instead of sharing this one. See that PKGBUILD's
# header comment for the coexistence rationale in full.

pkgname=rkd-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="RKD desktop client"
arch=(x86_64)
url="https://git.rkd.nanoya.biz/rkd/releases"
license=(LicenseRef-custom)
# Prebuilt vendor binaries (chrome-sandbox, libvulkan.so.1, ...) — stripping
# or gdb-add-index'ing them corrupts the setuid helper and wastes time on
# blobs that were never built with debug info to begin with.
options=(!strip !debug)
provides=(rkd)
depends=(
  alsa-lib
  at-spi2-core
  gtk3
  nss
  # Not linked directly by the rkd/Electron binary (namcap flags these as
  # "may not be needed") — Electron dlopen()s them at runtime instead:
  # libnotify (native notifications), libsecret (keytar-style credential
  # storage), libxss (idle/screensaver detection), libxtst (synthetic input
  # for global shortcuts), util-linux-libs (libuuid, used by Chromium's
  # base/), xdg-utils (xdg-open subprocess for external links).
  libnotify
  libsecret
  libxss
  libxtst
  util-linux-libs
  xdg-utils
)
optdepends=('libayatana-appindicator: tray icon support')

# _pkgver: raw semver as it appears in the .deb filename.
# _tag: the Forgejo release tag the asset was uploaded under.
_pkgver=0.3.0
_tag=v0.3.0

source=("$pkgname-$pkgver.deb::https://git.rkd.nanoya.biz/rkd/releases/releases/download/${_tag}/RKD-electron-rkd_${_pkgver}_amd64.deb")
sha256sums=('07b0bf854da65368424debc9aeaea21032252c7a7ab1ae2d6db60be0b4b288a9')
noextract=("$pkgname-$pkgver.deb")
# Tells whoever removes the package how to remove the rkd-activity user
# service the app may have installed (#1145); root can't reach user units.
install=$pkgname.install

package() {
  bsdtar -xf "$pkgname-$pkgver.deb" -C "$srcdir"
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

  mv "$pkgdir/opt/RKD" "$pkgdir/opt/$pkgname"

  # chrome-sandbox needs the setuid bit to sandbox renderers without
  # CAP_SYS_ADMIN/unprivileged userns; fakeroot preserves this bit into the
  # package archive and pacman applies it for real on install (as root).
  chmod 4755 "$pkgdir/opt/$pkgname/chrome-sandbox"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/rkd" "$pkgdir/usr/bin/$pkgname"

  # Installed as rkd.desktop, matching main.ts's app.setDesktopName("rkd.desktop")
  # for the stable (non-beta-stamped) build — that's what Chromium's
  # GetXdgAppId() reports for the notification desktop-entry hint, and it
  # has to match the installed filename exactly for OS notification history
  # to resolve this app's identity (#570). rkd-dev-bin installs its own
  # rkd-dev.desktop instead (#822), so this filename is this package's
  # alone now, not shared. Overwrites the .deb's own auto-generated
  # rkd.desktop outright (install -Dm644 doesn't need it removed first) —
  # that one's Exec= points at /opt/RKD, wrong for this renamed
  # /opt/$pkgname install.
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/rkd.desktop" <<EOF
[Desktop Entry]
Name=RKD
Comment=RKD desktop client
Exec=/opt/$pkgname/rkd %U
Terminal=false
Type=Application
Icon=$pkgname
StartupWMClass=Rkd
Categories=Network;
# rkd-terminal pair's link (#1185); per channel, so the two never share it.
MimeType=x-scheme-handler/rkd;
EOF

  mv "$pkgdir/usr/share/icons/hicolor/512x512/apps/rkd.png" \
     "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  install -Dm644 "$pkgdir/opt/$pkgname/LICENSE.electron.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
  install -Dm644 "$pkgdir/opt/$pkgname/LICENSES.chromium.html" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"

  rm -rf "$pkgdir/usr/share/doc/rkd"
}
