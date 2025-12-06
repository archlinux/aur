# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=cashonize-appimage
pkgver=0.5.7
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
sha512sums=('5d685f521f465eb66db8c58eed9470e720302fd1ac66a1a51a1e3425922b3fecd70969769c6aa681389755df113876d8ec05da5340b7c207b23cbbaf91740cb3')

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
