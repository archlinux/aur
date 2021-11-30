pkgname=feelpp
pkgver=0.109.0
pkgrel=1
pkgdesc="Finite Element Embedded Language and Library in C++"
arch=('x86_64')
url="https://github.com/feelpp"
license=('LGPL')
depends=('cln' 'mumps' 'slepc' 'gmsh' 'fftw' 'ann' 'glpk' 'gsl' 'python' 'elastic-git' 'openvr' 'libharu')
makedepends=('cmake' 'clang' 'eigen' 'openmp')
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
    -DPETSC_DIR=/opt/petsc/linux-c-opt/ \
    -DSLEPC_DIR=/opt/slepc/linux-c-opt/ \
    -DFEELPP_MINIMAL_CONFIGURATION=ON \
    -DFEELPP_MINIMAL_BUILD=ON \
    -DFEELPP_ENABLE_QUICKSTART=OFF \
    -DFEELPP_ENABLE_PYFEELPP_LIBFEELPP=OFF \
    -DFEELPP_ENABLE_DOCUMENTATION=OFF \
    -DFEELPP_ENABLE_GMSH=ON \
    -DFEELPP_ENABLE_PETSC=ON \
    -DFEELPP_ENABLE_SLEPC=ON \
    -DFEELPP_ENABLE_ANN=ON \
    -DFEELPP_ENABLE_FFTW=ON \
    -DFEELPP_ENABLE_GSL=ON \
    -DFEELPP_ENABLE_SYSTEM_EIGEN3=ON \
    -DCMAKE_C_COMPILER=/usr/bin/clang \
    -DCMAKE_CXX_COMPILER=/usr/bin/clang++ \
    -DBUILD_TESTING=OFF \
    ..
  make
}

package() {
  cd ${pkgname}-${pkgver}/build
  make DESTDIR="$pkgdir" install
  rm "$pkgdir"/usr/bin/{ginsh,gflags_completions.sh}
  rm "$pkgdir"/usr/lib/*.a
  rm "$pkgdir"/usr/lib/libc99snprintf.so
  rm -r "$pkgdir"/usr/doc
  rm -r "$pkgdir"/home
}

