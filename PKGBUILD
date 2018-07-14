# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
_pkgname=wootility
pkgname=${_pkgname}-appimage
pkgver=2.3.4
pkgrel=1
pkgdesc='Utility for configuring Wooting keyboards (binary AppImage version)'
arch=('x86_64')
url='https://www.wooting.nl/wootility'
license=('unknown')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
_appimage="${_pkgname}-${pkgver}-x86_64.AppImage"
source=("https://s3.eu-west-2.amazonaws.com/wooting-update/wootility-linux-beta/${_appimage}")
noextract=("${_appimage}")
sha512sums=('412a62b18302b025fddc5ca1c22849b457540e576e378ee32eac07c8b8a8fb37838737f41a2f7983ea7af1b0652acf29da0d2adb635aec34546303911fdf0dcd')

prepare() {
	bsdcpio --extract --make-directories --insecure 'wootility.desktop' 'usr/share/icons' < "${_appimage}"
}

build() {
	sed -i -E "s|Exec=AppRun|Exec=${_pkgname}|" wootility.desktop
	chmod -R g-w,o-w usr/share/icons
}

package() {
	install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}"
	install -d "${pkgdir}/usr/bin"
	ln -s "../../opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dp 'wootility.desktop' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -d "${pkgdir}/usr/share/icons"
	cp -a usr/share/icons/default "${pkgdir}/usr/share/icons/hicolor"
}
