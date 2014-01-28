# Maintainer: Max Roder <maxroder@web.de>

# To port this PKGBUILD to another language of tor-browser you 
# have to change $pkgname, $_language, $pkgdesc and $url in PKGBUILD
# AND (!) the first line in the .install file!

pkgname='tor-browser-en'
pkgver='3.5'
_realpkgver='3.5'
_realpkgver_i686='3.5'
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

source=("https://archive.torproject.org/tor-package-archive/torbrowser/linux/tor-browser-linux${_pkgarch}-${_realpkgver}_${_language}.tar.xz"
		"https://archive.torproject.org/tor-package-archive/torbrowser/linux/tor-browser-linux${_pkgarch}-${_realpkgver}_${_language}.tar.xz.asc"
		"${pkgname}.desktop"
		"${pkgname}.png"
		"${pkgname}.sh")

if [[ "$CARCH" == 'x86_64' ]]; then
	sha256sums=('e448dc90365a88d73a6ff85347adbe763ef0f800d0cb2e7b7165d7f0646f7c41'
				'0bf8e62ec1cf782cefd9ae11616dce8788fe81f2b5bfea4050fe528f1e3d0d38')
else
	sha256sums=('b0b29b4e75cd4a1aaecf7f4716216edcfc5947516744e2eaeae38bec1d03cea1'
				'17fb2ade63a0bd66a4c0068f8a9b45f5292a4aebbd77b4ffcf3a7f40c9c18156')
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
