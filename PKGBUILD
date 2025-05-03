# Maintainer: David Cooper <david@dtcooper.com>

pkgname=butt-appimage
_pkgname=butt
pkgver=1.45.0
pkgrel=1
pkgdesc="Easy to use, multi OS streaming tool (AppImage release)."
arch=('x86_64')
url='https://danielnoethen.de/butt/'
license=('GPL-2.0-or-later')
depends=('fuse2')
_appimage_filename="${_pkgname}-${pkgver}-x86_64.AppImage"
source=(
  "${_appimage_filename}::https://danielnoethen.de/butt/release/${pkgver}/${_appimage_filename}"
  "${_pkgname}-${pkgver}.tar.gz::https://danielnoethen.de/butt/release/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
)
sha256sums=('852200578380afb8928f2f014cfe45abd160ee81ba348cf4d9cdc30a66628544'
            '88498510946c4ef1de28662f9e1cd85d20bfab40d2c3467f6202b86ee0ed8364')
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

  for txtfile in AUTHORS ChangeLog COPYING KNOWN_BUGS NEWS README THANKS; do
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/${txtfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${txtfile}"
  done

  install -dm755 "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -s "/usr/share/doc/${_pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  install -Dm755 "${srcdir}/squashfs-root/usr/share/applications/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -dm755 "${pkgdir}/usr/bin/"
  ln -s "/opt/${_pkgname}/${_appimage_filename}" "${pkgdir}/usr/bin/${_pkgname}"
}
