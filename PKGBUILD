# Maintainer: YahyaZekry <YahyaZekry@users.noreply.github.com>
pkgname=rovyl-bin
_pkgname=rovyl
pkgver=1.17.0
pkgrel=1
pkgdesc="Rovyl radial launcher (prebuilt AppImage)"
arch=('x86_64')
url="https://github.com/YahyaZekry/rovyl-linux"
license=('GPL-3.0-or-later')
depends=('gtk3' 'libxss' 'libxtst' 'nss' 'alsa-lib' 'libxkbcommon' 'dbus')
optdepends=()
provides=('rovyl')
conflicts=('rovyl')
source=("rovyl-${pkgver}.AppImage::https://github.com/YahyaZekry/rovyl-linux/releases/download/v${pkgver}/Rovyl-${pkgver}-linux.AppImage")
sha256sums=('5ea2d5c5b8bbb60efe3041c7827523649253c8425f8cd7c75c2dc2df5bea6ef4')
noextract=("rovyl-${pkgver}.AppImage")

package() {
  cd "$srcdir"
  chmod +x "rovyl-${pkgver}.AppImage"
  "./rovyl-${pkgver}.AppImage" --appimage-extract

  install -dm755 "$pkgdir/opt/Rovyl"
  cp -a squashfs-root/. "$pkgdir/opt/Rovyl/"

  # icon
  install -Dm644 squashfs-root/rovyl.png \
    "$pkgdir/usr/share/pixmaps/rovyl.png"

  # desktop entry (rewritten to absolute paths)
  install -dm755 "$pkgdir/usr/share/applications"
  sed -e 's|^Exec=.*|Exec=rovyl %U|' \
      -e 's|^Icon=.*|Icon=rovyl|' \
      squashfs-root/rovyl.desktop \
      > "$pkgdir/usr/share/applications/rovyl.desktop"
  chmod 644 "$pkgdir/usr/share/applications/rovyl.desktop"

  # launcher wrapper (AppImage needs --no-sandbox without setuid chrome-sandbox)
  install -dm755 "$pkgdir/usr/bin"
  printf '#!/bin/sh\nexec /opt/Rovyl/rovyl --no-sandbox "$@"\n' \
    > "$pkgdir/usr/bin/rovyl"
  chmod 755 "$pkgdir/usr/bin/rovyl"
}
