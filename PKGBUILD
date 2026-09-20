# Maintainer: RKD <no-reply@rkd.chat>

# Tracks beta-release.yml tags (git.rkd.nanoya.biz/rkd/releases), e.g.
# v0.2.0-beta.14. No fixed "latest beta" URL exists (unlike the stable
# channel's /releases/latest tag pointer), so pkgver/_pkgver/_tag below are
# bumped by hand on every new beta and pushed to the AUR git repo — there is
# no CI auto-push yet (#433).
#
# Installs alongside rkd-bin under a distinct path (/opt/rkd-dev-bin) — real
# coexistence (#822): main.ts gives this channel its own Electron app name
# (own ~/.config data dir, so it can't clobber rkd-bin's settings/auth
# tokens) and its own .desktop identity (this file, installed as
# rkd-dev.desktop rather than the shared rkd.desktop rkd-bin uses — sharing
# that path was the actual reason these two used to `conflicts=`). The
# .deb's own auto-generated rkd.desktop is still baked from the shared
# `productName: RKD` in electron-builder.yml, so it's deleted below rather
# than left in place — otherwise it would collide with rkd-bin's own
# rkd.desktop the moment both packages are installed together.
#
# Window-switcher-level distinction (a WM_CLASS the OS window manager can
# tell apart, e.g. via StartupWMClass) is NOT included — Electron's actual
# WM_CLASS derivation from app.setName() wasn't verified live before this
# shipped, and a wrong guess here is worse than the field's absence (a
# missing StartupWMClass just falls back to heuristic matching, the same
# degraded-but-working state this package shipped with before #822).

pkgname=rkd-dev-bin
pkgver=0.2.0_beta.29
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
_pkgver=0.2.0-beta.29
_tag=v0.2.0-beta.29

source=("$pkgname-$pkgver.deb::https://git.rkd.nanoya.biz/rkd/releases/releases/download/${_tag}/RKD-electron-rkd_${_pkgver}_amd64.deb")
sha256sums=('cd58232eff81444bbc29b275ad4e28f760e25908e9f501f03395bd4d2d509ee7')
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

  # Installed as rkd-dev.desktop (#822) — matches main.ts's
  # app.setDesktopName("rkd-dev") for the beta-version-stamped build, which
  # is what Chromium's GetXdgAppId() reports for the notification
  # desktop-entry hint (#570); has to match the installed filename exactly
  # for OS notification history to resolve this app's identity. Delete the
  # .deb's own auto-generated rkd.desktop first — coexisting with rkd-bin
  # now means that path is rkd-bin's alone, and leaving this package's copy
  # in place too would collide the moment both are installed together (that
  # collision is exactly what `conflicts=` used to paper over).
  rm -f "$pkgdir/usr/share/applications/rkd.desktop"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/rkd-dev.desktop" <<EOF
[Desktop Entry]
Name=RKD (Dev)
Comment=RKD desktop client (beta/development channel)
Exec=/opt/$pkgname/rkd %U
Terminal=false
Type=Application
Icon=$pkgname
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
