# Maintainer: Dustin W <dustin@wilhoitclan.com>
# Contributor: Serge K <arch@phnx47.net> PKGBUILD adapted from ledger-live-bin

_pkgbin=org.vechain.sync
pkgname=vechain-sync-bin
pkgdesc='Vechain Sync - Desktop'
license=('LGPL3')
url='https://github.com/vechain/thor-sync.electron'
pkgver=1.3.2
pkgrel=1
arch=('x86_64')
_package="Sync-linux-${arch}-${pkgver}.AppImage"
optdepends=('ledger-live: Ledger Hardware Wallet Support')
source=("${_package}::${url}/releases/download/v${pkgver}/${_package}")
sha512sums=('99ab4ed531503e75f35a79941fa3112b24ec194a55a0ceee9be78c9e4d476ef3dd46dfbdd1ca582c157ac392bf60a16c5d5df08cc7e1a244667fd11846d0b132')

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
