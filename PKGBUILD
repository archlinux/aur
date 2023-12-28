# Maintainer: FBis251 <aur at fbis251 dot com>

# This PKGBUILD was modified from the localsend-bin PKGBUILD by Nixuge
# https://aur.archlinux.org/packages/localsend-bin


pkgname=heynote-bin
pkgver=1.5.0
pkgrel=1
pkgdesc='A dedicated scratchpad for developers'
url=https://github.com/heynote/heynote
arch=(x86_64)
license=(MIT)
provides=('heynote')
options=(!strip)
source=("https://github.com/heyman/heynote/releases/download/v${pkgver}/Heynote_${pkgver}_x86_64.AppImage")
sha256sums=('5e6adfde719db18bebd37c92bd362c7f532772310c204d0da1b30848accfa2d1')
_appimage="Heynote_${pkgver}_x86_64.AppImage"
_appimage_nover="heynote.AppImage"
_pkgname="heynote"
_pkgdesktop="${_pkgname}.desktop"

prepare() {
	chmod +x "${_appimage}"
	./"${_appimage}" --appimage-extract
}

build() {
	# Adjust .desktop so it will work outside of AppImage container
	sed -i -E \
		"s|Exec=AppRun --no-sandbox %U|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
		"squashfs-root/${_pkgdesktop}"

	# Adjust .desktop to have it point to the correct icon (@CIAvash)
	# sed -i -E 's/^Icon=.+/Icon=localsend/' "squashfs-root/${_pkgdesktop}"

	# Fix permissions; .AppImage permissions are 700 for all directories
	chmod -R a-x+rX squashfs-root/usr
}

package() {
	# AppImage
	install -Dm755 \
		"${srcdir}/${_appimage}" \
		"${pkgdir}/opt/${_pkgname}/${_appimage_nover}"

	# Desktop file
	install -Dm644 \
		"${srcdir}/squashfs-root/${_pkgdesktop}" \
		"${pkgdir}/usr/share/applications/${_pkgdesktop}"

	# Icon file (using the 512x512 one only)
	install -Dm644 \
		"${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/heynote.png" \
		"${pkgdir}/usr/share/icons/heynote.png"

	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s \
		"/opt/${_pkgname}/${_appimage_nover}" \
		"${pkgdir}/usr/bin/${_pkgname}"
}
