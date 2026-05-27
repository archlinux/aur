# Maintainer: banana-bred <j.forer@posteo.net>
# Adapted from the AUR `scalapack` package by Martin Diehl <aur@martin-diehl.net>
# Builds Reference-ScaLAPACK 2.2.3 with ILP64 (8-byte integers) throughout:
#   - Fortran side via -fdefault-integer-8
#   - C/BLACS side via -DInt=long (as documented in upstream README)
# Links against the matching fint64 BLAS/LAPACK/MPI stack.

pkgname=scalapack-mpich-ilp64
_srcname=scalapack
pkgver=2.2.3
pkgrel=1
pkgdesc='ScaLAPACK with 64-bit Fortran and C integers (ILP64), for use with the mpich-fint64'
arch=(x86_64)
url='http://www.netlib.org/scalapack'
license=(BSD-3-Clause)
depends=(glibc mpich-fint64 lapack64 blas64-openblas)
makedepends=(cmake gcc-fortran)
provides=()
# options=('!lto')
source=("${_srcname}-${pkgver}.tar.gz::https://github.com/Reference-ScaLAPACK/scalapack/archive/v${pkgver}/${_srcname}-${pkgver}.tar.gz")
sha512sums=('08c6073f8d1295df4f7f2a2449f189a2afb0ce30e94f2bc55613a94fc6404bb60ee5179ecba02641bff8bd4a088a3f621698e03347fddc6b0895bf14a87ca88a')

build() {

  cmake -S "${_srcname}-${pkgver}" \
    -B build \
    -D CMAKE_INSTALL_PREFIX:PATH="/opt/${pkgname}" \
    -D BUILD_SHARED_LIBS:BOOL=ON \
    -D SCALAPACK_BUILD_TESTS:BOOL=OFF \
    -D CMAKE_C_COMPILER=/opt/mpich-fint64/bin/mpicc \
    -D CMAKE_Fortran_COMPILER=/opt/mpich-fint64/bin/mpifort \
    -D CMAKE_BUILD_TYPE:STRING=Release \
    -D CMAKE_Fortran_FLAGS:STRING="$FCFLAGS -fdefault-integer-8 -fallow-argument-mismatch" \
    -D CMAKE_C_FLAGS:STRING="$CFLAGS -DInt=long -Wno-implicit-function-declaration" \
    -D CMAKE_C_STANDARD:STRING="17" \
    -D BLAS_LIBRARIES="$(pkg-config --libs blas64)" \
    -D LAPACK_LIBRARIES="$(pkg-config --libs lapack64)" \
    -D MPI_C_COMPILER=/opt/mpich-fint64/bin/mpicc \
    -D MPI_Fortran_COMPILER=/opt/mpich-fint64/bin/mpifort \
    -D MPI_HOME=/opt/mpich-fint64 \
    -D MPIEXEC_EXECUTABLE=/opt/mpich-fint64/bin/mpiexec

  make -C build

}

prepare() {
  sed -i 's/cmake_minimum_required(VERSION 2.8)/cmake_minimum_required(VERSION 3.6)/g' "${_srcname}-${pkgver}/BLACS/INSTALL/CMakeLists.txt"
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  # Install headers
  install -m 755 -d "${pkgdir}/opt/${pkgname}/include"
  install -m 644 -D "${srcdir}/${_srcname}-${pkgver}/PBLAS/SRC/"*.h "${pkgdir}/opt/${pkgname}/include/"
  install -m 644 -D "${srcdir}/${_srcname}-${pkgver}/BLACS/SRC/"*.h "${pkgdir}/opt/${pkgname}/include/"

  # Install license
  install -m 644 -D "${srcdir}/${_srcname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim: ts=2 sw=2 et :
