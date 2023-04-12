# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Benjamin Chretien <chretien dot b +aur at gmail dot com>

pkgname=casadi
pkgver=3.6.0
pkgrel=1
pkgdesc="Symbolic framework for automatic differentiation and numeric optimization"
arch=('i686' 'x86_64')
url="https://github.com/casadi/casadi"
license=('GPL3')
depends=('python' 'gcc-fortran' 'lapack' 'tinyxml' 'tinyxml2' 'swig' 'ipython'
         'python-numpy' 'python-scipy' 'python-matplotlib' 'coin-or-ipopt' 'dsdp')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/casadi/${pkgname}/archive/${pkgver}.tar.gz"
        "dont-install-tinyxml-stuff.patch")
sha256sums=('87ea8c25025b0a479d3fcd20d1851197e699b6440cc8fd5e8c02a7e79f8cd19c'
            '8c292a6e10c56ebf0ae2252a17e06eae18d5eaa618d9a8cad1d7aea1d273ff5f')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/dont-install-tinyxml-stuff.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build && cd build

  cmake \
    -DCMAKE_BUILD_TYPE="Release" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DWITH_PYTHON=ON \
    -DWITH_PYTHON3=ON \
    -DPYTHON_EXECUTABLE=/usr/bin/python \
    -DWITH_LAPACK=ON \
    -DWITH_SUNDIALS=OFF \
    -DWITH_BUILD_SUNDIALS=OFF \
    -DWITH_IPOPT=ON \
    -DWITH_TINYXML=ON \
    -DWITH_BUILD_TINYXML=OFF \
    -DWITH_DSDP=ON \
    -DWITH_BUILD_DSDP=OFF \
    -DWITH_CLANG=OFF \
    ..

  cmake --build .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  DESTDIR="${pkgdir}" cmake --install .
}
