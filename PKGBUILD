# Maintainer: Dustin W <dustin@wilhoitclan.com>
# Contributor: Serge K <arch@phnx47.net> PKGBUILD adapted from ledger-live-bin

_pkgbin=beyond-all-reason
pkgname=beyondallreason-bin
pkgdesc='Beyond All Reason'
license=('LGPL3')
url='https://github.com/beyond-all-reason/BYAR-Chobby'
pkgver=1.1299.0
pkgrel=1
arch=('x86_64')
_package="Beyond-All-Reason-${pkgver}.AppImage"
source=("${_package}::${url}/releases/download/v${pkgver}/${_package}")
sha512sums=('a63059e21b74240b341d17b82afe0529b9b8f70b8460250647915083def4c598ec26196747f6cd1ada6b1b854991c56aac0229e0bb81d4e597c82fa295b9af0c')

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
