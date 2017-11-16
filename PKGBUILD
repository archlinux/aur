_basename='firefox-developer'
_locale='en-GB'
_srcurl='https://download-installer.cdn.mozilla.net/pub/devedition/releases'
pkgname="${_basename}-${_locale,,}"
pkgdesc='Firefox Developer Edition is the blazing fast browser that offers cutting edge developer tools and latest features like CSS Grid support and framework debugging - English (British)'
url="https://www.mozilla.org/${_locale}/firefox/developer/"
pkgver='58.0b4'
pkgrel='3'
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
source=("${_basename}.desktop" 'vendor.js')
source_i686=("${pkgname}_${pkgver}_i686.tar.bz2::${_srcurl}/${pkgver}/linux-i686/${_locale}/firefox-${pkgver}.tar.bz2")
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.bz2::${_srcurl}/${pkgver}/linux-x86_64/${_locale}/firefox-${pkgver}.tar.bz2")
sha512sums=('c7335c878f1d41e0298cda7f0fb6bc9e508eef121c1195cdfa6b6582529539e077f306dfd116d51a3f797eba38c2bf0a6d9758998df59d7c4009fe17d143baca'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
sha512sums_i686=('4c979a4b2c30079dc5262d5d4bd6fc55b9c368385849bb72e2bd197c9a6849d5c1db5e7f4e8a55dd9f38c383f90290a79d0cb53e3dd045380cd050a0408cbe63')
sha512sums_x86_64=('fa62a97849db379a5a50a4f196b070970257bdc348829b0c4e037a325c586019f8c0da0aa570cc0e3faa16804d71779dd3a875cf2d5e486cc8d9c321694a69ec')

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
