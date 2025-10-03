# Maintainer: Guilhem Saurel <guilhem.saurel@laas.fr>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Benjamin Chretien <chretien dot b +aur at gmail dot com>

pkgname=casadi
pkgver=3.7.2
pkgrel=1
pkgdesc="Symbolic framework for automatic differentiation and numeric optimization"
arch=('i686' 'x86_64')
url="https://github.com/${pkgname}/${pkgname}"
license=('LGPL-3.0-only')
depends=('python' 'gcc-fortran' 'lapack' 'tinyxml' 'tinyxml2' 'swig' 'ipython'
         'python-numpy' 'python-scipy' 'python-matplotlib' 'coin-or-ipopt' 'dsdp'
         'osqp' 'proxsuite' 'coin-or-qpoases')
makedepends=('cmake' 'eigen3' 'simde' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/${pkgver}.tar.gz" 4105.patch)
sha256sums=('5995d915ae97d3ef0f3f8e785797ba0131e1ceea14e1246a063dcf3c46b37b2c'
            '0bb00512f12a1226aa01aa967fe34b45d21a96bb893e6ab644c51df76ce5c65c')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/4105.patch"
  rm -f "cmake/FindEigen3.cmake"
}

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DFORTRAN_REQUIRED=ON \
        -DWITH_PYTHON=ON \
        -DWITH_PYTHON3=ON \
        -DINSTALL_INTERNAL_HEADERS=ON \
        -DENABLE_EXPORT_ALL=ON \
        -DWITH_OPENMP=ON \
        -DWITH_THREAD=ON \
        -DWITH_BUILD_REQUIRED=OFF \
        -DWITH_SUNDIALS=OFF \
        -DWITH_OSQP=ON \
        -DWITH_PROXQP=ON \
        -DWITH_BUILD_TINYXML=OFF \
        -DWITH_QPOASES=ON \
        -DWITH_LAPACK=ON \
        -DWITH_BUILD_LAPACK=OFF \
        -DWITH_IPOPT=ON \
        -DWITH_TINYXML=ON \
        -DWITH_BUILD_TINYXML=OFF \
        -DWITH_DSDP=ON \
        -DWITH_BUILD_DSDP=OFF \
        -Wno-dev
    cmake --build "build-$pkgver"
}

package() {
    DESTDIR="$pkgdir/" cmake --install "build-$pkgver"
    install -Dm644 "$pkgbase-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
