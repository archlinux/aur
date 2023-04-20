# Maintainer: AUR@cheatbreaker.net

pkgname=cheatbreaker
_pkgname=cheatbreaker
pkgver=2.3.5
pkgrel=1
pkgdesc='CheatBreaker is a modpack and FPS booster combined! In most cases, CheatBreaker more than doubles your normal Minecraft frames!'
url=https://cheatbreaker.net
arch=(x86_64)
depends=(fuse xorg-xrandr)
options=(!strip)
_appimage="CheatBreaker.AppImage"
source=("https://github.com/CheatBreakerNet/Launcher/releases/download/${pkgver}/CheatBreaker.AppImage")
md5sums=('fd97bee6677faec64bca3dca46cc27b6')

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