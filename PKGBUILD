# Maintainer: Guilhem "Nim65s" Saurel <guilhem.saurel@laas.fr>

_org='Simple-Robotics'
_pkgname='aligator'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver='0.8.0'
pkgrel=1
pkgdesc="A versatile and efficient framework for constrained trajectory optimization"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$pkgname"
license=('BSD-2-Clause')
depends=('boost-libs' 'eigenpy' 'pinocchio' 'proxsuite-nlp' 'crocoddyl')
optdepends=('doxygen')
makedepends=('cmake' 'eigen' 'fmt' 'boost' 'benchmark')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e4e082bfef84094f06f77baf3bedb0edcf3efdea5cc62cdf7a26381e18a3cca6')

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_BUILD_TYPE=None \
        -DBUILD_BENCHMARKS=OFF \
        -DBUILD_CROCODDYL_COMPAT=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DGENERATE_PYTHON_STUBS=ON \
        -Wno-dev
    cmake --build "build-$pkgver"
}

check() {
    # test-cpp-gar-riccati fails
    cmake --build "build-$pkgver" -t test
}

package_aligator() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/share/doc
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_aligator-docs() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/{lib,include,bin,share/{"$_pkgname",ament,ament_index}}
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
