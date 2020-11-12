# Maintainer: Ben Grant <ben@190n.org>

pkgname=dav1d-git-optimized
pkgver=r1489.ffd052b
pkgrel=1
license=('BSD')
pkgdesc='AV1 cross-platform Decoder, focused on speed and correctness -- latest git version compiled with optimizations'
url='https://code.videolan.org/videolan/dav1d'
arch=('x86_64')
provides=('dav1d' 'libdav1d.so')
conflicts=('dav1d' 'dav1d-git')
makedepends=('meson' 'ninja' 'git' 'nasm')
source=('git+https://code.videolan.org/videolan/dav1d.git')
sha256sums=('SKIP')
options=(!buildflags)

pkgver () {
    cd dav1d
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    export CFLAGS="-flto -O3 -march=native"
    export CXXFLAGS="-flto -O3 -march=native"
    export LDFLAGS="-flto -O3 -march=native"
    cd dav1d
    arch-meson build --optimization=3 -Db_lto=true
    ninja -C build
}

package () {
    cd dav1d
    DESTDIR="${pkgdir}" ninja -C build install
    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
