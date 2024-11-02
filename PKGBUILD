# Maintainer: Guilhem Saurel <saurel@laas.fr>

_org='gepetto'
_pkgname=gepetto-viewer-corba
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=5.8.1
pkgrel=1
pkgdesc="Graphical Interface for Pinocchio and HPP."
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('BSD-2-Clause')
depends=('gepetto-viewer' 'omniorb' 'omniorbpy' 'python-yaml' 'python-numpy' 'python' 'glibc' 'qt5-base' 'gcc-libs')
makedepends=('cmake' 'boost' 'doxygen')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('308fc881740e8bfd363c1e162b4624f1859c289f7270721b5b908afcfd1eaf80'
            'SKIP')
validpgpkeys=('9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28')

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

package_gepetto-viewer-corba() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf "$pkgdir/usr/share/doc"
    install -Dm644 "$pkgbase-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_gepetto-viewer-corba-docs() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf "$pkgdir"/usr/{bin,etc,lib,include,share/{"$_pkgname",ament_index,idl}}
    install -Dm644 "$pkgbase-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
