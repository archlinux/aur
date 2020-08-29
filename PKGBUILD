# Maintainer: jdn06 <jdn06.jdn06@outlook.fr>
pkgname=aqualung-git
_pkgname=aqualung
pkgver=1.1
pkgrel=1
pkgdesc="High quality music player w/ gapless support"
arch=('i686' 'x86_64')
url="http://aqualung.jeremyevans.net/"
license=('GPL')

# You chan change depencies if you modify consequently flags of ./configure below
# Refer to http://aqualung.jeremyevans.net/compiling/
depends=('gtk2' 'libxml2' 'lua52' 'libpulse' 'jack' 'lame' 'speex' 'wavpack' 'liboggz' 'libcdio-paranoia' 'libmpcdec' 'libmad' 'libmodplug')
makedepends=('git')

optdepends=('liblrdf: LADSPA filters'
    'libcddb: CDDB / FreeDB support'
    'libsamplerate: high quality Sample Rate Conversion'
    "libifp: iRiver's iFP support"
    "libsndfile: Uncompressed audio decode & WAV output"
    "flac: FLAC support (play & encode)"
    "libvorbis: Vorbis support (play & encode)"
    "wavpack: WavPpack support (playback)"
    "sndio: outputs via sndio"
)
provides=(aqualung)
conflicts=(aqualung)

source=("$_pkgname"::"git://github.com/jeremyevans/$_pkgname.git"
	"${_pkgname}.desktop")
sha256sums=('SKIP'
	'4d2aba2924b7c0bacbd377a6975f1cdbf09dc67a5d61c36bf2d52bddbab1b3b9')

install="${_pkgname}.install"

pkgver() {
	cd "$_pkgname"
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	# Enlarge MAX_SAMPLERATE
	sed -i 's/MAX_SAMPLERATE 96000/MAX_SAMPLERATE 192000/g' src/core.h
	sh autogen.sh
	./configure --prefix=/usr --without-mac --without-lavc --without-ladspa
	make
}

check() {
	cd "$_pkgname"
	make -k check
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm644 "src/img/icon_16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${_pkgname}.png"
	install -Dm644 "src/img/icon_24.png" "${pkgdir}/usr/share/icons/hicolor/24x24/apps/${_pkgname}.png"
	install -Dm644 "src/img/icon_32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
	install -Dm644 "src/img/icon_48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${_pkgname}.png"
	install -Dm644 "src/img/icon_64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_pkgname}.png"
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

