# Maintainer: Güner Yildirim <liltoto -_AT_- g m a i l -_Dot_- com>
# Contributor: Original submitter John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_name=firefox
_channel=dev-da
_version='55.0b7'
_file="${_name}-${_version}"
_srcurl="https://download-installer.cdn.mozilla.net/pub/devedition/releases/${_version}/"
pkgname="${_name}-${_channel}"
pkgdesc='Standalone web browser from mozilla.org, developer build - Danish'
url='http://www.mozilla.org/firefox/developer'
pkgver=55.0b7.20170708
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla’s GnuPG release key

if [[ "$CARCH" == "i686" ]]; then
	source=("${_srcurl}linux-i686/da/${_file}.tar.bz2" "${_name}-${_channel}.desktop" "vendor.js")
	sha512sums=(
		'SKIP'
		'2ddb9dc05fae77c5a22adfc0f2366a7569ec5df26b507f0ee61c3ef33560bf1a7d77461626fffe29242f4da514df03704e4c8ae470dddb011b3415f50a33bc38'
		'44594e0cf71a259351a28933d89cecafc65e5967764133247f7a371e800e4e10a40131a627a740173ea0e980451cc4632676947d676cde8a836be45abcf861b7'
	)
elif [[ "$CARCH" == "x86_64" ]]; then
	source=("${_srcurl}linux-x86_64/da/${_file}.tar.bz2" "${_name}-${_channel}.desktop" "vendor.js")
	sha512sums=(
		'SKIP'
		'2ddb9dc05fae77c5a22adfc0f2366a7569ec5df26b507f0ee61c3ef33560bf1a7d77461626fffe29242f4da514df03704e4c8ae470dddb011b3415f50a33bc38'
		'44594e0cf71a259351a28933d89cecafc65e5967764133247f7a371e800e4e10a40131a627a740173ea0e980451cc4632676947d676cde8a836be45abcf861b7'
	)
fi

depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk3' 'sqlite3' 'dbus-glib')
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

