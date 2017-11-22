_basename='firefox-developer'
_locale='gu-IN'
_srcurl='https://download-installer.cdn.mozilla.net/pub/devedition/releases'
pkgname="${_basename}-${_locale,,}"
pkgdesc='Firefox Developer Edition is the blazing fast browser that offers cutting edge developer tools and latest features like CSS Grid support and framework debugging - Gujarati (India)'
url="https://www.mozilla.org/${_locale}/firefox/developer/"
pkgver='58.0b5'
pkgrel='1'
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
source=("${_basename}.desktop" 'vendor.js')
source_i686=("${pkgname}_${pkgver}_i686.tar.bz2::${_srcurl}/${pkgver}/linux-i686/${_locale}/firefox-${pkgver}.tar.bz2")
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.bz2::${_srcurl}/${pkgver}/linux-x86_64/${_locale}/firefox-${pkgver}.tar.bz2")
sha512sums=('c7335c878f1d41e0298cda7f0fb6bc9e508eef121c1195cdfa6b6582529539e077f306dfd116d51a3f797eba38c2bf0a6d9758998df59d7c4009fe17d143baca'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
sha512sums_i686=('09b6522f030e9b271bf599e2d1f56a93b6020faaa47bfc40585981ef8665906a98b5e2ff3eca4ba8d6afa4c51a25839c4de8db9062adb8d89698ae45efe2eeb8')
sha512sums_x86_64=('0589575cdc277e6c1197a1f617fd0927f65d01b0f4d0fb6a521d35e31158a8d4355441e5b7a673b1650c671458ae049be67d7ca8e2b776a4ab0fe1d01b5272d6')

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
