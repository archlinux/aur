# Maintainer: he3als@disroot.org
# Contributor: Fork of lunar-client by 'mail@nixuge.me'/'Nixuge'

pkgname=offline-cheatbreaker
_pkgname=offline-cheatbreaker
pkgver=2.3.0
pkgrel=1
pkgdesc='Continuation of the abandoned PvP modpack for Minecraft called CheatBreaker'
url=https://offlinecheatbreaker.com
arch=(x86_64)
license=(unknown)
depends=(fuse xorg-xrandr)
options=(!strip)
_appimage="Offline_CheatBreaker.AppImage"
source=("https://github.com/Offline-CheatBreaker/Launcher/releases/download/${pkgver}/Offline_CheatBreaker.AppImage")
sha256sums=('5ae205bbda1b0000a1f0aad565f578f5b29fcc3ade376a3787c44491b03a6e0e')

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
# vim:set ts=4 sw=4 noet:
