# Maintainer: Ben Grant <ben@190n.org>
# Maintainer: Matej Dian <snoop05b@gmail.com>

_testvideo=Sparks-5994fps-AV1-10bit-1920x1080-film-grain-synthesis-2013kbps.obu
pkgname=dav1d-git-optimized
pkgver=r1627.f06148e
pkgrel=1
license=('BSD')
pkgdesc='AV1 cross-platform Decoder, focused on speed and correctness -- latest git version compiled with optimizations'
url='https://code.videolan.org/videolan/dav1d'
arch=('x86_64')
provides=('dav1d' 'libdav1d.so')
conflicts=('dav1d' 'dav1d-git')
makedepends=('meson' 'git' 'nasm')
source=('git+https://code.videolan.org/videolan/dav1d.git'
        "http://download.opencontent.netflix.com.s3.amazonaws.com/AV1/Sparks/$_testvideo"
        '0001-1112.patch')
sha256sums=('SKIP'
            'e56e20de5bfad7ec073d3e53ea6c760d0b11ed143f087b1bc32230e4840fea87'
            'SKIP')

pkgver () {
    cd dav1d
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
    cd dav1d
    patch -Np1 -i ${srcdir}/0001-1112.patch
}

build () {
    cd dav1d
    export CC=gcc
    arch-meson build \
      -Denable_tests=false \
      -Dc_args="-march=native -O3 -fuse-ld=bfd" \
      -Db_lto=false \
      -Db_pgo=generate
    ninja -C build
    LD_PRELOAD=./build/src/libdav1d.so ./build/tools/dav1d -i "$srcdir/$_testvideo" --muxer null --framethreads $(nproc) --tilethreads 4 --pfthreads $(nproc)
    meson configure build -Db_pgo=use
    ninja -C build
}

package () {
    cd dav1d
    DESTDIR="${pkgdir}" ninja -C build install
    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
