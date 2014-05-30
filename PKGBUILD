# Maintainer: Max Roder <maxroder@web.de>

# To port this PKGBUILD to another language of tor-browser you 
# have to change $pkgname, $_language, $pkgdesc and $url in PKGBUILD
# AND (!) the first line in the .install file!

pkgname='tor-browser-en'
pkgver='3.6.1'
_realpkgver='3.6.1'
_realpkgver_i686='3.6.1'
_language='en-US'
pkgrel=2
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
   sha256sums=('637fd7849dcc509e21236876d190f7d2ce8686ca1cc5cabee8af1ff649a1c190'
               '6b7e2734e08afea6d45891c05fcc53e67dea889fc21dfb13a63ce3cb6a23853e')
else
   sha256sums=('1ac3234dc2c70a411e63d5cf2c22301c6166777da68e8c9d8c1a21451c0f6aa0'
               'b89d89749c71dbc1c762148b20edd6cbd0e77a7e20e948c5a742effd7059a5d3')
fi
sha256sums+=('3d5fc01f2cfbae0a00b7117b0b0a24028d1686e6f81a347809f74de2d8522ff7'
			'17fc2f5784d080233aca16e788d62ab6fe3e57cf781b123cfe32767de97d6d3b'
			'1c1fbfa21973a2991db8a58f718656fc835dda03257c951432500bbd5dd8d3f5')

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
