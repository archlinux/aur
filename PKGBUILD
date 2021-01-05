# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='gepetto'
_pkgname='example-robot-data'
pkgname=("${_pkgname}" "${_pkgname}-docs")
pkgver=3.7.0
pkgrel=3
pkgdesc="Set of robot URDFs for benchmarking and developed examples. "
arch=('any')
url="https://github.com/$pkgorg/$pkgname"
license=('BSD')
depends=('pinocchio')
makedepends=('cmake')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('SKIP' 'SKIP')
validpgpkeys=('9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28')

build() {
    mkdir -p "$pkgbase-$pkgver/build"
    cd "$pkgbase-$pkgver/build"

    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib ..
    make
}

check() {
    rm -f "$pkgbase"
    ln -s "$pkgbase-$pkgver" "$pkgbase"
    cd "$pkgbase-$pkgver/build"
    make test
}

package_example-robot-data() {
    cd "$pkgbase-$pkgver/build"
    make DESTDIR="$pkgdir/" install
    install -D -m755 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm -rf $pkgdir/usr/share/doc
}

package_example-robot-data-docs() {
    depends=()

    cd "$pkgbase-$pkgver/build"
    make DESTDIR="$pkgdir/" install
    install -D -m755 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm -rf $pkgdir/usr/{lib,include,"share/$_pkgname"}
}
