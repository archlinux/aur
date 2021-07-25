# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=sentinel-appimage
_pkgname=sentinel-linux
pkgver=0.3.4
pkgrel=1
pkgdesc='An open-source decentralized VPN network application'
arch=('x86_64')
url='https://github.com/sentinel-official/desktop-client'
license=('Apache')
depends=('fuse2' 'zlib' 'hicolor-icon-theme')
options=(!strip)
_shortname='sentinel'
_appimage="${_pkgname}-${pkgver}.AppImage"
source_x86_64=(
	"${_appimage}::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
	"https://raw.githubusercontent.com/sentinel-official/desktop-client/development/LICENSE"
)
noextract=("${_appimage}")
sha256sums_x86_64=(
	'9c870fc11b5667951aebdf07ade2e7510196d2c590e3fe6886c2268eb6635a1c'
	'2da574d2e8ac213083963019ef9cc1a97a5ea93dafa6bbe1bf3c1fdfff0c16b3')


prepare() {
	rm -f ${HOME}/.sentinel/client/config.toml
	chmod +x ${_appimage}
	./${_appimage} --appimage-extract
}

build() {
	# Adjust .desktop so it will work outside of AppImage container
	sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_shortname}|"\
		"squashfs-root/${_shortname}.desktop"
	# Fix permissions; .AppImage permissions are 700 for all directories
	chmod -R a-x+rX squashfs-root/usr
}

package() {
	# AppImage
	install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

	# Desktop file
	install -Dm644 "${srcdir}/squashfs-root/${_shortname}.desktop"\
		"${pkgdir}/usr/share/applications/${_shortname}.desktop"

	# Icon images
	install -dm755 "${pkgdir}/usr/share/"
	cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_shortname}"

	# Symlink license
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}