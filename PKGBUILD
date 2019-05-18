# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
_pkgname=wootility
pkgname=${_pkgname}-appimage
pkgver=3.2.7
pkgrel=1
pkgdesc='Utility for configuring Wooting keyboards (binary AppImage version)'
arch=('x86_64')
url='https://wooting.io/wootility'
license=('unknown')
makedepends=('p7zip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
_appimage="${_pkgname}-${pkgver}-x86_64.AppImage"
source=("https://s3.eu-west-2.amazonaws.com/wooting-update/wootility-linux-latest/${_appimage}"
        '70-wooting.rules')
noextract=("${_appimage}")
sha512sums=('4cddab944178c9526c50fe43676b22f3e56a34aba0f3ac3b54101827cb6f90ad29847f2cb5dcbba4f05760d8b14ae19c5c28730cd29574a2946d15ad02526fd0'
            '3a569cb1292efc31e22fd6c425fff14ac98d7f280849b3d81cdd72523a3388e6623bcd026571f726656fb339f9b90527efd8829d82de1d0b1ac778921dd72633')

prepare() {
	7z x "${_appimage}" 'wootility.desktop' 'usr/share/icons' > /dev/null
}

build() {
	sed -i -E "s|Exec=AppRun|Exec=${_pkgname}|" wootility.desktop
	# Fix permissions; .AppImage permissions are 700 for all directories
	chmod -R a-x+rX usr
}

package() {
	install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}"
	install -d "${pkgdir}/usr/bin"
	ln -s "../../opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dpm644 'wootility.desktop' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -d "${pkgdir}/usr/share/icons"
	cp -a usr/share/icons/hicolor "${pkgdir}/usr/share/icons/hicolor"
	install -Dpm644 '70-wooting.rules' "${pkgdir}/usr/lib/udev/rules.d/70-wooting.rules"
}
