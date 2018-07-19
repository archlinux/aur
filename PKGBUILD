# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
_pkgname=wootility
pkgname=${_pkgname}-appimage
pkgver=2.4.0
pkgrel=1
pkgdesc='Utility for configuring Wooting keyboards (binary AppImage version)'
arch=('x86_64')
url='https://www.wooting.nl/wootility'
license=('unknown')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
_appimage="${_pkgname}-${pkgver}-x86_64.AppImage"
source=("https://s3.eu-west-2.amazonaws.com/wooting-update/wootility-linux-beta/${_appimage}"
        '70-wooting.rules')
noextract=("${_appimage}")
sha512sums=('d751a6c9172be6b1c838ac867ac3c64d41f8fab9cdaaf911c156c1939d262db1c479cd2bc59f8febcb7a519544996a15ac80a5ed1503b67d43a6205510dc7429'
            'f8b9eb4334e776d6b30b2ac896fb94497e8d200c9b8de4e00698d6e766aec30a55d6c225b1c91cb1eda5c98161ad26c635da5a555bbf5b349d69c4bc64fba912')

prepare() {
	bsdcpio --extract --make-directories --insecure 'wootility.desktop' '.DirIcon' 'usr/share/icons' < "${_appimage}"
}

build() {
	sed -i -E "s|Exec=AppRun|Exec=${_pkgname}|" wootility.desktop
	chmod -R g-w,o-w usr/share/icons
}

package() {
	install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}"
	install -d "${pkgdir}/usr/bin"
	ln -s "../../opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dpm644 'wootility.desktop' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -d "${pkgdir}/usr/share/icons"
	cp -a usr/share/icons/default "${pkgdir}/usr/share/icons/hicolor"
	install -Dpm644 '70-wooting.rules' "${pkgdir}/usr/lib/udev/rules.d/70-wooting.rules"
}
