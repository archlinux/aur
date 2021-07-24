# Maintainer: monosans

pkgname=lunar-client
_pkgname=lunarclient
pkgver=2.7.4
pkgrel=2
pkgdesc='A PvP modpack for all modern versions of Minecraft'
url='https://lunarclient.com'
arch=(x86_64)
license=(unknown)
depends=(fuse xorg-xrandr)
options=(!strip)
_appimage="Lunar%20Client-${pkgver}.AppImage"
source=("https://launcherupdates.lunarclientcdn.com/${_appimage}")
sha256sums=('f36307f21ddfe60adae3b9bb2aadf455dc6ea8f5c96193e6cebac8ec3c319296')

prepare() {
	chmod +x "${_appimage}"
	./"${_appimage}" --appimage-extract
}

build() {
	# Adjust .desktop so it will work outside of AppImage container
	sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
		"squashfs-root/${_pkgname}.desktop"
	# Fix permissions; .AppImage permissions are 700 for all directories
	chmod -R a-x+rX squashfs-root/usr
}

package() {
	# AppImage
	install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

	# Desktop file
	install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
			"${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# Icon images
	install -dm755 "${pkgdir}/usr/share/"
	cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
# vim:set ts=4 sw=4 noet:
