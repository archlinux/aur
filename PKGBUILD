# Maintainer: Nixugea

# As of 1.0.32, the hash check is skipped.
# Labymod unfortunately does not provide version specific download links.
# As a result, this PKGBUILD always has to download the latest version.

# This unfortunately makes it so that if the downloaded launcher is more recent than the
# one here, the hash check will fail and the package won't be installable.

# The pkgver will still be updated when new versions come out so that players get updates.

pkgname=labymod-appimage
_pkgname=labymodlauncher
pkgver=2.0.2
pkgrel=1
pkgdesc='A minecraft Launcher & modpack that optimizes the game and adds a bunch of useful features ! (1.8->1.20.1)'
url=https://www.labymod.net
arch=(x86_64)
license=(unknown)
depends=(fuse xorg-xrandr)
options=(!strip)
_appimage="LabyMod%20Launcher-latest.AppImage"
source=("https://releases.r2.labymod.net/launcher/linux/x64/LabyMod%20Launcher-latest.AppImage")
sha256sums=('SKIP')

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
