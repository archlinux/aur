# Maintainer: Dustin W <dustin@wilhoitclan.com>
# Contributor: Serge K <arch@phnx47.net> PKGBUILD adapted from ledger-live-bin

_pkgbin=org.vechain.sync2
pkgname=vechain-sync2-bin
pkgdesc='Vechain Sync - Desktop'
license=('LGPL3')
url='https://github.com/vechain/sync2'
pkgver=2.0.6
pkgrel=1
arch=('x86_64')
_package="Sync2-linux-${arch}-${pkgver}.AppImage"
optdepends=('ledger-live: Ledger Hardware Wallet Support')
source=("${_package}::${url}/releases/download/v${pkgver}/${_package}")
sha512sums=('3e46637d0ac98adc7c9360362d177200d37a1cfa29fe247f4d4a161a77982315f0f8fd70112e083df267942448fe44e30e38e026eaf0f1779af04a295ea2fdb3')

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
