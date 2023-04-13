# Maintainer: AUR@offlinecheatbreaker.com

pkgname=offline-cheatbreaker
_pkgname=offline-cheatbreaker
pkgver=2.3.3
pkgrel=1
pkgdesc='Offline CheatBreaker is a continuation of the original CheatBreaker (which was shutdown in 2018 and was a modpack and FPS booster combined!). In most cases, Offline CheatBreaker more than doubles your normal Minecraft frames!'
url=https://offlinecheatbreaker.com
arch=(x86_64)
depends=(fuse xorg-xrandr)
options=(!strip)
_appimage="Offline_CheatBreaker.AppImage"
source=("https://github.com/Offline-CheatBreaker/Launcher/releases/download/${pkgver}/Offline_CheatBreaker.AppImage")
md5sums=('193c4a8993fa0bee0fa525cf90a462b3')

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