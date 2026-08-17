# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: Roman Kupriyanov <mr.eshua@gmail.com>

_pkgname=jitsi-meet-desktop
pkgname=${_pkgname}-bin
pkgver=2026.8.0
pkgrel=1
pkgdesc="Jitsi Meet desktop application powered by Electron"
arch=('x86_64')
url="https://github.com/jitsi/jitsi-meet-electron"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=(
	"${_pkgname}"
	'jitsi-meet-electron')
replaces=('jitsi-meet-electron')
depends=(
	'alsa-lib'
	'gtk3'
	'nss')

options=(!strip)
source=(
	"jitsi-meet-${arch[0]}-${pkgver}.AppImage::https://github.com/jitsi/jitsi-meet-electron/releases/download/v${pkgver//_/-}/jitsi-meet-${arch[0]}.AppImage"
	"${_pkgname}.desktop")
sha256sums=('c0145f6d11ab74df402628d62afdd77c00666961de44d817c7d99a4ae6606932'
            'e11ef8c07bdc5067976f562b236b8c0d683c0e9037f2eb93482c2fd6ba3a5aff')


prepare() {
	chmod u+x      "${srcdir}/jitsi-meet-${arch[0]}-${pkgver}.AppImage"
	"${srcdir}/jitsi-meet-${arch[0]}-${pkgver}.AppImage" --appimage-extract
}

package() {
	find           "${srcdir}/squashfs-root/locales/" -type d -exec chmod 755 {} +
	find           "${srcdir}/squashfs-root/resources/" -type d -exec chmod 755 {} +

	install -d     "${pkgdir}/opt/${_pkgname}"
	cp -r          "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${_pkgname}"

	# Remove broken or unused files and directories
	rm -r          "${pkgdir}/opt/${_pkgname}/usr/"
	rm             "${pkgdir}/opt/${_pkgname}/AppRun"
	rm             "${pkgdir}/opt/${_pkgname}/jitsi-meet.desktop"
	rm             "${pkgdir}/opt/${_pkgname}/jitsi-meet.png"

	find           "${srcdir}/squashfs-root/usr/share/icons/" -type d -exec chmod 755 {} +

	install -d     "${pkgdir}/usr/share/icons"
	cp -r          "${srcdir}/squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons/hicolor"

	install -d     "${pkgdir}/usr/bin"
	ln -s          "../../opt/${_pkgname}/jitsi-meet" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
