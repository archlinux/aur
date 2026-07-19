# Maintainer: v9pzm7 <deanae at qq dot com>
# Contributor: libele <libele@disroot.org>
# Contributor: Vinicius Correa <vinicius.correa at zoho dot com>

_pkgname=krita
pkgname=krita-appimage
pkgver=6.0.2.1
pkgrel=1
pkgdesc="Edit and paint images (official AppImage release)"
arch=('x86_64')
url="https://krita.org"
license=('GPL3')
provides=('krita')
depends=('fuse2' 'hicolor-icon-theme')
conflicts=('krita')
source=(
	"https://download.kde.org/stable/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}-${arch}.AppImage"{,.sig}
)
sha256sums=('26f9e12901a35d967d0779597099394c57063dd1b785cdf37df49004d58ec183'
            'SKIP')
validpgpkeys=('05D00A8B73A686789E0A156858B9596C722EA3BD'  # Boudewijn Rempt <foundation@krita.org>
	      'E9FB29E74ADEACC5E3035B8AB69EB4CF7468332F'  # Dmitry Kazakov (main key) <dimula73@gmail.com>
	      '064182440C674D9F8D0F6F8B4DA79EDA231C852B') # Stichting Krita Foundation <foundation@krita.org>
options=(!strip)
_filename=./"${_pkgname}-${pkgver}-${arch}".AppImage

prepare() {
  cd "${srcdir}"
  chmod +x "${_filename}"
  "${_filename}" --appimage-extract usr/share/icons
  "${_filename}" --appimage-extract org.kde.${_pkgname}.desktop
}

package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}.AppImage"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "../lib/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/applications/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/org.kde.${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"
}
