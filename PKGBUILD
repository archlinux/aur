# Maintainer: Guilhem Saurel <gsaurel@laas.fr>

pkgorg='stack-of-tasks'
_pkgname='tsid'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=1.6.0
pkgrel=5
pkgdesc="Efficient Task Space Inverse Dynamics (TSID) based on Pinocchio"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$pkgname"
license=('BSD')
depends=('pinocchio' 'eiquadprog')
optdepends=('doxygen')
makedepends=('cmake' 'eigen')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig}
    $url/pull/144.patch)
sha256sums=('SKIP' 'SKIP' '00a94c78a44c985d8327813ca3bbf373d251445fe3a8ad35dc9dd02a1b4e48e5')
validpgpkeys=('9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28')

prepare() {
    cd "$pkgbase-$pkgver"
    patch -p1 -i $srcdir/144.patch
}

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
