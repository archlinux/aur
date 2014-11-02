# Maintainer: Max Roder <maxroder@web.de>

# To port this PKGBUILD to another language of tor-browser you 
# have to change $pkgname, $_language, $pkgdesc and $url in PKGBUILD
# AND (!) the first line in the .install file!

pkgname='tor-browser-en'
pkgver='4.0.1'
_realpkgver='4.0.1'
_realpkgver_i686='4.0.1'
_language='en-US'
pkgrel=1
pkgdesc='Tor Browser Bundle: Anonymous browsing using firefox and tor'
url='https://www.torproject.org/projects/torbrowser.html.en'
arch=('x86_64' 'i686')
license=('GPL')
depends=('gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'desktop-file-utils' 'hicolor-icon-theme'
         'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite')
optdepends=('zenity: simple dialog boxes'
			'kdebase-kdialog: KDE dialog boxes'
            'gst-plugins-good: h.264 video'
            'gst-libav: h.264 video'
            'libpulse: PulseAudio audio driver'
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
   sha256sums=('53f97d10d5cd17695e84a5eba52fa099f6151e21d409a58feee83327cf33e3b3'
               '85ae30a24e5ddb765abc012388e59082a41802daa63dfb3dcaa70898e0988da9')
else
   sha256sums=('83a2de8e638f5e4dcda84ce7b664f46394669ee45157f85127ed4f9d4050be8c'
               '38a910fa97ce1508fb6bea7c25e9c9b50c646c952cb19c35a84a6f83bf1d27e4')
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
