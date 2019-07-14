# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=libopenmpt-svn
_srcname=OpenMPT
pkgver=0.5.r11775
pkgrel=1
pkgdesc='Library to decode tracked music files (modules) into a raw PCM audio stream and CLI player (svn version)'
arch=('x86_64')
url='https://lib.openmpt.org/libopenmpt/'
license=('BSD')
depends=('zlib' 'libogg' 'libvorbis' 'mpg123' 'pulseaudio' 'sdl' 'portaudio' 'flac' 'libsndfile')
makedepends=('subversion' 'doxygen' 'help2man')
provides=('openmpt123' 'openmpt123-svn' 'openmpt123-minimal' 'libopenmpt')
conflicts=('openmpt123' 'openmpt123-svn' 'openmpt123-minimal' 'libopenmpt')
source=('svn+https://source.openmpt.org/svn/openmpt/trunk/OpenMPT/')
sha256sums=('SKIP')

pkgver() {
    cd "$_srcname"
    
    # subversion
    printf '%s.%s.%s' \
        "$(grep 'OPENMPT_API_VERSION_MAJOR [0-9]*' ./libopenmpt/libopenmpt_version.h | sed 's/[^0-9]*//')" \
        "$(grep 'OPENMPT_API_VERSION_MINOR [0-9]*' ./libopenmpt/libopenmpt_version.h | sed 's/[^0-9]*//')" \
        "$(printf 'r%s' "$(svnversion | tr -d 'A-z')")"
}

build() {
    cd "$_srcname"
    
    make \
        CONFIG='gcc' \
        PREFIX='/usr' \
        STATIC_LIB='0' \
        OPTIMIZE='1' \
        EXAMPLES='0' \
        TEST='1' \
        NO_LTDL='0' \
        NO_DL='1' \
        NO_ZLIB='0' \
        NO_MPG123='0' \
        NO_OGG='0' \
        NO_VORBIS='0' \
        NO_VORBISFILE='0' \
        NO_PULSEAUDIO='0' \
        NO_SDL='0' \
        NO_SDL2='0' \
        NO_PORTAUDIO='0' \
        NO_PORTAUDIOCPP='0' \
        NO_FLAC='0' \
        NO_SNDFILE='0' \
        all
}

check() {
    cd "$_srcname"
    
    make test
}

package() {
    cd "$_srcname"
    
    make TEST='0' PREFIX='/usr' DESTDIR="$pkgdir" install
        
    make PREFIX='/usr' DESTDIR="$pkgdir" install-doc
        
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
