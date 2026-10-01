# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=stack-wallet-appimage
pkgver=2.7.1
pkgrel=1
pkgdesc="Stack Wallet is a fully open source cryptocurrency wallet."
provides=('stack-wallet')
conflicts=('stack-wallet')
arch=('x86_64')
depends=('fuse2')
url="https://stackwallet.com/"
options=(!strip)
_desktop_name=stackwallet.desktop
_filename=sw-v${pkgver}-linux.AppImage
_build=316
source=(
  https://github.com/cypherstack/stack_wallet/releases/download/build_${_build}/${_filename}
)
sha512sums=('1b86ef1a9d7dd4a8f0860bea9aaf8628840495be70da5ef4c2aca65d27b73be78d25d3b0b8fc3064ec5966457e516f9e9594db3b632ee57ec7fe52c7ea73ca5e')

prepare() {
  cd "${srcdir}"
  rm -rf squashfs-root
  chmod +x ${_filename}
  ./${_filename} --appimage-extract
  sed -i -e "s|Exec=.\+|Exec=env APPIMAGELAUNCHER_DISABLE=1 DESKTOPINTEGRATION=0 /usr/bin/StackWallet.AppImage|" squashfs-root/${_desktop_name}
  echo "StartupWMClass=com.cypherstack.stackwallet" >> squashfs-root/${_desktop_name}
}

package() {
  echo "Starting install"
  install -Dm755 ${_filename} "${pkgdir}"/usr/bin/StackWallet.AppImage
  echo "Installing desktop launcher"
  install -Dm755 squashfs-root/${_desktop_name} "${pkgdir}"/usr/share/applications/${_desktop_name}
  echo "Installing icon"
  install -Dm644 squashfs-root/stackwallet.png ${pkgdir}/usr/share/pixmaps/stackwallet.png
}
