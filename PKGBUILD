# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Carter <alt.mcarter@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=neoleo
pkgver=16.0
pkgrel=1
pkgdesc="Lightweight curses spreadsheet based on GNU oleo"
arch=('x86_64')
url="https://github.com/blippy/neoleo"
license=('GPL-2.0-or-later')
depends=('ncurses' 'tcl')
makedepends=('cmake' 'swig')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a5467433f048e9d54cacdf8c44a33f9a75570a280616500415dee3979e10eba1')

build() {
    local cmake_opts=(
        -B build
        -S "$pkgname-$pkgver"
        -Wno-dev
        -DCMAKE_INSTALL_PREFIX=/usr
        -DCMAKE_BUILD_TYPE=None
    )
    cmake "${cmake_opts[@]}"
    cmake --build build
}

check() {
    local ctest_opts=(
        --test-dir build
        --output-on-failure
        --parallel $(nproc)
    )
    ctest "${ctest_opts[@]}"
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    rm -rf "$pkgdir/usr/man/"
}
