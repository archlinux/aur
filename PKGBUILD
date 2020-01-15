# Maintainer: hbhkx <kxhuang0@gmail.com>
# Contributor: Israel Herraiz <isra@herraiz.org>

pkgname=suitesparse-mkl
pkgver=5.6.0
pkgrel=1
pkgdesc="A collection of sparse matrix libraries (compiled with the Intel MKL and Intel TBB)"
url="http://faculty.cse.tamu.edu/davis/suitesparse.html"
arch=('i686' 'x86_64')
gblasver=3.1.1
conflicts=('umfpack' 'graphblas' 'suitesparse')
provides=('umfpack' 'graphblas=${gblasver}' 'suitesparse=${pkgver}')
replaces=('umfpack' 'graphblas' 'suitesparse')
depends=('metis' 'intel-mkl' 'intel-tbb')
makedepends=('intel-compiler-base' 'intel-fortran-compiler' 'cmake')
license=('GPL')
options=()
source=("https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v${pkgver}.tar.gz" suitesparse-mkl_tbb.patch)
sha1sums=('3de08b5ab02610ed0446225aad2445696616fae5'
          'f3620f3d447279ff992e4b42f4cc40ce98afe643')

prepare() {
# Fix linking with intel-tbb
  cd SuiteSparse
  patch -p1 -i ../suitesparse-link-tbb.patch
}

build() {
   cd "$srcdir"/SuiteSparse

   source /opt/intel/mkl/bin/mklvars.sh intel64 
   source /opt/intel/composerxe/linux/bin/compilervars.sh intel64
   export BLAS="-L/opt/intel/mkl/lib/intel64 -lmkl_rt"
   TBB=-ltbb SPQR_CONFIG=-DHAVE_TBB MY_METIS_LIB=/usr/lib/libmetis.so make
}


package() {
   cd "${srcdir}"/SuiteSparse
   install -dm755 "${pkgdir}"/usr/{include,lib}

   source /opt/intel/mkl/bin/mklvars.sh intel64 
   source /opt/intel/composerxe/linux/bin/compilervars.sh intel64
   export BLAS="-L/opt/intel/mkl/lib/intel64 -lmkl_rt"
   export LAPACK="-L/opt/intel/mkl/lib/intel64 -lmkl_rt"
   
   TBB=-ltbb SPQR_CONFIG=-DHAVE_TBB MY_METIS_LIB=/usr/lib/libmetis.so \
     make INSTALL_LIB="${pkgdir}"/usr/lib INSTALL_INCLUDE="${pkgdir}"/usr/include install

   # fix RPATH
   chrpath -d "$pkgdir"/usr/lib/*
}
