# Maintainer: Vinicius Correa <vinicius.correa at zoho dot com>

_pkgname=krita
pkgname=${_pkgname}-appimage
pkgver=5.0.0
pkgrel=1
pkgdesc="Edit and paint images"
arch=('x86_64')
url="https://krita.org"
license=('GPL3')
provides=('krita')
conflicts=('krita')
source=(
	"https://download.kde.org/stable/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}-${arch}.appimage"
	"${_pkgname}.sh"
)
sha256sums=(
	'93f352cd22161c19ce75414fca868ef04bf8141bc2d4fb84277029fea1ed73c1'
	'SKIP'
)
options=(!strip)
_filename=./${_pkgname}-${pkgver}-${arch}.appimage

prepare() {
  cd "${srcdir}"
  chmod +x ${_filename}
  ${_filename} --appimage-extract
  rm ${srcdir}/squashfs-root/usr/share/icons/hicolor/icon-theme.cache
}

package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_pkgname}.AppImage"
  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/applications/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/org.kde.${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"
}
