_basename='firefox-developer'
_locale='el'
_srcurl='https://download-installer.cdn.mozilla.net/pub/devedition/releases'
pkgname="${_basename}-${_locale,,}"
pkgdesc='Firefox Developer Edition is the blazing fast browser that offers cutting edge developer tools and latest features like CSS Grid support and framework debugging - Greek'
url="https://www.mozilla.org/${_locale}/firefox/developer/"
pkgver='58.0b4'
pkgrel='2'
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
source=("${_basename}.desktop" 'vendor.js')
source_i686=("${pkgname}_${pkgver}_i686.tar.bz2::${_srcurl}/${pkgver}/linux-i686/${_locale}/firefox-${pkgver}.tar.bz2")
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.bz2::${_srcurl}/${pkgver}/linux-x86_64/${_locale}/firefox-${pkgver}.tar.bz2")
sha512sums=('9075e0d67e4dc153dcf514f3aa2b2415ce8b39275eedbf02a3cd122949b95bf4af9dad358516145decf445d1a903d52a634f4eeeb44bb67864de02e646a76631'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
sha512sums_i686=('ece95673cf8ac77e8d062934c7e01b09f60b0a4101e88c6cd777f402e95f2b6847038fd92ec76b79f0ff42c1da3657c594b94d6346afc6f8957ff63a2ea0ac66')
sha512sums_x86_64=('28108b7016701976c5a4fb7a907874664b0de36e7b2c4b4a2d28294c5f24f1ac63815034488668e8ae452ae6928f78fc0829f0f59acc74926f2d54b3d5eeee3e')

provides=("${_basename}")
conflicts=("${_basename}")

depends=('dbus-glib'
         'gtk2'
         'gtk3'
         'libxt'
         'nss')

optdepends=(
	'pulseaudio: audio/video playback'
	'ffmpeg: h.264 video'
	'hunspell: spell checking'
	'hyphen: hyphenation'
)

package() {
	OPT_PATH="opt/${_basename}"
	install -d "$pkgdir"/{usr/{bin,share/{applications,pixmaps}},opt}
	cp -r firefox "$pkgdir/${OPT_PATH}"

	ln -s "/${OPT_PATH}/firefox" "$pkgdir/usr/bin/${_basename}"
	# Icon Stuff
	SRC_LOC="${srcdir}/firefox/browser"
	DEST_LOC="${pkgdir}/usr/share/icons/hicolor"
	for i in 16 32 48
	do
		install -Dm644 "${SRC_LOC}"/chrome/icons/default/default${i}.png "${DEST_LOC}/${i}x${i}/apps/${_basename}.png"
	done
	install -m644 "$srcdir/firefox/browser/icons/mozicon128.png" "$pkgdir/usr/share/pixmaps/${_basename}-icon.png"

	install -m644 "$srcdir/${_basename}.desktop" "$pkgdir/usr/share/applications/"
	install -Dm644 "$srcdir/vendor.js" "$pkgdir/opt/${_basename}/browser/defaults/preferences/vendor.js"
	# Use system-provided dictionaries
	rm -rf "${pkgdir}/${OPT_PATH}/"{dictionaries,hyphenation}
	ln -sf /usr/share/hunspell "${pkgdir}/${OPT_PATH}/dictionaries"
	ln -sf /usr/share/hyphen "${pkgdir}/${OPT_PATH}/hyphenation"
}
