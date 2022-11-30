# Maintainer: libele <libele@disroot.org>
# Contributor: Vinicius Correa <vinicius.correa at zoho dot com>

_pkgname=krita
pkgname=krita-appimage
pkgver=5.1.3
pkgrel=1
pkgdesc="Edit and paint images (AppImage version)"
arch=('x86_64')
url="https://krita.org"
license=('GPL3')
provides=('krita')
conflicts=('krita')
source=(
	"https://download.kde.org/stable/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}-${arch}.appimage"
	"${_pkgname}.sh"
)
sha256sums=('b421a12fcd21c5ad18d91c917a9bb82e81b8d8c64c7402e4de3e5c3b5c0f7a67'
            'e9db000021c54ec34f245d4b936e93a7dc7f6331b2679305798484fd1e0bbf6a')
options=(!strip)
_filename=./"${_pkgname}-${pkgver}-${arch}".appimage

prepare() {
  cd "${srcdir}"
  chmod +x "${_filename}"
  "${_filename}" --appimage-extract
  rm "${srcdir}"/squashfs-root/usr/share/icons/hicolor/icon-theme.cache
}

package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_pkgname}.AppImage"
  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/applications/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/org.kde.${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"
}
