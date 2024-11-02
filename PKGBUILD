# Maintainer: Guilhem Saurel <saurel@laas.fr>

_org='gepetto'
_pkgname='gepetto-viewer'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=5.2.0
pkgrel=1
pkgdesc="Graphical Interface for Pinocchio and HPP."
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('BSD-2-Clause')
depends=('openscenegraph' 'osgqt' 'pythonqt' 'boost-libs' 'glibc' 'qgv' 'qt5-base' 'gcc-libs' 'python' 'pythonqt')
makedepends=('cmake' 'doxygen' 'urdfdom' 'boost')
optdepends=('openscenegraph-dae: load DAE files')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('136e8b65e467aa3b822a0d20afc43972524bb910106470707e1a544ee11c1511'
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

package_gepetto-viewer() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf "$pkgdir/usr/share/doc"
    mv "$pkgdir/usr/etc" "$pkgdir/etc"
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_gepetto-viewer-docs() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf "$pkgdir"/usr/{bin,etc,lib,include,share/{"$_pkgname",ament_index}}
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
