# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: chn <g897331845@gmail.com>
# Contributor: haawda <stefan-husmann@t-online.de>
# Contributor: myles <myles@rockhead.biz>
_pkgname=scalapack
pkgname=${_pkgname}-static
pkgver=2.2.2
pkgrel=1
arch=(i686 x86_64)
pkgdesc="subset of scalable LAPACK routines redesigned for distributed memory MIMD parallel computers, static version."
url="https://github.com/Reference-ScaLAPACK/${_pkgname}"
license=(BSD-3-Clause)
depends=("scalapack=${pkgver}")
makedepends=(cmake gcc-fortran)
source=(${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('1b91b94a081cd808dc6fa7d23a9f4054f4d23de293cae1686f7708237c28404561a6f4185e7f27a0a56cd0916622f8db444803f8ed19d56368af54a44c455d44')
options=(staticlibs)

prepare() {
  cd ${_pkgname}-${pkgver}
  sed -i 's/MPI_Type_struct/MPI_Type_create_struct/g' BLACS/SRC/*.c
  sed -i 's/MPI_Attr_get/MPI_Comm_get_attr/g' BLACS/SRC/blacs_get_.c
  sed -i 's/cmake_minimum_required(VERSION 2.8)/cmake_minimum_required(VERSION 2.8...4.0)/' BLACS/INSTALL/CMakeLists.txt
  sed -i 's/cmake_minimum_required(VERSION 3.9)/cmake_minimum_required(VERSION 3.26...4.0)/' CMakeLists.txt
}

build() {
  cmake -S ${_pkgname}-${pkgver} \
    -B build \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}"/usr \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DCMAKE_CXX_COMPILER=/usr/bin/mpic++ \
    -DCMAKE_Fortran_FLAGS="$FCFLAGS -fallow-argument-mismatch" \
    -DCMAKE_C_FLAGS:STRING="$CFLAGS -Wno-implicit-function-declaration" \
    -DCMAKE_C_STANDARD:STRING="17" \
    -DCMAKE_C_COMPILER=/usr/bin/mpicc
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${_pkgname}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
