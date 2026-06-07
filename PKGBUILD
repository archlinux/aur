# Maintainer: AUR@cheatbreaker.net

pkgname=cheatbreaker
_pkgname=cheatbreaker
pkgver=2026.6.0
pkgrel=1
pkgdesc='CheatBreaker is a modpack and FPS booster combined! In most cases, CheatBreaker more than doubles your normal Minecraft frames!'
url=https://cheatbreaker.net
arch=('x86_64' 'arm64')
depends=(fuse xorg-xrandr)
options=(!strip)
source_x86_64=("${_pkgname}-${pkgver}-x86_64.AppImage::https://r2.cheatbreaker.net/Launcher/master/Linux/amd64/CheatBreaker.AppImage")
source_arm64=("${_pkgname}-${pkgver}-arm64.AppImage::https://r2.cheatbreaker.net/Launcher/master/Linux/arm64/CheatBreaker-ARM64.AppImage")
md5sums_x86_64=('1cce23f37dec28d2f45b1f21988f4442')
md5sums_arm64=('309882e93b09e113e97e66719455f0dd')

prepare() {
	if [ "${CARCH}" == 'arm64' ]; then
		_appimage="${_pkgname}-${pkgver}-arm64.AppImage"
	else
		_appimage="${_pkgname}-${pkgver}-x86_64.AppImage"
	fi
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
	if [ "${CARCH}" == 'arm64' ]; then
		_appimage="${_pkgname}-${pkgver}-arm64.AppImage"
	else
		_appimage="${_pkgname}-${pkgver}-x86_64.AppImage"
	fi
 
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
