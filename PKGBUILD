# Maintainer: Guilhem Saurel <saurel@laas.fr>

_org='gepetto'
_pkgname='qgv'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=1.3.5
pkgrel=1
pkgdesc="Interactive Qt graphViz display "
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('LGPL-3.0-only')
depends=('qt5-base' 'gcc-libs' 'graphviz' 'glibc')
makedepends=('cmake' 'doxygen')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('90c63bf27c29e31e269ddf34a89ebbdb57fedf6a9a6f5070061ab7b22fe29062'
            'SKIP')
validpgpkeys=('9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28' 'A031AD35058955293D54DECEC45D22EF408328AD')

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build "build-$pkgver"
}

check() {
    cmake --build "build-$pkgver" -t test
}

package_qgv() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf "$pkgdir/usr/share/doc"
    install -Dm644 "$pkgbase-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

package_qgv-docs() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf "$pkgdir"/usr/{bin,etc,lib,include,share/{"$_pkgname",ament_index}}
    install -Dm644 "$pkgbase-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
