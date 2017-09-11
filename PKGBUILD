_name=firefox
_channel=developer
_srcurl="https://download-installer.cdn.mozilla.net/pub/devedition/releases"
_locale="ja"
pkgname="${_name}-${_channel}-ja"
pkgdesc='Standalone web browser from mozilla.org, developer build - Japanese'
url="https://www.mozilla.org/${_locale}/firefox/developer/"
pkgver=56.0b10
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
source=("${_name}-${_channel}.desktop" "vendor.js")
source_i686=("${pkgname}_${pkgver}_i686.tar.bz2::${_srcurl}/${pkgver}/linux-i686/${_locale}/${_name}-${pkgver}.tar.bz2")
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.bz2::${_srcurl}/${pkgver}/linux-x86_64/${_locale}/${_name}-${pkgver}.tar.bz2")
sha512sums=('9075e0d67e4dc153dcf514f3aa2b2415ce8b39275eedbf02a3cd122949b95bf4af9dad358516145decf445d1a903d52a634f4eeeb44bb67864de02e646a76631'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
sha512sums_i686=('2a8e2a774ac1e9685f78cd79be751b4dfa775c8c41d117f346205c3e685b9d11d04d99f02663a0cfc2d87c978ea4dd175b0a91cf1537c9217afcad737ad7914c')
sha512sums_x86_64=('a6305e5c0f47b1ce48018d86ce4c2f5dbd50620888783e53f4b481f353058ef3c06fee7866b12937247120579c66389c9f2745985d4428cc03f6e8b5c708a79f')

provides=(firefox-developer)
conflicts=(firefox-developer)

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
	OPT_PATH="opt/${pkgname}"
	install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
	cp -r firefox $pkgdir/${OPT_PATH}

	ln -s /${OPT_PATH}/firefox $pkgdir/usr/bin/${_name}-${_channel}
	# Icon Stuff
	SRC_LOC="${srcdir}"/${_name}/browser
	DEST_LOC="${pkgdir}"/usr/share/icons/hicolor
	for i in 16 32 48
	do
		install -Dm644 "${SRC_LOC}"/chrome/icons/default/default${i}.png "${DEST_LOC}"/${i}x${i}/apps/${pkgname}.png
	done
	install -m644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/$pkgname-icon.png

	install -m644 $srcdir/${_name}-${_channel}.desktop $pkgdir/usr/share/applications/
	install -Dm644 $srcdir/vendor.js $pkgdir/opt/firefox-$_channel/browser/defaults/preferences/vendor.js
	# Use system-provided dictionaries
	rm -rf "${pkgdir}"/${OPT_PATH}/{dictionaries,hyphenation}
	ln -sf /usr/share/hunspell "${pkgdir}"/${OPT_PATH}/dictionaries
	ln -sf /usr/share/hyphen "${pkgdir}"/${OPT_PATH}/hyphenation
}
