# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: orumin <ev at orum.in>

pkgname=lib32-suitesparse
_pkgbase=suitesparse
pkgver=6.0.2
pkgrel=1
pkgdesc="A collection of sparse matrix libraries (32-bit)"
url="http://faculty.cse.tamu.edu/davis/suitesparse.html"
arch=('x86_64')
depends=('lib32-metis' 'lib32-lapack' 'lib32-tbb' 'suitesparse'
         'lib32-mpfr')
makedepends=('gcc-fortran-multilib' 'cmake' 'chrpath')
license=('GPL')
options=('staticlibs')
source=($_pkgbase-$pkgver.tar.gz::"https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v$pkgver.tar.gz"
        "flags.patch")
sha512sums=('1a688bd07176e32649f316ab47b2876ed53c725520df9d36a0181ecfe28ed9724d32a0ea853545ced0b7969660c88802dfb950f7624901f2cbcd0a23802d26c1'
            '8cf71d9186a2a221527bccef9cfa3b990476d8aeb9d721e810ce96e371aa982536f2ab0a30977db5e2b133c9636397de1913b99850a7fa8941d5119814cc9d65')

prepare() {
  cd "${srcdir}/SuiteSparse-$pkgver"
  patch -p1 -i ../flags.patch
}

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

