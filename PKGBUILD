_name=firefox
_channel=developer
_srcurl="https://download-installer.cdn.mozilla.net/pub/devedition/releases"
_locale="ja"
pkgname="${_name}-${_channel}-${_locale,,}"
pkgdesc='Standalone web browser from mozilla.org, developer build - Japanese'
url="https://www.mozilla.org/${_locale}/firefox/developer/"
pkgver=56.0b11
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
source=("${_name}-${_channel}.desktop" "vendor.js")
source_i686=("${pkgname}_${pkgver}_i686.tar.bz2::${_srcurl}/${pkgver}/linux-i686/${_locale}/${_name}-${pkgver}.tar.bz2")
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.bz2::${_srcurl}/${pkgver}/linux-x86_64/${_locale}/${_name}-${pkgver}.tar.bz2")
sha512sums=('9075e0d67e4dc153dcf514f3aa2b2415ce8b39275eedbf02a3cd122949b95bf4af9dad358516145decf445d1a903d52a634f4eeeb44bb67864de02e646a76631'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
sha512sums_i686=('c1b6788956d234adc65cd094ca2201a5ba41f651b942a0291d0fddb74137453889634bb5d83de5975e9ca2a03176d6331fe991f4ed90c890c65411d3fc79588a')
sha512sums_x86_64=('3297697bb32e07954e1bfc49cc77242bb7aa916eb7bf5dfb86aff790c1ad4d1b105a14e01d04737ebde5d27fd5e7ef8af287f8211c43488a99ab651e9bc1eedb')

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
