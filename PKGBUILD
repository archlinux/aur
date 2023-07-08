# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: orumin <ev at orum.in>

pkgname=lib32-suitesparse
_pkgbase=suitesparse
pkgver=7.1.0
pkgrel=1
pkgdesc="A collection of sparse matrix libraries (32-bit)"
url="http://faculty.cse.tamu.edu/davis/suitesparse.html"
arch=('x86_64')
depends=('lib32-metis' 'lib32-lapack' 'lib32-tbb' 'suitesparse'
         'lib32-mpfr')
makedepends=('gcc-fortran-multilib' 'cmake' 'chrpath')
license=('GPL')
options=('staticlibs')
source=($_pkgbase-$pkgver.tar.gz::"https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v$pkgver.tar.gz")
sha512sums=('8eab68acabb85f31fe9e4b334efe19d1e792358ae8fb20916cc989c0f29e1b7f951bb5c8ca7143057a7f75bda52d0e0f51b14522459017a0e97707a9e41e86d5')


build() {
  cd "${srcdir}/SuiteSparse-$pkgver"
  export CC="gcc -m32" CXX="g++ -m32" PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export BLAS=-lblas LAPACK=-llapack TBB=-ltbb SPQR_CONFIG=-DHAVE_TBB MY_METIS_LIB=/usr/lib32/libmetis.so
  CXXFLAGS+=" -m32 -ffat-lto-objects" \
  CMAKE_OPTIONS="-DENABLE_CUDA=0 \
  -DBLAS_LIBRARIES=/usr/lib32/libblas.so \
  -DLAPACK_LIBRARIES=/usr/lib32/liblapack.so \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_INSTALL_LIBDIR=lib32 \
  -DBLA_VENDOR=Generic \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_CXX_FLAGS_DEBUG=-m32 -DCMAKE_EXE_LINKER_FLAGS_DEBUG=-m32 -DCMAKE_Fortran_FLAGS=-m32" \
  make
}

package() {
  cd "${srcdir}/SuiteSparse-$pkgver"

  export CC="gcc -m32" CXX="g++ -m32" PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export BLAS=-lblas LAPACK=-llapack TBB=-ltbb SPQR_CONFIG=-DHAVE_TBB MY_METIS_LIB=/usr/lib32/libmetis.so
  DESTDIR="$pkgdir" make install

  rm -rf "${pkgdir}"/usr/{bin,include}
  chrpath -d "$pkgdir"/usr/lib32/*.so
}

