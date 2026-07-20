# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=mytonwallet-appimage
pkgver=26.7.3
pkgrel=1
pkgdesc="Feature rich TON wallet"
provides=('mytonwallet')
conflicts=('mytonwallet')
arch=('x86_64')
depends=('fuse2')
url="https://mytonwallet.io/"
options=(!strip)
_desktop_name=mytonwallet.desktop
_filename=MyWallet-x86_64.AppImage
source=(
  https://github.com/mytonwalletorg/mytonwallet/releases/download/v${pkgver}/${_filename}
)
sha256sums=('ccb6622dd1a86907c703dfb018497fba6b2919f949d8f48ea007f14044f18190')

prepare() {
  cd "${srcdir}"
  rm -rf squashfs-root
  chmod +x ${_filename}
  ./${_filename} --appimage-extract
  sed -i -e "s|Exec=.\+|Exec=env APPIMAGELAUNCHER_DISABLE=1 DESKTOPINTEGRATION=0 /usr/bin/MyWallet-x86_64.AppImage %U|" -e "/^StartupWMClass=/d" squashfs-root/${_desktop_name}
}

package() {
  echo "Starting install"
  install -Dm755 ${_filename} "${pkgdir}"/usr/bin/${_filename}
  echo "Installing desktop launcher"
  install -Dm755 squashfs-root/${_desktop_name} "${pkgdir}"/usr/share/applications/${_desktop_name}
  echo "Installing icon"
  install -Dm644 squashfs-root/mytonwallet.png ${pkgdir}/usr/share/pixmaps/mytonwallet.png
}
