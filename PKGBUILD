# Maintainer: RKD <rkd@users.noreply.github.com>

# Tracks beta-release.yml tags (git.rkd.nanoya.biz/rkd/releases), e.g.
# v0.2.0-beta.14. No fixed "latest beta" URL exists (unlike the stable
# channel's /releases/latest tag pointer), so pkgver/_pkgver/_tag below are
# bumped by hand on every new beta and pushed to the AUR git repo — there is
# no CI auto-push yet (#433).
#
# Installs alongside rkd-bin under a distinct path (/opt/rkd-dev-bin) so both
# can coexist. The Electron build's WM class/binary internals still say
# "RKD" (baked in at build time by productName), so windows from rkd-bin and
# rkd-dev-bin won't be visually distinguishable beyond the launcher name/icon
# — acceptable for a beta-tracking package.

pkgname=rkd-dev-bin
pkgver=0.2.0_beta.17
pkgrel=1
pkgdesc="RKD desktop client (beta/development channel)"
arch=(x86_64)
url="https://git.rkd.nanoya.biz/rkd/releases"
license=(LicenseRef-custom)
# Prebuilt vendor binaries (chrome-sandbox, libvulkan.so.1, ...) — stripping
# or gdb-add-index'ing them corrupts the setuid helper and wastes time on
# blobs that were never built with debug info to begin with.
options=(!strip !debug)
provides=(rkd)
conflicts=(rkd rkd-bin)
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

# _pkgver: raw semver as it appears in the .deb filename (electron-builder
# uses the hyphenated form there even though the .deb's own control file
# reports a tilde per Debian pre-release convention).
# _tag: the Forgejo release tag the asset was uploaded under.
_pkgver=0.2.0-beta.17
_tag=v0.2.0-beta.17

source=("$pkgname-$pkgver.deb::https://git.rkd.nanoya.biz/rkd/releases/releases/download/${_tag}/RKD-electron-rkd_${_pkgver}_amd64.deb")
sha256sums=('119388cbe4e7a5b9dc86b3319b2d9ef0e22b29754d09de98ed447ae0ba5ef02e')
noextract=("$pkgname-$pkgver.deb")

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

  rm -f "$pkgdir/usr/share/applications/rkd.desktop"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=RKD (Dev)
Comment=RKD desktop client (beta/development channel)
Exec=/opt/$pkgname/rkd %U
Terminal=false
Type=Application
Icon=$pkgname
StartupWMClass=RKD
Categories=Network;
EOF

  mv "$pkgdir/usr/share/icons/hicolor/512x512/apps/rkd.png" \
     "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  install -Dm644 "$pkgdir/opt/$pkgname/LICENSE.electron.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
  install -Dm644 "$pkgdir/opt/$pkgname/LICENSES.chromium.html" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"

  rm -rf "$pkgdir/usr/share/doc/rkd"
}
