# Contributor: Guillaume DOLLÉ <dolle.guillaume at gmail.com>
# Contributor: George Eleftheriou <eleftg>

pkgname=feelpp
pkgver=0.107.0
pkgrel=1
pkgdesc="Finite Element Embedded Language and Library in C++"
arch=('i686' 'x86_64')
url="https://github.com/feelpp"
license=('LGPL')
depends=('cln' 'mumps' 'slepc' 'gmsh' 'fftw' 'ann' 'libbson' 'glpk' 'gsl' 'python' 'ginac')
makedepends=('cmake' 'clang')
source=("${pkgname}-${pkgver}::git+https://github.com/feelpp/feelpp.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd ${pkgname}-${pkgver}
  git submodule init
  git submodule update -f --init
}

build() {
  cd ${pkgname}-${pkgver}
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
    -DFEELPP_ENABLE_DOCUMENTATION=OFF \
    -DBUILD_GUILE=OFF -DBUILD_PYTHON=OFF \
    ..
  # templates take a lot of ram
  make -j1
}

package() {
  cd ${pkgname}-${pkgver}/build
  make DESTDIR="$pkgdir" install
#   rm "$pkgdir"/usr/bin/{gflags_completions.sh,ginsh}
}

