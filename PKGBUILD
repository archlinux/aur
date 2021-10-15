# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: orumin <ev at orum.in>

pkgname=lib32-suitesparse
_pkgbase=suitesparse
pkgver=5.10.1
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
        "suitesparse-no-demo.patch"
        "flags.patch")
sha512sums=('8f85c6d63b76cba95707dfa732c51200df7794cb4c2599dbd92100475747b8d02b05089a47096e85c60b89bc852a8e768e0670f24902a82d29494a80ccf2bb5f'
            '2a946d5436a6e2f9d66438edefb083c73ebb049e987a2279dfe6b3bb61969c908333a9b0164739d292be3938d02cc905e7e5d3c7699effd7004f0dfb108c9f71'
            'ddeaf56911e84c0458c5723ed3eceadbf224c2b8fa8438078a7bf09a4cb9a96299f8ff3984b99f9d087366705fa821cd5b98b73faf791c547419aa951af4facb')

prepare() {
  cd "${srcdir}/SuiteSparse-$pkgver"
  patch -p1 -i ../suitesparse-no-demo.patch
  patch -p1 -i ../flags.patch
}

build() {
  cd "${srcdir}/SuiteSparse-$pkgver"
  export CC="gcc -m32" CXX="g++ -m32" PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export BLAS=-lblas LAPACK=-llapack TBB=-ltbb SPQR_CONFIG=-DHAVE_TBB MY_METIS_LIB=/usr/lib32/libmetis.so
  make
}

package() {
  cd "${srcdir}/SuiteSparse-$pkgver"

  export CC="gcc -m32" CXX="g++ -m32" PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export BLAS=-lblas LAPACK=-llapack TBB=-ltbb SPQR_CONFIG=-DHAVE_TBB MY_METIS_LIB=/usr/lib32/libmetis.so
  make INSTALL_LIB="${pkgdir}/usr/lib32" INSTALL_INCLUDE="${pkgdir}/usr/include" install

  rm -r "${pkgdir}"/usr/include
  chrpath -d "$pkgdir"/usr/lib32/*
}

