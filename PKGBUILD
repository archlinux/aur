# Maintainer: monosans

pkgname=lunar-client
_pkgname=lunarclient
pkgver=2.6.4
pkgrel=1
pkgdesc='PvP Modpack for Minecraft 1.7, 1.8, 1.12, 1.15 and 1.16'
url=https://lunarclient.com
arch=(x86_64)
license=(unknown)
depends=(fuse xorg-xrandr)
options=(!strip)
_appimage="Lunar Client-${pkgver}.AppImage"
source=("https://launcherupdates.lunarclientcdn.com/${_appimage}")
sha256sums=('ca86aa980aef516f85659e62c66e66eff691d2bd9c5d6eed608ac3522d3d6ff3')

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
