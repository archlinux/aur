# Maintainer: Guilhem Saurel <guilhem.saurel@laas.fr>

_org='stack-of-tasks'
_pkgname='tsid'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=1.7.1
pkgrel=1
pkgdesc="Efficient Task Space Inverse Dynamics (TSID) based on Pinocchio"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('BSD')
depends=('pinocchio' 'eiquadprog')
optdepends=('doxygen')
makedepends=('cmake' 'eigen')
source=($url/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('142ebd28e6235c5811da6ac07ab30ff504a9572e225ba605dca475e4745a585d'
            'SKIP')
validpgpkeys=(
    '9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28'
    'A031AD35058955293D54DECEC45D22EF408328AD'
    'F182CC432A4752C7A3E4FE02001EB2069D785C81'
    )

build() {
    cmake -B "build-$pkgver" -S "$_pkgname-$pkgver" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build "build-$pkgver"
}

check() {
    cmake --build "build-$pkgver" -t test
}

package_tsid() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/share/doc
    install -Dm644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

package_tsid-docs() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/{lib,include,"share/$_pkgname"}
    install -Dm644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
