###
# @Author: timochan
# @Date: 2023-11-16 19:16:49
# @LastEditors: timochan
# @LastEditTime: 2023-11-17 08:33:35
# @FilePath: /clash-nyanpasu-appimage/PKGBUILD
###
_pkgname=clash-nyanpasu
_Pkgname=clash-nyanpasu
_disname=clash-nyanpasu
major_version=1
minor_version=4
patch_version=0

pkgname="${_pkgname}"-appimage
pkgver="${major_version}.${minor_version}.${patch_version}"
pkgrel=1
pkgdesc="A Clash GUI based on tauri. Only for Clash Meta."
arch=('x86_64')
url="https://github.com/keiko233/clash-nyanpasu"
license=('GPL3')
options=(!strip)
depends=('zlib' 'hicolor-icon-theme' 'fuse2' 'clash-meta')
conflicts=('clash-nyanpasu-git' 'clash-nyanpasu-bin')
provides=('clash-nyanpasu')
source_x86_64=("${_Pkgname}-${major_version}.${minor_version}.${patch_version}-amd64.AppImage::https://github.com/keiko233/clash-nyanpasu/releases/download/v${major_version}.${minor_version}.${patch_version}/${_Pkgname}_${major_version}.${minor_version}.${patch_version}_amd64.AppImage")
sha256sums_x86_64=('5386610db36683dae504902895618c73797f47b6f3b5955584928bc964153bb5')

_appimage="${_Pkgname}-${major_version}.${minor_version}.${patch_version}-amd64.AppImage"
noextract=("${_appimage}")

prepare() {
	chmod +x "${_appimage}"
	./"${_appimage}" --appimage-extract
}

build() {
	# Adjust .desktop so it will work outside of AppImage container
	sed -i \
		-e "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
		-e "s|Icon=.*|Icon=/usr/share/icons/${_pkgname}.png|" \
		"squashfs-root/${_disname}.desktop"

	# Fix permissions; .AppImage permissions are 700 for all directories
	chmod -R a-x+rX squashfs-root/usr
}

package() {
	# AppImage
	install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

	# Desktop file
	install -Dm644 "${srcdir}/squashfs-root/${_disname}.desktop" \
		"${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# Icon images
	install -dm755 "${pkgdir}/usr/share/"
	cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
	ln -s "$(realpath ${srcdir}/squashfs-root/${_disname}.png --relative-to ${srcdir}/squashfs-root/usr/share/icons)" \
		"${pkgdir}/usr/share/icons/${_pkgname}.png"

	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

	# Symlink license
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
