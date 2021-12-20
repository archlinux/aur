# Maintainer: Guilhem Saurel <gsaurel@laas.fr>

pkgorg='stack-of-tasks'
_pkgname='tsid'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=1.6.1
pkgrel=4
pkgdesc="Efficient Task Space Inverse Dynamics (TSID) based on Pinocchio"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$pkgname"
license=('BSD')
depends=('pinocchio' 'eiquadprog')
optdepends=('doxygen')
makedepends=('cmake' 'eigen')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('SKIP' 'SKIP')
validpgpkeys=(
    '9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28'
    'A031AD35058955293D54DECEC45D22EF408328AD'
    'F182CC432A4752C7A3E4FE02001EB2069D785C81'
    )

build() {
    mkdir -p "$pkgbase-$pkgver/build"
    cd "$pkgbase-$pkgver/build"

    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib ..
    make
}

check() {
    cd "$pkgbase-$pkgver/build"
    make test
}

package_tsid() {
    cd "$pkgbase-$pkgver/build"
    make DESTDIR="$pkgdir/" install
    rm -rf $pkgdir/usr/share/doc
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_tsid-docs() {
    cd "$pkgbase-$pkgver/build"
    make DESTDIR="$pkgdir/" install
    rm -rf $pkgdir/usr/{lib,include,"share/$_pkgname"}
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
