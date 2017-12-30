# Contributor: Guillaume DOLLÉ <dolle.guillaume at gmail.com>
# Contributor: George Eleftheriou <eleftg>

pkgname='feelpp'
pkgver=0.103.2
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/feelpp"
license=('LGPL')
depends=('cln' 'mumps' 'slepc' 'petsc' 'gmsh' 'fftw')
makedepends=('cmake' 'eigen3')
source=("https://github.com/feelpp/feelpp/releases/download/v${pkgver}/feelpp-${pkgver}.tar.gz" fix-compilation.patch d6891c9.patch)
sha256sums=('e083b6107cd78eafede8b051e478093b52a52c961748721241c874cfad2b9fe9' SKIP SKIP)

prepare() {
  cd $pkgbase-$pkgver
  grep -lr 'COMMAND python' contrib/ginac|xargs sed -i "s|COMMAND python |COMMAND python2 |g"

  patch -p1 -i "$srcdir"/fix-compilation.patch
  patch -p1 -i "$srcdir"/d6891c9.patch

}



build() {
  cd $pkgbase-$pkgver
  mkdir -p build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_C_COMPILER=/usr/bin/clang \
    -DCMAKE_CXX_COMPILER=/usr/bin/clang++ \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DPETSC_DIR=/opt/petsc/linux-c-opt/ \
    -DFEELPP_ENABLE_SYSTEM_EIGEN3=OFF \
    -DFEELPP_ENABLE_OPENTURNS=OFF \
    -DFEELPP_ENABLE_VTK=OFF \
    -DFEELPP_ENABLE_QUICKSTART=OFF \
    -DFEELPP_ENABLE_TOOLBOXES=OFF \
    -DFEELPP_ENABLE_DOCUMENTATION=OFF \
    -DFEELPP_ENABLE_BENCHMARKS=OFF \
    -DFEELPP_ENABLE_APPLICATIONS=OFF \
    -DFEELPP_ENABLE_TESTS=OFF \
    -DFEELPP_ENABLE_RESEARCH=OFF \
    -DFEELPP_ENABLE_GMSH=OFF \
    -DBUILD_GUILE=OFF -DBUILD_MATLAB=OFF -DUSE_SWIG=OFF \
    -DSUPPORT_OMP=OFF -DEIGEN_TEST_OPENMP=OFF \
    ..
  make feelpp -j1
  make
}

package() {
  cd $pkgbase-$pkgver/build
  make DESTDIR="$pkgdir/" install
}

