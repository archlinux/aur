# Maintainer: banana-bred <j.forer@posteo.net>

pkgname="ukrmol-in"
pkgver=3.2
pkgrel=5
_minCmake="3.10"
pkgdesc="Inner region programs for UKRmol+"
arch=('any')
url='https://zenodo.org/records/5799110'
license=('GPL3')
groups=()
depends=('lapack64' 'blas64-openblas' 'mpich-fint64')
makedepends=('cmake' 'gcc' 'gcc-fortran' 'cmake' 'doxygen')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
source=('https://zenodo.org/record/5799110/files/ukrmol-in-'"${pkgver}"'.tar.gz?download=1')
sha256sums=('b93017d8d82a359a72f0f2326cef67c5499f3f97b518ec2a9befbfb214b5ecb4')

prepare() {
  # -- -D CMAKE_POLICY_VERSION_MINIMUM=3.5 does not seem to propagate to the tests
  shopt -s globstar nullglob
  cd "${srcdir}/${pkgname}-${pkgver}"
  files=(**/CMakeLists.txt **/TestDriver.cmake)
  for file in "${files[@]}"; do
    sed -E -i "s/cmake_minimum.*/cmake_minimum_required(VERSION ${_minCmake})/" "$file"
  done
}

build() {

  export BLAS_LIBRARIES="$(pkg-config --libs blas64)"
  export LAPACK_LIBRARIES="$(pkg-config --libs lapack64)"
  export BLAS_CFLAGS="$(pkg-config --cflags blas64)"
  export LAPACK_CFLAGS="$(pkg-config --cflags lapack64)"

  local _cmakeOptions=(
    -D CMAKE_POLICY_VERSION_MINIMUM="${_minCmake}"
    -D CMAKE_C_COMPILER='/opt/mpich-fint64/bin/mpicc'
    -D CMAKE_CXX_COMPILER='/opt/mpich-fint64/bin/mpicc'
    -D CMAKE_Fortran_COMPILER='/opt/mpich-fint64/bin/mpifort'
    -D CMAKE_Fortran_FLAGS='-fdefault-integer-8'
    -D LAPACK_LIBRARIES="${LAPACK_LIBRARIES}"
    -D BLAS_LIBRARIES="${BLAS_LIBRARIES}"
    -D MPIEXEC_EXECUTABLE='/opt/mpich-fint64/bin/mpiexec'
  )

  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake "${_cmakeOptions[@]}" $(pwd)

  make

}

check() {

  cd "${srcdir}/${pkgname}-${pkgver}"

  ctest -R serial -D CMAKE_POLICY_VERSION_MINIMUM="${_minCmake}"

  mv ./Testing TestingSerial

  ctest -R parallel -D CMAKE_POLICY_VERSION_MINIMUM="${_minCmake}"

  mv ./Testing TestingParallel
}

package() {

  install -d "${pkgdir}"/usr/bin/
  install -d "${pkgdir}/usr/lib/${pkgname}"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"

  install -Dm 755 "${srcdir}/${pkgname}-${pkgver}"/bin/* "${pkgdir}"/usr/bin/

  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}"/lib/*.a "${pkgdir}/usr/lib/${pkgname}"

  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}"/doc/* "${pkgdir}/usr/share/doc/${pkgname}"

}

# vim: ts=2 sw=2 et :
