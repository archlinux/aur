# Maintainer: Guilhem Saurel <gsaurel@laas.fr>

pkgorg='stack-of-tasks'
_pkgname='tsid'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=1.6.1
pkgrel=5
pkgdesc="Efficient Task Space Inverse Dynamics (TSID) based on Pinocchio"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$pkgname"
license=('BSD')
depends=('pinocchio' 'eiquadprog')
optdepends=('doxygen')
makedepends=('cmake' 'eigen')
source=($url/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('59950ff019d96575b8a4229355b81fab0488306d04ae953805128a4759119067'
            'SKIP')
validpgpkeys=(
    '9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28'
    'A031AD35058955293D54DECEC45D22EF408328AD'
    'F182CC432A4752C7A3E4FE02001EB2069D785C81'
    )

build() {
    cmake -B "build-$pkgver" -S "$_pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build "build-$pkgver"
}

check() {
    cmake --build "build-$pkgver" -t test
}

package_tsid() {
    DESTDIR="$pkgdir/" cmake --install "build-$pkgver"

    # remove docs
    rm -rf $pkgdir/usr/share/doc

    # install licence
    install -Dm644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

package_tsid-docs() {
    DESTDIR="$pkgdir/" cmake --install "build-$pkgver"

    # keep only docs
    rm -rf $pkgdir/usr/{lib,include,"share/$_pkgname"}

    # install licence
    install -Dm644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
