# Maintainer: Ben Grant <ben@190n.org>

_testvideo=Sparks-5994fps-AV1-10bit-1920x1080-film-grain-synthesis-2013kbps.obu
pkgname=dav1d-git-optimized
pkgver=r1556.05d05f9
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
        '0001-1112.patch'
        '0002-wiener_2.patch'
        '0003-wiener_3.patch'
        '0004-wiener_4.patch')
sha256sums=('SKIP'
            'e56e20de5bfad7ec073d3e53ea6c760d0b11ed143f087b1bc32230e4840fea87'
            '421c4732d3a3fc85428263f4e4419f7b3bfc7059a29c2b81055a6ebf4345d0eb'
            '32385f2316886cef326e7887a3de96fdada2ee723b269908794ed770da460626'
            '1cf8db585f98ef8e63bb3f44f11679cdc554377f58964bebc7ca29aa1639d1ea'
            '5e46d8d6fcf2d2cdb062368b23af534ecf123321594f9d548a6f14d80d16d981')

pkgver () {
    cd dav1d
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
    cd dav1d
    # from https://code.videolan.org/videolan/dav1d/-/merge_requests/1112
    patch -Np1 -i ${srcdir}/0001-1112.patch
    patch -Np1 -i ${srcdir}/0002-wiener_2.patch
    patch -Np1 -i ${srcdir}/0003-wiener_3.patch
    patch -Np1 -i ${srcdir}/0004-wiener_4.patch
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
    ./build/tools/dav1d -i "$srcdir/$_testvideo" --muxer null --framethreads $(nproc) --tilethread 4
    meson configure build -Db_pgo=use
    ninja -C build
}

package () {
    cd dav1d
    DESTDIR="${pkgdir}" ninja -C build install
    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
