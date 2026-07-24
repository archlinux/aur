# Maintainer: Guilhem Saurel <saurel@laas.fr>

_org='gepetto'
_pkgname='example-robot-data'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=5.0.0
pkgrel=1
pkgdesc="Set of robot URDFs for benchmarking and developed examples."
arch=('any')
url="https://github.com/$_org/$_pkgname"
license=('BSD-2-Clause')
depends=('pinocchio')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('961db1b713173aad39335d5ad99804da0e394d23eac2a8e101d6295152b1088c')

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build "build-$pkgver"
}

check() {
    rm -f "$pkgbase"
    ln -s "$pkgbase-$pkgver" "$pkgbase"
    cmake --build "build-$pkgver" -t test
}

package_example-robot-data() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf "$pkgdir/usr/share/doc"
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_example-robot-data-docs() {
    depends=()

    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/{lib,include,share/ament_index,"share/$_pkgname"}
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
