# Maintainer: David Cooper <david@dtcooper.com>

pkgname=butt-appimage
_pkgname=butt
pkgver=0.1.40
pkgrel=2
pkgdesc="BUTT (Broadcast Using This Tool) is an easy to use, multi-OS streaming tool (AppImage release)."
arch=('x86_64')
url='https://danielnoethen.de/butt/'
license=('GPL-2.0-or-later')
depends=('fuse2')
_appimage_filename="butt-${pkgver}-x86_64.AppImage"
source=(
  "https://danielnoethen.de/butt/release/${pkgver}/${_appimage_filename}"
  "https://danielnoethen.de/butt/release/${pkgver}/butt-${pkgver}.tar.gz"
)
sha256sums=(
  "338abd0133e1eb34053159eb39e931dbea8315fd98cca12d2c1ce7147754f8f5"
  "c1a835efb50843a6290642795d097162d4dd04514d3b9abe04b0ff0a25241a80"
)
options=(!strip)
provides=("${_pkgname}")
conflicts=("${_pkgname}")


prepare() {
  cd "${srcdir}"
  chmod +x "${_appimage_filename}"
  ./${_appimage_filename} --appimage-extract usr/share/applications/butt.desktop
  ./${_appimage_filename} --appimage-extract usr/share/icons
}

package() {
  install -Dm755 "${srcdir}/${_appimage_filename}" "${pkgdir}/opt/${_pkgname}/${_appimage_filename}"
  install -Dm644 "${srcdir}/butt-${pkgver}/COPYING" "${pkgdir}/opt/${_pkgname}/LICENSE"
  install -Dm644 "${srcdir}/butt-${pkgver}/AUTHORS" "${pkgdir}/opt/${_pkgname}/AUTHORS"
  install -Dm644 "${srcdir}/butt-${pkgver}/ChangeLog" "${pkgdir}/opt/${_pkgname}/ChangeLog"
  install -Dm644 "${srcdir}/butt-${pkgver}/KNOWN_BUGS" "${pkgdir}/opt/${_pkgname}/KNOWN_BUGS"
  install -Dm644 "${srcdir}/butt-${pkgver}/README" "${pkgdir}/opt/${_pkgname}/README"
  install -Dm644 "${srcdir}/butt-${pkgver}/THANKS" "${pkgdir}/opt/${_pkgname}/THANKS"

  install -dm755 "${pkgdir}/usr/share/butt"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  install -Dm755 "${srcdir}/squashfs-root/usr/share/applications/butt.desktop" "${pkgdir}/usr/share/applications/butt.desktop"

  install -dm755 "${pkgdir}/usr/bin/"
  ln -s "/opt/butt/${_appimage_filename}" "${pkgdir}/usr/bin/${_pkgname}"
}
