# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libopenmpt-svn
pkgver=0.5.r12741
pkgrel=1
pkgdesc='Library to decode tracked music files (modules) into a raw PCM audio stream, with CLI player (svn version)'
arch=('x86_64')
url='https://lib.openmpt.org/libopenmpt/'
license=('BSD')
depends=('zlib' 'libogg' 'libvorbis' 'mpg123' 'pulseaudio' 'sdl2' 'portaudio' 'flac' 'libsndfile')
makedepends=('subversion' 'doxygen' 'help2man')
provides=('openmpt123' 'openmpt123-svn' 'openmpt123-minimal' 'libopenmpt')
conflicts=('openmpt123' 'openmpt123-svn' 'openmpt123-minimal' 'libopenmpt')
source=('svn+https://source.openmpt.org/svn/openmpt/trunk/OpenMPT/')
sha256sums=('SKIP')

pkgver() {
    printf '%s.%s.r%s' \
        "$(awk '/#define OPENMPT_API_VERSION_MAJOR/ { print $NF }' OpenMPT/libopenmpt/libopenmpt_version.h)" \
        "$(awk '/#define OPENMPT_API_VERSION_MINOR/ { print $NF }' OpenMPT/libopenmpt/libopenmpt_version.h)" \
        "$(svnversion OpenMPT | tr -d 'A-z')"
}

build() {
    make -C OpenMPT \
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
        NO_SDL2='0' \
        NO_PORTAUDIO='0' \
        NO_PORTAUDIOCPP='0' \
        NO_FLAC='0' \
        NO_SNDFILE='0' \
        all
}

check() {
    make -C OpenMPT test
}

package() {
    make -C OpenMPT TEST='0' PREFIX='/usr' DESTDIR="$pkgdir" install{,-doc}
    install -D -m644 OpenMPT/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
