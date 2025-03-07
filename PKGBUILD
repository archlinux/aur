# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=supercell-wx-appimage
pkgver=0.4.8
pkgrel=1
pkgdesc="A NEXRAD Level 2 and Level 3 radar viewing application"
provides=('supercell-wx')
conflicts=('supercell-wx')
arch=('x86_64')
depends=('fuse2')
url="https://supercellwx.net/"
options=(!strip)
_desktop_name=supercell-wx.desktop
_icon_name=supercell-wx.png
_filename=supercell-wx-v${pkgver}-x86_64.AppImage
source=(
  https://github.com/dpaulat/supercell-wx/releases/download/v${pkgver}-release/${_filename}
)
sha256sums=('b94875a503dc891431c8534f52fbd3b751e19b52b8c0230895e1188ac9c35300')

prepare() {
  cd "${srcdir}"
  rm -rf squashfs-root
  chmod +x ${_filename}
  ./${_filename} --appimage-extract
  sed -i -e "s|Exec=.\+|Exec=env APPIMAGELAUNCHER_DISABLE=1 DESKTOPINTEGRATION=0 /usr/bin/supercell-wx.AppImage|" squashfs-root/${_desktop_name}
}

package() {
  echo "Starting install"
  install -Dm755 ${_filename} "${pkgdir}"/usr/bin/supercell-wx.AppImage
  echo "Installing desktop launcher"
  install -Dm644 squashfs-root/${_desktop_name} "${pkgdir}"/usr/share/applications/${_desktop_name}
  echo "Installing icon"
  install -Dm644 squashfs-root/${_icon_name} ${pkgdir}/usr/share/pixmaps/${_icon_name}
}
