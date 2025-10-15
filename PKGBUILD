# Maintainer: Guilhem Saurel <saurel@laas.fr>

_org='stack-of-tasks'
_pkgname=eigenpy
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=3.12.0
pkgrel=3
pkgdesc="Bindings between numpy and eigen using boost::python"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('BSD-2-Clause')
depends=('boost-libs' 'gcc-libs' 'glibc' 'python')
optdepends=('doxygen')
makedepends=('cmake' 'eigen3' 'jrl-cmakemodules' 'boost' 'python-numpy' 'python-scipy')
source=("${_pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8564b96c1f7d5a53d4330b0e9ecbf9e0815319bbe43cdf9e9488a4e9b9aa7ce6')

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DEigen3_ROOT=/opt/eigen3 \
        -Wno-dev
    # This require a lot of ram to build.
    cmake --build "build-$pkgver" -j 1
}

check() {
    cmake --build "build-$pkgver" -t test
}

package_eigenpy() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf "$pkgdir/usr/share/doc"
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_eigenpy-docs() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/{lib,include,bin,share/{"$_pkgname",ament,ament_index}}
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
