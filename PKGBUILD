# Contributor: Guillaume DOLLÉ <dolle.guillaume at gmail.com>
# Contributor: George Eleftheriou <eleftg>

pkgname='feelpp'
pkgver=0.106.0
pkgrel=1
pkgdesc="Finite Element Embedded Language and Library in C++"
arch=('i686' 'x86_64')
url="https://github.com/feelpp"
license=('LGPL')
depends=('cln' 'mumps' 'petsc' 'slepc' 'gmsh' 'fftw' 'ann' 'libbson' 'glpk' 'gsl' 'python' 'ginac')
makedepends=('cmake' 'python2')
source=("https://github.com/feelpp/feelpp/releases/download/v${pkgver}/feelpp-${pkgver}.tar.gz")
source=(https://github.com/feelpp/feelpp/archive/v${pkgver/_/-}.tar.gz)
sha256sums=('4e5f5a68029244adb3dbbb6337ca06fad549fdbbb36c6b05aec0847ed116e6b5')

prepare() {
  cd $pkgbase-${pkgver/_/-}

  # https://github.com/feelpp/feelpp/issues/1247: boost 1.68 support
  curl -L https://github.com/feelpp/feelpp/pull/1251.patch | patch -p1

  # git submodules not included in tarball
  test -f feelpp/contrib/pybind11/CMakeLists.txt || git clone https://github.com/feelpp/pybind11.git feelpp/contrib/pybind11
  test -f feelpp/contrib/nlopt/CMakeLists.txt || git clone https://github.com/feelpp/nlopt.git feelpp/contrib/nlopt
  test -f feelpp/contrib/kwsys/CMakeLists.txt || git clone https://github.com/feelpp/kwsys.git feelpp/contrib/kwsys

  # error: no template named 'unordered_set' in namespace 'std'
  sed -i "40i#include <unordered_set>" feelpp/feel/feelmesh/filters.hpp
}

build() {
  cd $pkgbase-${pkgver/_/-}
  mkdir -p build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_C_COMPILER=/usr/bin/clang \
    -DCMAKE_CXX_COMPILER=/usr/bin/clang++ \
    -DPETSC_DIR=/opt/petsc/linux-c-opt/ \
    -DFEELPP_MINIMAL_CONFIGURATION=ON \
    -DFEELPP_MINIMAL_BUILD=ON \
    -DFEELPP_ENABLE_QUICKSTART=OFF \
    -DFEELPP_ENABLE_PYFEELPP_LIBFEELPP=OFF \
    -DBUILD_GUILE=OFF -DBUILD_PYTHON=OFF \
    ..
  # templates take a lot of ram
  make -j1
}

package() {
  cd $pkgbase-${pkgver/_/-}/build
  make DESTDIR="$pkgdir/" install
  rm "$pkgdir"/usr/bin/{gflags_completions.sh,ginsh}
}

