# Maintainer: Guilhem "Nim65s" Saurel <guilhem.saurel@laas.fr>

pkgorg='Simple-Robotics'
_pkgname='aligator'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver='0.4.0'
pkgrel=1
pkgdesc="A versatile and efficient framework for constrained trajectory optimization"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$pkgname"
license=('BSD')
depends=('boost-libs' 'eigenpy' 'pinocchio' 'proxsuite-nlp' 'crocoddyl')
optdepends=('doxygen')
makedepends=('cmake' 'eigen' 'fmt' 'boost' 'benchmark')
source=("pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$url/pull/103.patch"
)
sha256sums=('f5d3e3f97b76ff6f72c00c1b856970e2ebb2862fd2ccb48a51e8d890ac1fb0f8'
            'd440e3d8ae9aa4a0260677bfbc222caf633cb5fbaab8fa3d631a9d98a39edd4e')

prepare() {
    cd "$pkgbase-$pkgver"
    patch -p1 -i "$srcdir/103.patch"
}

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
