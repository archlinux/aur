# Maintainer: Gustavo Chain <me@qustavo.cc>

_pkgname=notesnook
pkgname=${_pkgname}-bin
pkgver="2.2.3"
pkgrel=1
pkgdesc="Open source zero knowledge private note taking"
arch=('x86_64')
url="https://notesnook.com"
license=('GPL')
options=(!strip)
provides=(${_pkgname})
conflicts=(${_pkgname})
_appimage="${_pkgname}_linux_x86_64.AppImage"
_Pkgname=notesnook
source=(
	"${_appimage}::https://github.com/streetwriters/notesnook/releases/download/v$pkgver/${_appimage}"
)
sha512sums=('70dbf7645f9e9e9f032cd2953ed38bfd9aecadd1944e78468e33a7c53bd312ecacddf33d20478b1d457b9ed6052cfb93b3bb50178e8b4d37567889deca97d22f')
noextract=("${_appimage}")

prepare() {
	chmod +x ${_appimage}
	./${_appimage} --appimage-extract
}

build() {
	sed -i -E "s|Exec=AppRun|Exec=${_pkgname}|" "${srcdir}/squashfs-root/${_Pkgname}.desktop"
}

package() {
	# AppImage
	install -Dm 755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"

	# Symlink
	install -dm755 ${pkgdir}/usr/bin
	ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"

	# Icons
	install -dm755 ${pkgdir}/usr/share/icons/hicolor/256x256/apps
	cp -a "${srcdir}/squashfs-root/resources/assets/icons/256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_Pkgname}.png"

	# Desktop file
	install -Dm644 "${srcdir}/squashfs-root/${_Pkgname}.desktop"\
		"${pkgdir}/usr/share/applications/${_Pkgname}.desktop"
}
