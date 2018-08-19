# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=sord
pkgname=lib32-sord
pkgver=0.16.2
pkgrel=1
pkgdesc="A lightweight C library for storing RDF data in memory (32-bit)"
arch=('x86_64')
url="https://drobilla.net/software/sord/"
license=('custom:ISC')
depends=('lib32-serd' 'pcre' 'sord')
makedepends=('python2')
source=("https://download.drobilla.net/$_basename-$pkgver.tar.bz2"{,.sig})
sha512sums=('fe143c07ed18c15ffaf2461ca587df76e365a075f5d93f5eaa4c26196e0b1dd59d24d16e176de3664a2658377a2934083af5742c80884e8e7dd201dcaccb9698'
            'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3') # David Robillard

prepare() {
    cd "$_basename-$pkgver"

    # remove local call to ldconfig
    sed -i "/ldconfig/d" wscript
}

build() {
    cd "$_basename-$pkgver"

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    python2 waf configure --prefix=/usr \
                         --libdir=/usr/lib32 \
                         --test

    python2 waf build
}

check() {
    cd "$_basename-$pkgver"

    python2 waf test --verbose-tests
}

package() {
    cd "$_basename-$pkgver"

    python2 waf install --destdir="$pkgdir"

    install -vDm 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd "$pkgdir/usr"

    rm -r bin include share/man
}
