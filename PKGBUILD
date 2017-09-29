# Maintainer: Andrew Crerar <andrew at crerar dot io>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_name=firefox
_channel=developer
_srcurl="https://download-installer.cdn.mozilla.net/pub/devedition/releases"
_locale="en-US"
pkgname="${_name}-${_channel}"
pkgdesc='Standalone web browser from mozilla.org, developer build'
url='http://www.mozilla.org/firefox/developer'
pkgver=57.0b4
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
source=("${_name}-${_channel}.desktop" "vendor.js")
source_i686=("${_srcurl}/${pkgver}/linux-${CARCH}/${_locale}/${_name}-${pkgver}.tar.bz2")
source_x86_64=("${_srcurl}/${pkgver}/linux-${CARCH}/${_locale}/${_name}-${pkgver}.tar.bz2")
sha512sums=(
	'9075e0d67e4dc153dcf514f3aa2b2415ce8b39275eedbf02a3cd122949b95bf4af9dad358516145decf445d1a903d52a634f4eeeb44bb67864de02e646a76631'
	'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010'
)
sha512sums_i686=('db935918745a225db24499444723443437d1c68f17a83c7e524620328872f58d702ce6e16f7f0e641e7f67a53846804f5d49ba324ed66905ae4f019256225053')
sha512sums_x86_64=('039bbed397137d411448f4090ee7df8b32e119e844547d209105e3d30782c68ef4fc6ebff5d4747efb897dddf3d07d21201d42a6084821ccc82b98b3d6588cf1')

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
