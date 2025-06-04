# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=stack-wallet-appimage
pkgver=2.2.2
pkgrel=1
pkgdesc="Stack Wallet is a fully open source cryptocurrency wallet."
provides=('stack-wallet')
conflicts=('stack-wallet')
arch=('x86_64')
depends=('fuse2')
url="https://stackwallet.com/"
options=(!strip)
_desktop_name=stackwallet.desktop
_filename=sw-v${pkgver}.AppImage
_build=274
source=(
  https://github.com/cypherstack/stack_wallet/releases/download/build_${_build}/${_filename}
)
sha512sums=('f94c0bf1aaa42c057634f394d546d22d2c60ca55a7ed7fd87ca55eba8514ecf3d3380f2a43268bdb9d2d089626e8a0ee634bd6785f297ccdf8f394c85dbf1fa7')

prepare() {
  cd "${srcdir}"
  rm -rf squashfs-root
  chmod +x ${_filename}
  ./${_filename} --appimage-extract
  sed -i -e "s|Exec=.\+|Exec=env APPIMAGELAUNCHER_DISABLE=1 DESKTOPINTEGRATION=0 /usr/bin/StackWallet.AppImage|" squashfs-root/${_desktop_name}
}

package() {
  echo "Starting install"
  install -Dm755 ${_filename} "${pkgdir}"/usr/bin/StackWallet.AppImage
  echo "Installing desktop launcher"
  install -Dm755 squashfs-root/${_desktop_name} "${pkgdir}"/usr/share/applications/${_desktop_name}
  echo "Installing icon"
  install -Dm644 squashfs-root/stackwallet.png ${pkgdir}/usr/share/pixmaps/stackwallet.png
}
