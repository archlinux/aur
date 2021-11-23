# Maintainer: Dustin W <dustin@wilhoitclan.com>
# Contributor: Serge K <arch@phnx47.net> PKGBUILD adapted from ledger-live-bin

_pkgbin=beyond-all-reason
pkgname=beyondallreason-bin
pkgdesc='Beyond All Reason'
license=('LGPL3')
url='https://github.com/beyond-all-reason/BYAR-Chobby'
pkgver=1.1252.0
pkgrel=1
arch=('x86_64')
_package="Beyond-All-Reason-${pkgver}.AppImage"
source=("${_package}::${url}/releases/download/v${pkgver}/${_package}")
sha512sums=('1ff048b04fb009dcbfa984f5dfd7e009fedf5284c41a9cdc8d9856bc4d1242f81a7f7a581a1d9b3b47b9655091ce61c2b2af522048e6e91ac3576f24754558eb')

build() {
  # Extract files
  chmod +x "$srcdir/$_package"
  $srcdir/$_package --appimage-extract

  # Correct .desktop
  sed -e "s/AppRun/${_pkgbin}/g" -i "$srcdir/squashfs-root/$_pkgbin.desktop"
}


package() {
  install -d "$pkgdir/opt/$_pkgbin"
  cp -a "$srcdir/squashfs-root/." "$pkgdir/opt/$_pkgbin/"
  chmod -R +rx "$pkgdir/opt/$_pkgbin"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgbin/$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"

  install -d "$pkgdir/usr/share"
  cp -r "$srcdir/squashfs-root/usr/share/." "${pkgdir}/usr/share/"

  find "$pkgdir" -type d -exec chmod 755 {} +

  install -Dm644 "$srcdir/squashfs-root/$_pkgbin.desktop" "$pkgdir/usr/share/applications/$_pkgbin.desktop"
}
