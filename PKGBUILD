# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=stack-wallet-appimage
pkgver=2.3.1
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
_build=281
source=(
  https://github.com/cypherstack/stack_wallet/releases/download/build_${_build}/${_filename}
)
sha512sums=('8aa1b0fb7b6366b383f0953fa03b8a33795496d65eb6b60c66a7676b5e7cfbf927611da06b03a31a004bc3b585fbef2a49cad82fc0cff25e3f3c998f0eeaa2b8')

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
