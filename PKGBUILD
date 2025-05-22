# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>

pkgname=musicbee
_pkgver_major=3
_pkgver_minor=6
_pkgver_build=9202
pkgver=${_pkgver_major}.${_pkgver_minor}.${_pkgver_build}
pkgrel=2
pkgdesc="Advanced, feature-rich freeware audio player (uses Wine)"
arch=(x86_64)
url=https://getmusicbee.com
license=(custom)
depends=(wine
		winetricks
		lib32-libpulse
		wine-mono
		bash)
makedepends=(p7zip)
DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from here: https://www.getmusicbee.com/downloads/ or https://www.majorgeeks.com/files/details/musicbee_portable.html')
source=("manual://MusicBeePortable_${_pkgver_major}_${_pkgver_minor}.zip"
		"${pkgname}.desktop"
		"${pkgname}.sh"
		"https://www.un4seen.com/files/z/2/bass_aac24.zip") #M4A/AAC Support
sha256sums=('aff35dc919b4a620847ca0c5269d1d75e93bf96bcabcbbdc0d058ce3e1d82c5d'
            '42e9670e70a37837a026df7d1f3aa89b5247a09927a15204f8dcc95a551b5fab'
            '28b4fcee5f7e88dfa8a8b3846a085167d475bd7c7da4680a8009da792addffd5'
            '782ec4f3758fc715d29ceab332103266df4000dd413a477901dccb8c9bac2090')

package() {
	install -d -m755 ${pkgdir}/usr/share/$pkgname

	cd ${srcdir}
	7z x MusicBeePortable_${_pkgver_major}_${_pkgver_minor}.exe -o$pkgname -y

	rm -r $pkgname/*PLUGINSDIR

	cp -ra "$srcdir/$pkgname/"* "${pkgdir}/usr/share/${pkgname}"
	cp -ra "$srcdir/bass_aac.dll" "${pkgdir}/usr/share/${pkgname}/"

	find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod 644 "{}" \;
	find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod 755 "{}" \;
	
	install -Dm644 ${pkgdir}/usr/share/$pkgname/License.rtf ${pkgdir}/usr/share/licenses/$pkgname/License.rtf
	rm ${pkgdir}/usr/share/$pkgname/License.rtf

	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	install -Dm644 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	chmod +x "${pkgdir}/usr/bin/${pkgname}"
}
