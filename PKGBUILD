# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=stack-wallet-appimage
pkgver=2.1.11
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
_build=265
source=(
  https://github.com/cypherstack/stack_wallet/releases/download/build_${_build}/${_filename}
)
sha512sums=('4e957ceed9463d15a8e1659073ab4062f65c11672e818997f1ca17a8811a83e80f880176df53a4ba2a4cf27c47072b3d258a1a80a74cce47d321707d7f054d90')

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
