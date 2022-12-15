# Maintainer: libele <libele@disroot.org>
# Contributor: Vinicius Correa <vinicius.correa at zoho dot com>

_pkgname=krita
pkgname=krita-appimage
pkgver=5.1.4
pkgrel=1
pkgdesc="Edit and paint images (AppImage version)"
arch=('x86_64')
url="https://krita.org"
license=('GPL3')
provides=('krita')
conflicts=('krita')
source=(
	"https://download.kde.org/stable/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}-${arch}.appimage"{,.sig}
	"${_pkgname}.sh"
)
sha256sums=('f6678796cb98086b1e576aae4911e3d6b133cd0a4ec61a900ff5136a9f55917d'
            'SKIP'
            'e9db000021c54ec34f245d4b936e93a7dc7f6331b2679305798484fd1e0bbf6a')
validpgpkeys=('05D00A8B73A686789E0A156858B9596C722EA3BD'  # Boudewijn Rempt <foundation@krita.org>
	      'E9FB29E74ADEACC5E3035B8AB69EB4CF7468332F'  # Dmitry Kazakov (main key) <dimula73@gmail.com>
	      '064182440C674D9F8D0F6F8B4DA79EDA231C852B') # Stichting Krita Foundation <foundation@krita.org>
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
