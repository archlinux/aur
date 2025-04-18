# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=mytonwallet-appimage
pkgver=3.5.6
pkgrel=1
pkgdesc="Feature rich TON wallet"
provides=('mytonwallet')
conflicts=('mytonwallet')
arch=('x86_64')
depends=('fuse2')
url="https://mytonwallet.io/"
options=(!strip)
_desktop_name=mytonwallet.desktop
_filename=MyTonWallet-x86_64.AppImage
source=(
  https://github.com/mytonwalletorg/mytonwallet/releases/download/v${pkgver}/${_filename}
)
sha256sums=('655be21d7351c0fef8e74ef3d290b9643828527a812d0cd45d90b25c33c7fe44')

prepare() {
  cd "${srcdir}"
  rm -rf squashfs-root
  chmod +x ${_filename}
  ./${_filename} --appimage-extract
  sed -i -e "s|Exec=.\+|Exec=env APPIMAGELAUNCHER_DISABLE=1 DESKTOPINTEGRATION=0 /usr/bin/MyTonWallet-x86_64.AppImage %U|" squashfs-root/${_desktop_name}
}

package() {
  echo "Starting install"
  install -Dm755 ${_filename} "${pkgdir}"/usr/bin/${_filename}
  echo "Installing desktop launcher"
  install -Dm755 squashfs-root/${_desktop_name} "${pkgdir}"/usr/share/applications/${_desktop_name}
  echo "Installing icon"
  install -Dm644 squashfs-root/mytonwallet.png ${pkgdir}/usr/share/pixmaps/mytonwallet.png
}
