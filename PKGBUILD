# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='gepetto'
_pkgname='example-robot-data'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=4.0.7
pkgrel=1
pkgdesc="Set of robot URDFs for benchmarking and developed examples."
arch=('any')
url="https://github.com/$pkgorg/$pkgname"
license=('BSD')
depends=('pinocchio')
makedepends=('cmake')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('7d657b12fdeb3ed7130dc967ee9945b2699eed566834bed39127007bc6fc090e'
            'SKIP')
validpgpkeys=('9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28')

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build "build-$pkgver"
}

check() {
    rm -f "$pkgbase"
    ln -s "$pkgbase-$pkgver" "$pkgbase"
    cmake --build "build-$pkgver" -t test
}

package_example-robot-data() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/share/doc
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_example-robot-data-docs() {
    depends=()

    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/{lib,include,"share/$_pkgname"}
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
