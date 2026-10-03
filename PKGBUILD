# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=gimp-appimage
_pkgname=gimp
pkgver=3.2.6
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
sha512sums=('9ed8a22d826e313104d09c02b4944d1afb634d630203338c008d9283c0b72a92c46acddbcc204eb8f6bca559d88e8ce2a40628ef6467ae69f7189a0b1586216d')

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
