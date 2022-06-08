# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=sord
pkgname=lib32-sord
pkgver=0.16.10
pkgrel=1
pkgdesc="A lightweight C library for storing RDF data in memory (32-bit)"
arch=(x86_64)
url="https://drobilla.net/software/sord/"
license=(custom:ISC)
depends=(lib32-glibc lib32-serd sord)
makedepends=(lib32-gcc-libs waf)
source=(https://download.drobilla.net/$_basename-$pkgver.tar.bz2{,.sig})
sha512sums=('715201eaf4a13a3635337cf8fa7c1a1f229f1d589f70cdf8f67183d90df29cd8b4af180650ce9cd0c651c712d11901bfdc6b51f9b8d7c6e70d8d8f30b1861281'
            'SKIP')
b2sums=('6737d3495846529e6e4d14cbb2ac47ce4e67d04298381a119ba0107144deb56a53de9aa363397c2e302535f998c7c3ad44d340f52f70ac341ad6b635db608cb6'
        'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3') # David Robillard <d@drobilla.net>

prepare() {
    cd $_basename-$pkgver

    # remove local call to ldconfig
    sed -i "/ldconfig/d" wscript

    # let wscript(s) find the custom waf scripts
    mkdir -pv tools
    touch __init__.py
    touch tools/__init__.py
    cp -v waflib/extras/{autoship,autowaf,lv2}.py tools/
    mkdir -pv plugins/tools/
    cp -v waflib/extras/{autoship,autowaf,lv2}.py plugins/tools/
    rm -rv waflib
    sed -e 's/waflib.extras/tools/g' \
        -e "s/load('autowaf'/load('autowaf', tooldir='tools'/g" \
        -e "s/load('lv2'/load('lv2', tooldir='tools'/g" \
        -i wscript
}

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    export LINKFLAGS="$LDFLAGS"

    cd $_basename-$pkgver

    waf configure --prefix=/usr \
                  --libdir=/usr/lib32 \
                  --test

    waf build
}

check() {
    cd $_basename-$pkgver

    waf test
}

package() {
    cd $_basename-$pkgver

    waf install --destdir="$pkgdir"

    install -vDm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"

    cd "$pkgdir/usr"

    rm -r bin include share/man
}
