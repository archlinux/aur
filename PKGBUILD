# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=tari-universe-appimage
pkgver=1.2.0
pkgrel=1
pkgdesc="Tari desktop wallet"
provides=('tari_universe')
conflicts=('tari_universe')
arch=('x86_64')
depends=('fuse2')
url="https://tari.com/"
options=(!strip)
_desktop_name=tari_universe.desktop
_icon_name=tari_universe.png
_filename=tari_universe_${pkgver}_amd64.AppImage
source=(
  https://github.com/tari-project/universe/releases/download/v${pkgver}/${_filename}
)
sha256sums=('72b4fe18364fbcf08d4e9a954d5e4177c3a2777294a92e7015116a0d6c24768a')

prepare() {
  cd "${srcdir}"
  rm -rf squashfs-root
  chmod +x ${_filename}
  ./${_filename} --appimage-extract
  sed -i -e "s|Exec=.\+|Exec=env APPIMAGELAUNCHER_DISABLE=1 DESKTOPINTEGRATION=0 /usr/bin/tari_universe.AppImage %U|" squashfs-root/${_desktop_name}
  sed -i -e "s|Name=.\+|Name=Tari Universe|" squashfs-root/${_desktop_name}
}

package() {
  echo "Starting install"
  install -Dm755 ${_filename} "${pkgdir}"/usr/bin/tari_universe.AppImage
  echo "Installing desktop launcher"
  install -Dm644 squashfs-root/${_desktop_name} "${pkgdir}"/usr/share/applications/${_desktop_name}
  echo "Installing icon"
  install -Dm644 squashfs-root/${_icon_name} ${pkgdir}/usr/share/pixmaps/${_icon_name}
}
