# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=cashonize-appimage
pkgver=0.7.1
pkgrel=1
pkgdesc="A Bitcoin Cash (BCH) Wallet which supports CashTokens, WalletConnect and CashConnect."
provides=('cashonize')
conflicts=('cashonize')
arch=('x86_64')
depends=('fuse2')
url="https://cashonize.com/"
options=(!strip)
_desktop_name=cashonize-wallet.desktop
_filename=Cashonize-${pkgver}.AppImage
source=(
  https://github.com/cashonize/cashonize-wallet/releases/download/v${pkgver}/${_filename}
)
sha512sums=('d8d844f47a256b51e74919f59f07fe56c0cdcf3592f9c3407c04c7153d363e067574d435dd3dd588fecd2277b0bda3f6553f9f9a71ad35166c6c58037dbaad89')

prepare() {
  cd "${srcdir}"
  rm -rf squashfs-root
  chmod +x ${_filename}
  ./${_filename} --appimage-extract
  sed -i -e "s|Exec=.\+|Exec=env APPIMAGELAUNCHER_DISABLE=1 DESKTOPINTEGRATION=0 /usr/bin/Cashonize.AppImage --no-sandbox|" squashfs-root/${_desktop_name}
}

package() {
  echo "Starting install"
  install -Dm755 ${_filename} "${pkgdir}"/usr/bin/Cashonize.AppImage
  echo "Installing desktop launcher"
  install -Dm755 squashfs-root/${_desktop_name} "${pkgdir}"/usr/share/applications/${_desktop_name}
  echo "Installing icon"
  install -Dm644 squashfs-root/cashonize-wallet.png ${pkgdir}/usr/share/pixmaps/cashonize-wallet.png
}
