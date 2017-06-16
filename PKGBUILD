# Maintainer: Güner Yildirim <liltoto -_AT_- g m a i l -_Dot_- com>
# Contributor: Original submitter John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_name=firefox
_channel=dev-da
_version='55.0b2'
_file="${_name}-${_version}"
_srcurl="https://download-installer.cdn.mozilla.net/pub/devedition/releases/${_version}/"
pkgname="${_name}-${_channel}"
pkgdesc='Standalone web browser from mozilla.org, developer build - Danish'
url='http://www.mozilla.org/firefox/developer'
pkgver=55.0b2.20170616
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla’s GnuPG release key

if [[ "$CARCH" == "i686" ]]; then
	source=("${_srcurl}linux-i686/da/${_file}.tar.bz2" "${_name}-${_channel}.desktop" "vendor.js")
	sha512sums=(
		'SKIP'
		'c18e9941eaf869c05568477c24b44a6d11231fde046809baa07ce4e3d457427f9c702133c55961bd7b759b6ec019042d372ee235bea254e193beb1875276733a'
		'583fe266f5498bdedb5988848901624cf5990e0cc5426143121c8d0c7ad0438ed790b3396891659a3d1bb319114710892d656457bbed5b40a9503d6aad97eb0f'
	)
elif [[ "$CARCH" == "x86_64" ]]; then
	source=("${_srcurl}linux-x86_64/da/${_file}.tar.bz2" "${_name}-${_channel}.desktop" "vendor.js")
	sha512sums=(
		'SKIP'
		'bb7db547b9b211f1b30a9cb4b6f41ffcfa6250a2f1dd9e6c21b7c1401cd2ff1521f1a6136600c72bedc8411aebd1e230a56f6a104467ba20422bac18f8cb16d3'
		'583fe266f5498bdedb5988848901624cf5990e0cc5426143121c8d0c7ad0438ed790b3396891659a3d1bb319114710892d656457bbed5b40a9503d6aad97eb0f'
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

