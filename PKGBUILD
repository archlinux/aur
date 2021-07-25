# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=icedrive-appimage
_pkgname=Icedrive_Portable_Linux-x64
pkgver=1.2.7
pkgrel=1
pkgdesc='The next generation of cloud storage'
arch=('x86_64')
url='https://icedrive.net'
license=('custom:Commercial')
depends=('fuse2' 'zlib' 'hicolor-icon-theme')
options=(!strip)
_shortname='icedrive'
_appimage="${_pkgname}.AppImage"
source=("${_appimage}::${url}/downloads/portable/${_pkgname}.AppImage")
#source=("${_appimage}::${url}/downloads/portable/${_pkgname}.AppImage")
noextract=("${_appimage}")
sha256sums=(
	'5a25ecbc31e48dccd5b8f110fbf193fd8989883ab6128ae66787cabfe0d6b05c')


prepare() {
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

	# Desktop file
	install -Dm644 "${srcdir}/squashfs-root/${_shortname}.desktop"\
		"${pkgdir}/usr/share/applications/${_shortname}.desktop"

	# Icon images
	install -dm755 "${pkgdir}/usr/share/"
	cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_shortname}"
}