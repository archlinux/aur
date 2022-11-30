# Maintainer: Gustavo Chain <me@qustavo.cc>

_pkgname=notesnook
pkgname=${_pkgname}-bin
pkgver="2.2.4"
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
sha512sums=('ca4cdd433d1d5844548ede084a8ab4da57eea87cdad7d5e93423a03312ceb237dfb14b0de54e469c9ae8b68d6d95ba6f730c7ab37d989d53babd2a2b9863aeff')
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
