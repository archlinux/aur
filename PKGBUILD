# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=gimp-appimage
_pkgname=gimp
pkgver=3.2.8
pkgrel=1
pkgdesc="GNU Image Manipulation Program AppImage"
provides=('gimp')
conflicts=('gimp')
arch=('x86_64')
depends=('fuse2')
url="https://www.gimp.org/"
options=(!strip)
_desktop_name=org.gimp.GIMP.Stable.desktop
_icon_name=org.gimp.GIMP.Stable.svg
_filename=GIMP-${pkgver}-x86_64.AppImage
source=(
  https://download.gimp.org/gimp/v3.2/linux/GIMP-${pkgver}-x86_64.AppImage
)
sha512sums=('572ca857c7ddda467265259ada1add46c3c8a7d4951af1f580600fde9e314a17ef9f767b137a12f56c66e4d349e18323ebfda353c6c9411bf6bc04a5fced9cb1')

prepare() {
  cd "${srcdir}"
  rm -rf squashfs-root
  chmod +x ${_filename}
  ./${_filename} --appimage-extract
  sed -i -e "s|Exec=.\+|Exec=env APPIMAGELAUNCHER_DISABLE=1 DESKTOPINTEGRATION=0 /usr/bin/gimp %U|" squashfs-root/${_desktop_name}
  sed -i -e "s|TryExec=.\+|Exec=env APPIMAGELAUNCHER_DISABLE=1 DESKTOPINTEGRATION=0 /usr/bin/gimp|" squashfs-root/${_desktop_name}
  sed -i -E "s:StartupWMClass=org.gimp.GIMP.Stable:StartupWMClass=${_pkgname}:" "squashfs-root/${_desktop_name}"
}

package() {
  echo "Starting install"
  install -Dm755 ${_filename} "${pkgdir}/opt/GIMP/${_filename}"

  echo "Symlinking binary"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/GIMP/${_filename}" "${pkgdir}/usr/bin/${_pkgname}"

  echo "Installing desktop launcher"
  install -Dm755 squashfs-root/${_desktop_name} "${pkgdir}/usr/share/applications/${_desktop_name}"
  echo "Installing icon"
  install -Dm644 "squashfs-root/${_icon_name}" "${pkgdir}/usr/share/pixmaps/${_icon_name}"
}
