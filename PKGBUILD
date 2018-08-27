# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=sratom
pkgname=lib32-sratom
pkgver=0.6.2
pkgrel=2
pkgdesc="An LV2 Atom RDF serialisation library (32-bit)"
arch=('x86_64')
url="https://drobilla.net/software/sratom/"
license=('custom:ISC')
depends=('lib32-lv2' 'lib32-sord' 'sratom')
makedepends=('lv2' 'python2')
source=("https://download.drobilla.net/$_basename-$pkgver.tar.bz2"{,.sig})
sha512sums=('356e1dfde07fcc3eff99186ff79501557572f5d73338fd096bf639a82d1d4fe3c0e790627c8eb088053e4a2aeed4e548aca0a5572d1ab26316cfdb13374f10ac'
            'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3')

prepare() {
    cd "$_basename-$pkgver"

    # remove local ldconfig call
    sed -i '/ldconfig/d' wscript
}

build() {
    cd "$_basename-$pkgver"

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    python2 waf configure --prefix=/usr \
                         --libdir=/usr/lib32 \
                         --test

    python2 waf -v build
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

    rm -r include
}
