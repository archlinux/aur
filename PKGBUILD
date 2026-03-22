# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=cashonize-appimage
pkgver=0.7.2
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
sha512sums=('cbeb1a8a4c4a0c8bb9a4c999f0a950971880e208ac22880678dca21b90c5521b31e6a82f27530463c6ab895aef6e5ccaaa3e6ebc74382ec688c1efe5a96f378f')

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
