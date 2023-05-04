# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev@orum.in>

_basename=wildmidi
pkgname=lib32-wildmidi
pkgver=0.4.5
pkgrel=1
pkgdesc='Open Source MIDI Synthesizer (32-bit)'
arch=('x86_64')
url="http://www.mindwerks.net/projects/wildmidi/"
license=('LGPL3')
depends=('lib32-alsa-lib' 'wildmidi')
makedepends=('cmake')
source=(https://github.com/psi29a/wildmidi/archive/wildmidi-${pkgver}.tar.gz)
sha256sums=('116c0f31d349eaa74a630ed5a9a17b6a351204877a4ed9fb9aacd9dbd7f6c874')

prepare() {
    cd "$_basename-$_basename-$pkgver/src"

    sed -i -e 's|IF (CMAKE_LIBRARY_ARCHITECTURE)|IF (false)|' CMakeLists.txt
}

build() {
    export CC='gcc -m32'
    export CXX='c++ -m32'
    export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

    cmake -B build -S "$_basename-$_basename-$pkgver" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib32

    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build

    cd "$pkgdir"/usr

    mv bin/wildmidi bin/wildmidi32
    rm -r share include

    ln -s wildmidi.pc "$pkgdir/usr/lib32/pkgconfig/WildMIDI.pc"
}
