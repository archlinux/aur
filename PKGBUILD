# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=stack-wallet-appimage
pkgver=2.4.1
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
_build=292
source=(
  https://github.com/cypherstack/stack_wallet/releases/download/build_${_build}/${_filename}
)
sha512sums=('7f3fb11a624ba28f0c436db83158b69aceb9f5e9d17041f2cf997f79d24daca0430b8dc0aace32156597cf48ebf3fdf7a1ecca7e6e53672902ab0bce38c51a0c')

prepare() {
  cd "${srcdir}"
  rm -rf squashfs-root
  chmod +x ${_filename}
  ./${_filename} --appimage-extract
  sed -i -e "s|Exec=.\+|Exec=env APPIMAGELAUNCHER_DISABLE=1 DESKTOPINTEGRATION=0 /usr/bin/StackWallet.AppImage|" squashfs-root/${_desktop_name}
  echo "StartupWMClass=stack_wallet" >> squashfs-root/${_desktop_name}
}

package() {
  echo "Starting install"
  install -Dm755 ${_filename} "${pkgdir}"/usr/bin/StackWallet.AppImage
  echo "Installing desktop launcher"
  install -Dm755 squashfs-root/${_desktop_name} "${pkgdir}"/usr/share/applications/${_desktop_name}
  echo "Installing icon"
  install -Dm644 squashfs-root/stackwallet.png ${pkgdir}/usr/share/pixmaps/stackwallet.png
}
