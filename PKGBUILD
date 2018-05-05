# Contributor: Guillaume DOLLÉ <dolle.guillaume at gmail.com>
# Contributor: George Eleftheriou <eleftg>

pkgname='feelpp'
pkgver=0.104.0
pkgrel=1
pkgdesc="Finite Element Embedded Language and Library in C++"
arch=('i686' 'x86_64')
url="https://github.com/feelpp"
license=('LGPL')
depends=('cln' 'mumps' 'slepc' 'gmsh' 'fftw' 'ann' 'libbson' 'glpk' 'gsl' 'python' 'ginac')
makedepends=('cmake' 'python2')
source=("https://github.com/feelpp/feelpp/releases/download/v${pkgver}/feelpp-${pkgver}.tar.gz")
sha256sums=('380ff2712c01740460ecef4326fa790f5daee8bc79a8d3359d1a61099e32d533')

prepare() {
  cd $pkgbase-$pkgver

  # https://github.com/feelpp/feelpp/issues/1096
  grep -lr 'COMMAND python' contrib/ginac|xargs sed -i "s|COMMAND python |COMMAND python2 |g"
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
    -DPETSC_DIR=/opt/petsc/linux-c-opt/ \
    -DFEELPP_ENABLE_OPENTURNS=OFF \
    -DFEELPP_ENABLE_VTK=OFF \
    -DFEELPP_ENABLE_QUICKSTART=OFF \
    -DFEELPP_ENABLE_TOOLBOXES=OFF \
    -DFEELPP_ENABLE_DOCUMENTATION=OFF \
    -DFEELPP_ENABLE_BENCHMARKS=OFF \
    -DFEELPP_ENABLE_APPLICATIONS=OFF \
    -DFEELPP_ENABLE_TESTS=OFF \
    -DFEELPP_ENABLE_RESEARCH=OFF \
    -DBUILD_GUILE=OFF -DBUILD_PYTHON=OFF \
    ..
  # templates take a lot of ram
  make feelpp -j1
  make
}

package() {
  cd $pkgbase-$pkgver/build
  make DESTDIR="$pkgdir/" install
  rm -r "$pkgdir"/usr/include/boost
  rm "$pkgdir/"usr/lib/pkgconfig/hana.pc
  rm "$pkgdir"/usr/bin/ginsh
  rm -r "$pkgdir"/home
}

