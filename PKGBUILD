# Maintainer: Dustin W <dustin@wilhoitclan.com>
# Contributor: Serge K <arch@phnx47.net> PKGBUILD adapted from ledger-live-bin

_pkgbin=org.vechain.sync
pkgname=vechain-sync-bin
pkgdesc='Vechain Sync - Desktop'
license=('LGPL3')
url='https://github.com/vechain/thor-sync.electron'
pkgver=1.3.0
pkgrel=1
arch=('x86_64')
_package="Sync-linux-${arch}-${pkgver}.AppImage"
optdepends=('ledger-live: Ledger Hardware Wallet Support',
         'ledger-live-bin: Ledger Hardware Wallet Support (Binary Install)')
source=("${_package}::${url}/releases/download/v${pkgver}/${_package}")
sha512sums=('c27a838413cb39761ec4e2ca6aa9e6bc2b72ab214df58b46fb252a0bc53f58617dcca3d309c5ddb45bc033858e3b1583505a2ee8320e72605867bf9f520ffd82')

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