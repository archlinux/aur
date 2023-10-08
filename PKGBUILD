# Maintainer: Harriet O'Brien <harrietobrien at pm dot me>
# Contributor: Jorge Martínez <siorys at disroot dot org>
pkgname=krita-beta-appimage
_name=krita
pkgver=5.1.5
pkgrel=1
pkgdesc="Edit and paint images"
arch=('x86_64')
url="https://krita.org"
license=('GPL3')
provides=('krita')
conflicts=('krita')
_appimage="${_name}-${pkgver}-${arch}.appimage"
source_x86_64=("https://download.kde.org/stable/${_name}/${pkgver}/${_appimage}")
sha256sums_x86_64=('a1f7e951a8c5a43da70a56de5199fb807e44e3156973721d7d3a14974fbc225c')
options=(!strip)
noextract=("${_appimage}")

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
  sed -i -E "s|Exec=${_name}|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_name}|"\
  	"squashfs-root/org.kde.${_name}.desktop"
  rm "${srcdir}/squashfs-root/usr/share/icons/hicolor/icon-theme.cache"
}

package() {
  # AppImage
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_name}.AppImage"

  # Desktop file
  install -dm755 "${pkgdir}/usr/share/applications/"
  install -Dm644 "${srcdir}/squashfs-root/org.kde.${_name}.desktop"\
	"${pkgdir}/usr/share/applications/${_name}.desktop"

  # Icon images
  install -dm755 "${pkgdir}/usr/share/"
  cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${_name}.AppImage" "${pkgdir}/usr/bin/${_name}"
}