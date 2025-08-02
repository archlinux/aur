# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev@orum.in>

_basename=wildmidi
pkgname=lib32-wildmidi
pkgver=0.4.6
pkgrel=1
pkgdesc='Simple software MIDI player which has a core softsynth library (32-bit)'
arch=(x86_64)
url='https://github.com/Mindwerks/wildmidi'
license=('GPL-3.0-or-later AND LGPL-3.0-or-later')
depends=(
    lib32-alsa-lib
    lib32-glibc
    wildmidi
)
makedepends=(
    cmake
    git
    ninja
)
source=("git+https://github.com/Mindwerks/wildmidi.git#tag=$_basename-$pkgver")
b2sums=(33100dfb9a7df1ee516083f90d7a2600e1c79117093dba568df540fd602da408cfe8373bea7363efbc893b1db943c681887e44b00f0861c1b29ac037d4b019f7)

build() {
    export CC='gcc -m32'
    export CXX='c++ -m32'
    export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

    cmake -S $_basename -B build -G Ninja \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_INSTALL_LIBDIR=lib32

    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    cd "$pkgdir"/usr

    mv bin/wildmidi bin/wildmidi32
    rm -r share include

    ln -s wildmidi.pc "$pkgdir/usr/lib32/pkgconfig/WildMIDI.pc"
}
