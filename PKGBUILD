# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: GordonGR <ntheo1979@gmail.com>

_name=raptor2
pkgname=lib32-raptor
pkgver=2.0.16
pkgrel=1
pkgdesc="A C library that parses RDF/XML/N-Triples into RDF triples (32 bit)"
arch=(x86_64)
url="https://librdf.org/raptor"
license=(Apache GPL2 LGPL2.1)
depends=(lib32-glibc lib32-libxml2 lib32-libxslt lib32-xz lib32-zlib raptor)
makedepends=(gcc-multilib gtk-doc lib32-curl lib32-icu)
source=(https://librdf.org/dist/source/$_name-$pkgver.tar.gz{,.asc})
sha512sums=('9bd5cff36390e1e0ef15ac56e5413ecfceb4018cb531a4da8850d3623615f12a93690a78be61f9d9ae7a24e16f6446e356bc2b7f34051ddc077761d85a9b7c44'
            'SKIP')
b2sums=('1e5e5742ba4cdaacb98a9ba77a9352589df0da60869e7721ee140c81ed4886bf909b37b247bd925c82a4ac44b3c11a909c913f0851d49a1d9d91c9293189266d'
        'SKIP')
validpgpkeys=('F879F0DEDA780198DD08DC6443EC92504F71955A') # Dave Beckett <dave@dajobe.org>

prepare() {
    cd $_name-$pkgver

    autoreconf -fiv
}

build() {
    local configure_options=(
        --build=i686-pc-linux-gnu
        --prefix=/usr
        --libdir=/usr/lib32
        --disable-static
        --with-icu-config=/usr/bin/icu-config-32
    )

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    cd $_name-$pkgver

    ./configure "${configure_options[@]}"

    # prevent excessive overlinking due to libtool
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

check() {
    # run with one job as tests are otherwise flaky: https://github.com/dajobe/raptor/issues/49
    make check -C $_name-$pkgver -j1
}

package() {
#     make prefix="${pkgdir}"/usr libdir="${pkgdir}"/usr/lib32 install
    make DESTDIR="$pkgdir" install -C $_name-$pkgver

    rm -rf "${pkgdir}"/usr/{bin,include,share}
}
