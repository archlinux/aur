# Maintainer: Max Roder <maxroder@web.de>
# Contributor: vitamin1980 <vitamin.novgorod @ yandex.ru>

pkgname='tor-browser-ru'
pkgver='4.5.1'
_language='ru'
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
	_pkgarch='32'
else
	_pkgarch='64'
fi

source=("https://www.torproject.org/dist/torbrowser/${pkgver}/tor-browser-linux${_pkgarch}-${pkgver}_${_language}.tar.xz"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")

if [[ "$CARCH" == 'x86_64' ]]; then
   sha256sums=('18edd8fc59f4221aadeb3beb4964ca12788e76deea344056a480dcb6175e9e5b')
else
   sha256sums=('10ddf846984e80ec65a1bf29f480c3c82dc3ba23439d779619800101221a5de2')
fi
sha256sums+=('3d5fc01f2cfbae0a00b7117b0b0a24028d1686e6f81a347809f74de2d8522ff7'
             '17fc2f5784d080233aca16e788d62ab6fe3e57cf781b123cfe32767de97d6d3b'
             '1e5c48a957de2df3470c82873b59663fb2b682dfc38a53d508002e59f53effaa')

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
