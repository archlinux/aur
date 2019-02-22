# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
_pkgname=wootility
pkgname=${_pkgname}-appimage
pkgver=3.1.2
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
sha512sums=('36fab566041a5a8ffe0594e229c28b12909579b3f1351f77290804c45f9e970464180b8b008f4a6349a5734a1b381ca4f6aa91ed9204f8df06a6ab530c73dd1f'
            'd150e8825cc2254997745fd7a61afd65b05415d694d02d580197b4e3497e64da6261d4fb919a670917379ca1c813416478c2660fe4044e5138a69087ea31ce8d')

prepare() {
	7z x "${_appimage}" 'wootility.desktop' 'usr/share/icons' > /dev/null
}

build() {
	sed -i -E "s|Exec=AppRun|Exec=${_pkgname}|" wootility.desktop
	# .AppImage permissions are 700 for all directories
	chmod -R 755 usr
	chmod -x usr/share/icons/hicolor/*x*/apps/*
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
