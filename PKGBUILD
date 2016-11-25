# Maintainer: Israel Herraiz <isra@herraiz.org>

pkgname=suitesparse-mkl
pkgver=4.5.3
pkgrel=1
pkgdesc="A collection of sparse matrix libraries (compiled with the Intel MKL lib)"
url="http://faculty.cse.tamu.edu/davis/suitesparse.html"
arch=('i686' 'x86_64')
conflicts=('umfpack')
provides=('umfpack')
replaces=('umfpack')
depends=('metis' 'intel-mkl' 'intel-tbb')
makedepends=('intel-compiler-base' 'intel-fortran-compiler' 'cmake' 'chrpath')
license=('GPL')
options=('staticlibs')
source=("http://faculty.cse.tamu.edu/davis/SuiteSparse/SuiteSparse-$pkgver.tar.gz" suitesparse-link-tbb.patch)
sha1sums=('2403007be38266e3607edfbf3833bee7f6bcb0f1'
          '4f0b3836e8c3c1ec5be01f988f136cee4a2cb936')

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

   TBB=-ltbb SPQR_CONFIG=-DHAVE_TBB MY_METIS_LIB=/usr/lib/libmetis.so \
     make INSTALL_LIB="${pkgdir}"/usr/lib INSTALL_INCLUDE="${pkgdir}"/usr/include install

   # fix RPATH
   chrpath -d "$pkgdir"/usr/lib/*
}
