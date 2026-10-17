# Maintainer: Simon Weiss <wonder [at] simonweiss [dot] space>

pkgname=fontra-pak-bin
pkgver=2026.10.0
pkgrel=1
# Tag 2026.10.0 does not contain icon/FontraIcon.svg, so this commit supplies it.
# On each pkgver bump, check the new tag. If it contains the icon, use $pkgver
# as the ref. Then remove _iconcommit.
_iconcommit=14c2a5fa6a8f397d4dd06643a4cb7ab0385f3600
pkgdesc="Cross-platform bundled Fontra server and font editor for local desktop use (prebuilt binary)"
arch=('x86_64')
url="https://github.com/fontra/fontra-pak"
license=('GPL-3.0-only')
# The release tarball holds one PyInstaller onefile binary. Its bundle contains
# Python, Qt6, glib, libX11, libstdc++, libgcc_s, fontconfig and freetype.
# This list holds the host libraries that the bundled files link to
# (readelf NEEDED, minus the bundle).
depends=(
  'glibc'
  'hicolor-icon-theme'
  'libdrm'
  'libglvnd'
  'libxcb'
  'libxkbcommon-x11'
  'wayland'
  'xcb-util'
  'xcb-util-cursor'
  'xcb-util-image'
  'xcb-util-keysyms'
  'xcb-util-renderutil'
  'xcb-util-wm'
  'zlib'
)
optdepends=(
  'xdg-utils: open the font editor in the default web browser'
)
provides=("fontra-pak=$pkgver")
conflicts=('fontra-pak')
# The makepkg strip step damages the archive that PyInstaller appends to the binary.
# Without '!debug', makepkg still scans the binary for debug source files.
options=('!strip' '!debug')
source=(
  "$pkgname-$pkgver.tgz::$url/releases/download/$pkgver/FontraPak-Ubuntu.tgz"
  "FontraIcon-$_iconcommit.svg::$url/raw/$_iconcommit/icon/FontraIcon.svg"
  'fontrapak.desktop'
)
sha256sums=('fcebe80d372d1457052f975261f59887b161bb2ada547e88f613941323eac961'
            '29e4375cb3ae4bf1ef62312089081c97e29633f41c076814c9116aa1577b646d'
            'e4233a22a37cde64be1bc9b3639806e6cbb7bfc43857ea3e213761c05065b066')

package() {
  install -Dm755 fontrapak -t "$pkgdir/usr/bin/"

  # The desktop file ID and the icon name match the Qt app_id and WM_CLASS
  # "fontrapak". This also prevents a conflict with the Flatpak ID.
  install -Dm644 fontrapak.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 "FontraIcon-$_iconcommit.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/fontrapak.svg"
}
