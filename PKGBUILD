# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=libopenmpt-svn
pkgver=0.2.r6635
pkgrel=1
pkgdesc="Library to decode tracked music files (modules) into a raw PCM audio stream and CLI player"
arch=('i686' 'x86_64')
url="https://lib.openmpt.org/libopenmpt/"
license=('BSD')
depends=('zlib' 'libogg' 'libvorbis' 'mpg123' 'pulseaudio' 'sdl' 'portaudio' 'flac' 'libsndfile')
makedepends=('svn' 'doxygen' 'help2man')
provides=('openmpt123' 'openmpt123-svn' 'openmpt123-minimal' 'libopenmpt' 'libopenmpt.so')
conflicts=('openmpt123' 'openmpt123-svn' 'openmpt123-minimal' 'libopenmpt' 'libopenmpt.so')
source=("$pkgname"::'svn+https://source.openmpt.org/svn/openmpt/trunk/OpenMPT/')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	
	# Subversion
	
	printf "%s.%s" \
	    "$(grep "OPENMPT123_VERSION_STRING" ./openmpt123/openmpt123_config.hpp | sed -r 's/[^0-9\.]*//g;s/.{3}//')" \
	    "$(printf "r%s" "$(svnversion | tr -d 'A-z')")"
}

build() {
	cd "${srcdir}/${pkgname}"
	
	make CONFIG=gcc \
	     PREFIX=/usr \
	     STATIC_LIB=0 \
	     OPTIMIZE=1 \
	     EXAMPLES=0 \
	     TEST=0 \
	     NO_LTDL=0 \
	     NO_DL=1 \
	     NO_ZLIB=0 \
	     NO_MPG123=0 \
	     NO_OGG=0 \
	     NO_VORBIS=0 \
	     NO_VORBISFILE=0 \
	     NO_PULSEAUDIO=0 \
	     NO_SDL=0 \
	     NO_SDL2=0 \
	     NO_PORTAUDIO=0 \
	     NO_PORTAUDIOCPP=0 \
	     NO_FLAC=0 \
	     NO_SNDFILE=0 \
	     all
}

package() {
	cd "${srcdir}/${pkgname}"
	
	make TEST=0 \
	     PREFIX=/usr \
	     DESTDIR="$pkgdir/" \
	     install
	
	make PREFIX=/usr \
	     DESTDIR="$pkgdir/" \
	     install-doc
	
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
