# Maintainer: Max Roder <maxroder@web.de>
# Contributor (French Version): Pierre Schiltz <mysti57155@gmail.com>
# Maintainer (French Version) : Anthony Caccia <acaccia@ulb.ac.be>

pkgname='tor-browser-fr'
pkgver='4.5.3'
_language='fr'
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

validpgpkeys=('EF6E286DDA85EA2A4BA7DE684E2C6E8793298290')

# Workaround due to different versions depending on CARCH
if [[ "$CARCH" == 'i686' ]]; then
	_pkgarch='32'
else
	_pkgarch='64'
fi

source=("https://www.torproject.org/dist/torbrowser/${pkgver}/tor-browser-linux${_pkgarch}-${pkgver}_${_language}.tar.xz"
        "https://www.torproject.org/dist/torbrowser/${pkgver}/tor-browser-linux${_pkgarch}-${pkgver}_${_language}.tar.xz.asc"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")

if [[ "$CARCH" == 'i686' ]]; then
sha256sums=('dcb98570ac927298a086771524b283ee4f64268b72d0b5ec36268817073612aa'
            '5d75c3684335a421583cec33b7e69388b5672f48c5de7f4d1ffd86c095d622ef')
else
sha256sums=('32dcc17ba6fc55d06710178cf88b2d0b5986fdd7c80dab339631d8bdcd2a6f0d'
            '67dd30bb15aed572301f42b93ae7d08af2c80c8c631b1b2c2641b1a014530e8b')
fi
sha256sums+=('2217f011197329019ae3d282d95623e0230f8f7a3a604290744280530cf1698a'
			       '17fc2f5784d080233aca16e788d62ab6fe3e57cf781b123cfe32767de97d6d3b'
			       'ce09d8c6d8ea6427c583c72faf26d62ecd7245832658c75c10c3a1bdff7a772a')

noextract=("tor-browser-linux${_pkgarch}-${pkgver}_${_language}.tar.xz")

package() {
	cd "${srcdir}"

	sed -i "s/REPL_NAME/${pkgname}/g"			${pkgname}.sh
	sed -i "s/REPL_VERSION/${pkgver}/g"	${pkgname}.sh
	sed -i "s/REPL_LANGUAGE/${_language}/g"		${pkgname}.sh

	sed -i "s/REPL_NAME/${pkgname}/g"			${pkgname}.desktop
	sed -i "s/REPL_LANGUAGE/${_language}/g"		${pkgname}.desktop
	sed -i "s/REPL_COMMENT/${pkgdesc}/g"		${pkgname}.desktop

	install -Dm 644 ${pkgname}.desktop	${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -Dm 644 ${pkgname}.png		${pkgdir}/usr/share/pixmaps/${pkgname}.png
	install -Dm 755 ${pkgname}.sh		${pkgdir}/usr/bin/${pkgname}

	install -Dm 644 tor-browser-linux${_pkgarch}-${pkgver}_${_language}.tar.xz ${pkgdir}/opt/${pkgname}/tor-browser-linux${_pkgarch}-${pkgver}_${_language}.tar.xz
}
