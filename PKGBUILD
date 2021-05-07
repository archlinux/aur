# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: orumin <ev at orum.in>

pkgname=lib32-suitesparse
_pkgbase=suitesparse
pkgver=5.9.0
pkgrel=4
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
sha512sums=('d0b7de23d769b4537a9deac7a7c42408f29ddaa66e2c4be2c4b6465a6e8b60f7705db8b2a8de89808208a2fdd8e6ac8e25e54a0429952b16a1b22ce2e4469475'
            '6ae782d64e01096adecef7e2ae3eee78c5a93e31493705c1a22851159c8b8560dd58acb489f5b02d8312d4488688675b3748c6c27101b9b6777928570e6e4cea'
            'e9a8b181b35546c9c4048896e1b1ff329296b6505ed15a7a5645c538d284b87fbdfd359d7fbec6dd7f1d0c092bc2b658458638acdc64aea453a8b750abf02919')

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

