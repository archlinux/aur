# Maintainer: Max Roder <maxroder@web.de>

# To port this PKGBUILD to another language of tor-browser you 
# have to change $pkgname, $_language, $pkgdesc and $url in PKGBUILD
# AND (!) the first line in the .install file!

pkgname='tor-browser-en'
pkgver='3.5.2.1'
_realpkgver='3.5.2.1'
_realpkgver_i686='3.5.2.1'
_language='en-US'
pkgrel='1'
pkgdesc='Tor Browser Bundle: Anonymous browsing using firefox and tor'
url='https://www.torproject.org/projects/torbrowser.html.en'
arch=('x86_64' 'i686')
license=('GPL')
depends=()
optdepends=('zenity: simple dialog boxes'
			'kdebase-kdialog: KDE dialog boxes'
			'libnotify: Gnome dialog boxes')
install="${pkgname}.install"

# Workaround due to different versions depending on CARCH
if [[ "$CARCH" == 'i686' ]]; then
	_realpkgver=${_realpkgver_i686}
	_pkgarch='32'
else
	_pkgarch='64'
fi

source=("https://www.torproject.org/dist/torbrowser/${pkgver}/tor-browser-linux${_pkgarch}-${_realpkgver}_${_language}.tar.xz"
		"https://www.torproject.org/dist/torbrowser/${pkgver}/tor-browser-linux${_pkgarch}-${_realpkgver}_${_language}.tar.xz.asc"
		"${pkgname}.desktop"
		"${pkgname}.png"
		"${pkgname}.sh")

if [[ "$CARCH" == 'x86_64' ]]; then
	sha256sums=('853262207b9dbad6fecadc1e9d24df4e07d5fda0ef9e8cdca83be59a17d2206e'
				'238d08e090f4b8a7454f212fbc65c5e325ba31cbd3be7b50a368dc3ea382a206')
else
	sha256sums=('0b7fe384e06486528969897efecc30e1ffe994b1015fb5897101824b83fa9c26'
				'0d8a4abfcf65b2ac511a6398b2d0b6f22907215b23843fada1a61dbeaffd3fd7')
fi
sha256sums+=('3d5fc01f2cfbae0a00b7117b0b0a24028d1686e6f81a347809f74de2d8522ff7'
			'17fc2f5784d080233aca16e788d62ab6fe3e57cf781b123cfe32767de97d6d3b'
			'f25fedfa77b19a96488529e6d387411fb49a82e99e3a1a9708b88ad8b6e7d2aa')

noextract=("tor-browser-linux${_pkgarch}-${_realpkgver}_${_language}.tar.xz")

package() {
	cd "${srcdir}"

	sed -i "s/REPL_NAME/${pkgname}/g"			${pkgname}.sh
	sed -i "s/REPL_VERSION/${_realpkgver}/g"	${pkgname}.sh
	sed -i "s/REPL_LANGUAGE/${_language}/g"		${pkgname}.sh

	sed -i "s/REPL_NAME/${pkgname}/g"			${pkgname}.desktop
	sed -i "s/REPL_LANGUAGE/${_language}/g"		${pkgname}.desktop
	sed -i "s/REPL_COMMENT/${pkgdesc}/g"		${pkgname}.desktop

	install -Dm 644 ${pkgname}.desktop	${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -Dm 644 ${pkgname}.png		${pkgdir}/usr/share/pixmaps/${pkgname}.png
	install -Dm 755 ${pkgname}.sh		${pkgdir}/usr/bin/${pkgname}

	install -Dm 644 tor-browser-linux${_pkgarch}-${_realpkgver}_${_language}.tar.xz ${pkgdir}/opt/${pkgname}/tor-browser-linux${_pkgarch}-${_realpkgver}_${_language}.tar.xz
}

# vim:set ts=2 sw=2 et:
