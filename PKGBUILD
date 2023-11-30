# Maintainer: David Cooper <david@dtcooper.com>

pkgname=butt-appimage
pkgver=0.1.40
pkgrel=1
pkgdesc="BUTT (Broadcast Using This Tool) is an easy to use, multi-OS streaming tool (AppImage release)."
arch=('x86_64')
url='https://danielnoethen.de/butt/'
license=('GPL-2.0-or-later')
depends=('fuse2')
_filename="butt-${pkgver}-x86_64.AppImage"
source=(
  "https://danielnoethen.de/butt/release/${pkgver}/${_filename}"
)
sha256sums=(
  "338abd0133e1eb34053159eb39e931dbea8315fd98cca12d2c1ce7147754f8f5"
)
options=(!strip)

prepare() {
  cd "${srcdir}"
  chmod +x ${_filename}
  ./${_filename} --appimage-extract usr/share/applications/butt.desktop
  ./${_filename} --appimage-extract usr/share/icons
  echo "$_install_path"
}

package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/butt/${_filename}"

  install -dm755 "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  install -Dm755 "${srcdir}/squashfs-root/usr/share/applications/butt.desktop" "${pkgdir}/usr/share/applications/butt.desktop"

  install -dm755 "${pkgdir}/usr/bin/"
  ln -s "/opt/butt/${_filename}" "${pkgdir}/usr/bin/butt"
}
