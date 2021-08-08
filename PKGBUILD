# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=icedrive-appimage
_pkgname=Icedrive_Portable_Linux-x64
pkgver=`date +%Y%m%d`
pkgrel=1
pkgdesc='The next generation of cloud storage'
arch=('x86_64')
url='https://icedrive.net'
license=('custom:Commercial')
depends=('fuse2' 'zlib' 'hicolor-icon-theme')
options=(!strip)
_shortname='icedrive'
_appimage="${_pkgname}.AppImage"
source=("https://icedrive.net/downloads/portable/Icedrive_Portable_Linux-x64.AppImage")
DLAGENTS=("https::/usr/bin/env wget -U 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'")
noextract=("${_appimage}")
sha256sums=('SKIP')


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