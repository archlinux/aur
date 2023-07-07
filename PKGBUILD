# Maintainer: Nixuge

pkgname=labymod-appimage
_pkgname=labymodlauncher
pkgver=1.0.18
pkgrel=1
pkgdesc='A minecraft Launcher & modpack that optimizes the game and adds a bunch of useful features ! (1.8->1.20.1)'
url=https://www.labymod.net
arch=(x86_64)
license=(unknown)
depends=(fuse xorg-xrandr)
options=(!strip)
_appimage="LabyMod%20Launcher-latest.AppImage"
source=("https://laby-releases.s3.de.io.cloud.ovh.net/launcher/linux/x64/LabyMod%20Launcher-latest.AppImage")
sha256sums=('b4d063bdb86aa82eb37c3313965e49975c3ce1f4df90e33429316b4a09b84ee0')

prepare() {
	chmod +x "${_appimage}"
	./"${_appimage}" --appimage-extract
}

build() {
	# Adjust .desktop so it will work outside of AppImage container
	sed -i -E \
		"s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
		"squashfs-root/${_pkgname}.desktop"
	# Fix permissions; .AppImage permissions are 700 for all directories
	chmod -R a-x+rX squashfs-root/usr
}

package() {
	# AppImage
	install -Dm755 \
		"${srcdir}/${_appimage}" \
		"${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

	# Desktop file
	install -Dm644 \
		"${srcdir}/squashfs-root/${_pkgname}.desktop" \
		"${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# Icon images
	install -dm755 "${pkgdir}/usr/share/"
	cp -a \
		"${srcdir}/squashfs-root/usr/share/icons" \
		"${pkgdir}/usr/share/"

	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s \
		"/opt/${_pkgname}/${_pkgname}.AppImage" \
		"${pkgdir}/usr/bin/${_pkgname}"
}
