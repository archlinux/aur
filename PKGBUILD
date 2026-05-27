# Maintainer: banana-bred <j.forer@posteo.net>

_pkgname=ukrmol-in
pkgname=${_pkgname}-fint64-git
pkgver=r4.667ef6e
pkgrel=3
_minCmake="3.10"
pkgdesc="Inner region programs for UKRmol+, with some small patches. Also provides GBTOlib."
arch=('x86_64')
url='https://github.com/banana-bred/Ukrmol-in'
license=('GPL-3.0-only')
depends=('lapack64' 'blas64-openblas' 'mpich-fint64' 'scalapack-mpich-ilp64')
makedepends=('cmake' 'gcc-fortran' 'doxygen' 'git')
provides=("${_pkgname}=${pkgver}" gbtolib)
conflicts=("${_pkgname}" gbtolib)
source=("${_pkgname}::git+https://github.com/banana-bred/Ukrmol-in.git#branch=3.3.0-patches")
sha256sums=('SKIP')
options=('!lto' '!strip')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null \
      | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
      || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  # -- cmake option -D CMAKE_POLICY_VERSION_MINIMUM=3.5 doen't propagate to tests, so rewrite the files
  shopt -s globstar nullglob
  local files=(**/CMakeLists.txt **/TestDriver.cmake)
  local file
  for file in "${files[@]}"; do
    sed -E -i "s/cmake_minimum.*/cmake_minimum_required(VERSION ${_minCmake})/" "$file"
  done

}

build() {
  export BLAS_LIBRARIES="$(pkg-config --libs blas64)"
  export LAPACK_LIBRARIES="$(pkg-config --libs lapack64)"
  local _cmakeOptions=(
    -D CMAKE_POLICY_VERSION_MINIMUM="${_minCmake}"
    -D CMAKE_C_COMPILER='/opt/mpich-fint64/bin/mpicc'
    -D CMAKE_CXX_COMPILER='/opt/mpich-fint64/bin/mpicxx'
    -D CMAKE_Fortran_COMPILER='/opt/mpich-fint64/bin/mpifort'
    -D CMAKE_Fortran_FLAGS='-fdefault-integer-8'
    -D LAPACK_LIBRARIES="${LAPACK_LIBRARIES}"
    -D SCALAPACK_LIBRARIES='/opt/scalapack-mpich-fint64/lib/libscalapack.so'
    -D BLAS_LIBRARIES="${BLAS_LIBRARIES}"
    -D MPIEXEC_EXECUTABLE='/opt/mpich-fint64/bin/mpiexec'
    -D SCALAPACK_LIBRARIES='/opt/scalapack-mpich-ilp64/lib/libscalapack.so'
  )
  cd "${srcdir}/${_pkgname}"
  cmake "${_cmakeOptions[@]}" .
  make
}

check() {
  cd "${srcdir}/${_pkgname}"
  # ctest -R serial
  # mv ./Testing TestingSerial
  ctest -R parallel
  mv ./Testing TestingParallel
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/${_pkgname}"
  install -d "${pkgdir}/usr/share/doc/${_pkgname}"
  install -d "${pkgdir}/usr/include/${_pkgname}/gbtolib"
  install -Dm 755 "${srcdir}/${_pkgname}"/bin/* "${pkgdir}/usr/bin/"
  install -Dm 644 "${srcdir}/${_pkgname}"/lib/*.a "${pkgdir}/usr/lib/${_pkgname}"
  # -- outer region codes need GBTO mod files
  install -Dm 644 "${srcdir}/${_pkgname}/source/gbtolib/mod/"*.mod  "${pkgdir}/usr/include/${_pkgname}/gbtolib/"
  install -Dm 644 "${srcdir}/${_pkgname}/source/gbtolib/mod/"*.smod "${pkgdir}/usr/include/${_pkgname}/gbtolib/"
  # -- docs
  install -Dm 644 "${srcdir}/${_pkgname}"/doc/* "${pkgdir}/usr/share/doc/${_pkgname}"
}

# vim: ts=2 sw=2 et :
