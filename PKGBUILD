# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev@orum.in>

_basename=libgme
pkgname="lib32-$_basename"
pkgver=0.6.2
pkgrel=1
pkgdesc="Video game music file emulation/playback library (32-bit)"
url="https://bitbucket.org/mpyne/game-music-emu"
license=('LGPL')
arch=('x86_64')
depends=('lib32-gcc-libs' 'libgme')
makedepends=('cmake')
source=("https://bitbucket.org/mpyne/game-music-emu/downloads/game-music-emu-$pkgver.tar.xz"{,.asc}
        "gcc10.patch")
sha256sums=('5046cb471d422dbe948b5f5dd4e5552aaef52a0899c4b2688e5a68a556af7342'
            'SKIP'
            'c9ec4863039c58f9a8db3c4105b76dd554e914dc74893df4bdca59c0a8cdb7a4')
validpgpkeys=(5406ECE83665DA9D201D35720BAF0C9C7B6AE9F2) # Michael Pyne <mpyne@kde.org>

prepare() {
    cd "game-music-emu-$pkgver"

    patch -p1 -i ../gcc10.patch
}

build() {
    cd "game-music-emu-$pkgver"

    mkdir build

    cd build

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "game-music-emu-$pkgver/build"

    make DESTDIR="$pkgdir" install

    cd "$pkgdir/usr"

    mv lib lib32
    rm -r include
}
