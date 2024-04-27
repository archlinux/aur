# Maintainer: David Cooper <david@dtcooper.com>

pkgname=butt-appimage
_pkgname=butt
pkgver=1.41.1
pkgrel=1
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
sha256sums=('4d80adfd04b7939d338f86914faf71648b266fc6954c2f9581f07d741e42391f'
            'cbf5c87059b54d655de522fe903089736d42b4cc22a4c420444e203eb6b9fbdf')
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
  ln -s "/usr/share/doc/${_pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"

  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  install -Dm755 "${srcdir}/squashfs-root/usr/share/applications/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -dm755 "${pkgdir}/usr/bin/"
  ln -s "/opt/${_pkgname}/${_appimage_filename}" "${pkgdir}/usr/bin/${_pkgname}"
}
