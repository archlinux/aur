# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=serd
pkgname=lib32-serd
pkgver=0.30.0
pkgrel=1
pkgdesc="Lightweight C library for RDF syntax supporting reading/ writing Turtle and NTriples (32-bit)"
arch=('x86_64')
url="https://drobilla.net/software/serd/"
license=('custom:ISC')
depends=('lib32-glibc' 'serd')
makedepends=('python')
source=("https://download.drobilla.net/$_basename-$pkgver.tar.bz2"{,.sig})
sha512sums=('23ff30f2d3dd622bdd65deee36cb92ae5f4a0c539cf32a1bd9802f2d7cf4aa3e96f25d2fe579277d1ab943f6d25c0be68d7b4863f83d4733f489462620a4c1bb'
            'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3')

prepare() {
    cd "$_basename-$pkgver"

    # remove call to local ldconfig
    sed -i "/ldconfig/d" wscript
}

build() {
    cd "$_basename-$pkgver"

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    python waf configure --prefix=/usr \
                         --libdir=/usr/lib32 \
                         --test

    python waf build
}

check() {
    cd "$_basename-$pkgver"

    python waf test
}

package() {
    cd "$_basename-$pkgver"

    python waf install --destdir="$pkgdir"

    install -vDm 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd "$pkgdir/usr"

    rm -r bin include share/man
}
