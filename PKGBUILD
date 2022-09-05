# Maintainer: Gustavo Chain <me@qustavo.cc>

_pkgname=notesnook
pkgname=${_pkgname}-bin
pkgver="2.1.6"
pkgrel=2
pkgdesc="Open source zero knowledge private note taking"
arch=('x86_64')
url="https://notesnook.com"
license=('GPL')
options=(!strip)
provides=(${_pkgname})
conflicts=(${_pkgname})
_appimage="${_pkgname}_x86_64.AppImage"
_Pkgname=Notesnook
source=(
	"${_appimage}::https://github.com/streetwriters/notesnook/releases/download/v$pkgver/${_appimage}"
)
sha512sums=('a6773468a134425c1ff3096b3b86df26b1bcd96b8dc6657c75bed5e0697954e5d857e67a3f4bd4b94c034bb485c2edcbadd6604ce1dc0697065ecf8e0939f3e3')
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
