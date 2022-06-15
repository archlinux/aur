# Maintainer: Jorge Martínez <siorys at disroot dot org>

_pkgname=krita
pkgname=${_pkgname}-beta-appimage
pkgver=5.0.6
_pkgver="5.0.6"
pkgrel=1
pkgdesc="Edit and paint images"
arch=('x86_64')
url="https://krita.org"
license=('GPL3')
provides=('krita')
conflicts=('krita')
source_x86_64=("https://download.kde.org/stable/${_pkgname}/${_pkgver}/${_pkgname}-${_pkgver}-${arch}.appimage")
options=(!strip)
_appimage="${_pkgname}-${_pkgver}-${arch}.appimage"
noextract=("${_appimage}")

prepare() {
  chmod +x ${_appimage}
  ./"${_appimage}" --appimage-extract
  sed -i -E "s|Exec=${_pkgname}|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
  	"squashfs-root/org.kde.${_pkgname}.desktop"
  rm ${srcdir}/squashfs-root/usr/share/icons/hicolor/icon-theme.cache
}

package() {
  # AppImage
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage"

  # Desktop file
  install -dm755 "${pkgdir}/usr/share/applications/"
  install -Dm644 "${srcdir}/squashfs-root/org.kde.${_pkgname}.desktop"\
	"${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon images
  install -dm755 "${pkgdir}/usr/share/"
  cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}

sha256sums_x86_64=('cad47dce4393c0206b047813e0c4240cba3e8b1e53e60490c8c83b1685666f08')
sha256sums_x86_64=('3233160fa3b0a467f8bcde4bf9019544d4c9d305ba9b4ba4bcaf58c975bc1070')
