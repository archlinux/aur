# Maintainer: Nixuge

pkgname=localsend-bin
pkgver=1.9.1
pkgrel=1
pkgdesc='An open source cross-platform alternative to AirDrop '
url=https://github.com/localsend/localsend
arch=(x86_64)
license=(MIT)
depends=(zenity xdg-user-dirs libayatana-appindicator)
conflicts=('localsend-git')
provides=('localsend')
options=(!strip)
source=("https://github.com/localsend/localsend/releases/download/v${pkgver}/LocalSend-${pkgver}.AppImage")
sha256sums=('600846909c039e8f0678e7a9ca8907bf4ebc22163c1fe2fcf15aca3fbe951e35')
_appimage="LocalSend-${pkgver}.AppImage"
_appimage_nover="localsend.AppImage"
_pkgname="localsend"
_pkgdesktop="org.localsend.localsend_app.desktop"


prepare() {
	chmod +x "${_appimage}"
	./"${_appimage}" --appimage-extract
}

build() {
	# Adjust .desktop so it will work outside of AppImage container
	sed -i -E \
		"s|Exec=localsend_app|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
		"squashfs-root/${_pkgdesktop}"
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
    
	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s \
		"/opt/${_pkgname}/${_appimage_nover}" \
		"${pkgdir}/usr/bin/${_pkgname}"
}
