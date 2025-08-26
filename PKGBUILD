# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=lilv
pkgname=lib32-lilv
pkgver=0.24.26
pkgrel=1
pkgdesc="A C library interface to the LV2 plug-in standard (32-bit)"
arch=(x86_64)
url="https://drobilla.net/software/lilv.html"
license=(
    '0BSD OR ISC'
    ISC
)

depends=(
    lib32-glibc
    lib32-lv2
    lib32-serd
    lib32-sord
    lib32-sratom
    lib32-zix
    lilv
)
makedepends=(
    lib32-libsndfile
    meson
)
source=(https://download.drobilla.net/${_basename}-${pkgver}.tar.xz{,.sig})
sha512sums=('3d360d63391554f62d1dd44b9ba0fc28e4ccde9640da1e28ef3f127c23c9f03974b66c5bbb83f022f18810284a0e25060127d580ca2fad6213fe88920618c2ae'
            'SKIP')
b2sums=('23b7a029fd40099420e9e8de222b2534b124a93f899c03c5ada27673fc47431c95866d7d4bc5f34b80110b5142e6564e95390fd56d686ac9958ad8bf71ca6033'
        'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3') # David Robillard <d@drobilla.net>

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    arch-meson $_basename-$pkgver build \
        --libdir='/usr/lib32' \
        -Dbindings_py=disabled \
        -Ddocs=disabled \
        -Dtools=disabled

    meson compile -C build
}

check() {
    meson test -C build
}

package() {
    meson install -C build --destdir "$pkgdir"

    install -vDm 644 $_basename-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -vDm 644 $_basename-$pkgver/{NEWS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"

    cd "$pkgdir"

    rm -r usr/include
}
