# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: orumin <ev at orum.in>

pkgname=lib32-suitesparse
_pkgbase=suitesparse
pkgver=7.0.1
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
sha512sums=('af311efec01849d2c4445e163035a7013f3334a90edcda40f5dab0b35ad5d9a3e643c716c08a131ae99195bec016d1363623570058b05f3ee2a9ed4c483016db'
            '4fb999a154fc75e9443697403826deb37cc67c59bb1a1a2a0cfeed61e03dbb714fbf2d8b63adea1f2b7d33545c62a925f5e4d77568434b4e036c3852abb3c9aa')

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

