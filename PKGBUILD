# Maintainer: David Cooper <david@dtcooper.com>

pkgname=butt-appimage
_pkgname=butt
pkgver=0.1.40
pkgrel=4
pkgdesc="Easy to use, multi OS streaming tool (AppImage release)."
arch=('x86_64')
url='https://danielnoethen.de/butt/'
license=('GPL-2.0-or-later')
depends=('fuse2')
_appimage_filename="${_pkgname}-${pkgver}-x86_64.AppImage"
source=(
  "https://danielnoethen.de/butt/release/${pkgver}/${_appimage_filename}"
  "https://danielnoethen.de/butt/release/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
)
sha256sums=('338abd0133e1eb34053159eb39e931dbea8315fd98cca12d2c1ce7147754f8f5'
            'c1a835efb50843a6290642795d097162d4dd04514d3b9abe04b0ff0a25241a80')
options=(!strip)
provides=("${_pkgname}")
conflicts=("${_pkgname}")


prepare() {
  cd "${srcdir}"
  chmod +x "${_appimage_filename}"
  ./${_appimage_filename} --appimage-extract usr/share/applications/${_pkgname}.desktop > /dev/null 2>&1
  ./${_appimage_filename} --appimage-extract usr/share/icons > /dev/null 2>&1
}

package() {
  install -Dm755 "${srcdir}/${_appimage_filename}" "${pkgdir}/opt/${_pkgname}/${_appimage_filename}"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"

  for txtfile in AUTHORS ChangeLog KNOWN_BUGS NEWS README THANKS; do
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/${txtfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${txtfile}"
  done

  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  install -Dm755 "${srcdir}/squashfs-root/usr/share/applications/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -dm755 "${pkgdir}/usr/bin/"
  ln -s "/opt/${_pkgname}/${_appimage_filename}" "${pkgdir}/usr/bin/${_pkgname}"
}
