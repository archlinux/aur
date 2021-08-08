# Maintainer: chn <g897331845@gmail.com>

_pkgname=scalapack
pkgname=$_pkgname-static
pkgver=2.1.0
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="subset of scalable LAPACK routines redesigned for distributed memory MIMD parallel computers, static version."
url="http://www.netlib.org/scalapack/"
license=('custom')
depends=("scalapack=$pkgver")
makedepends=('cmake' 'gcc-fortran')
source=(http://www.netlib.org/scalapack/$_pkgname-$pkgver.tgz http://www.netlib.org/scalapack/manpages.tgz)
sha256sums=('61d9216cf81d246944720cfce96255878a3f85dec13b9351f1fa0fd6768220a6'
            'a745c9f367d65e3c7611c126597a4681094b002552e47b621964d30a966aac7b')
OPTIONS+=(staticlibs)
prepare() {
  cd ${_pkgname}-${pkgver}
  sed -i 's/MPI_Type_struct/MPI_Type_create_struct/g' BLACS/SRC/*.c
  sed -i 's/MPI_Attr_get/MPI_Comm_get_attr/g' BLACS/SRC/blacs_get_.c
}

build() {
  msg "Starting make..."
  
  [[ -e build ]] && rm -rf build
  mkdir build 
  cd build
  
  cmake ../${_pkgname}-${pkgver} \
	-DCMAKE_INSTALL_PREFIX="${pkgdir}"/usr \
	-DCMAKE_BUILD_TYPE:STRING=Release \
	-DCMAKE_CXX_COMPILER=/usr/bin/mpic++ \
	-DCMAKE_Fortran_FLAGS="$FCFLAGS -fallow-argument-mismatch" \
	-DCMAKE_C_COMPILER=/usr/bin/mpicc
  make
}

package(){
  cd build
  make install
  rm -rf "${pkgdir}"/usr/lib/{cmake,pkgconfig}
}
