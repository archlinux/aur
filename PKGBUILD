# Maintainer: banana-bred <j.forer@posteo.net>

pkgname="gbtolib"
_name="GBTOLib"
pkgver=3.0.3
pkgrel=2
epoch=
pkgdesc="A high-performance library for evaluation of molecular integrals"
arch=('any')
url='https://zenodo.org/records/5798035'
license=('GPL3')
groups=()
depends=('lapack' 'blas')
makedepends=('cmake' 'gcc' 'gcc-fortran' 'cmake' 'doxygen' 'openmpi')
checkdepends=()
optdepends=()
provides=('gbtolib')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
source=('https://zenodo.org/record/5798035/files/GBTOLib-'"${pkgver}"'.zip?download=1')
sha256sums=('5110ddf6f3c9993c56ecca99df1fbb071e6402a31e0f599f2db8ad73a72de0b1')

build() {

  local _cmakeOptions=(
    -D CMAKE_C_COMPILER="$(command -v gcc)"
    -D CMAKE_CXX_COMPILER="$(command -v gcc)"
    -D CMAKE_Fortran_COMPILER="$(command -v mpifort)"
    -D CMAKE_Fortran_FLAGS='-fdefault-integer-8'
    -D WITH_MPI='ON'
  )

  mkdir -p "${srcdir}/${_name}-${pkgver}/build" ; cd "${srcdir}/${_name}-${pkgver}/build"

  cmake "${_cmakeOptions[@]}" "${srcdir}/${_name}-${pkgver}"

  make

}

check() {

  cd "${srcdir}/${_name}-${pkgver}"/build

  make test

}

package() {

  install -Dm644 "${srcdir}/${_name}-${pkgver}"/build/lib/libGBTO.a "${pkgdir}"/usr/lib/libGBTO.a

  # -- docs
  install -d "${pkgdir}"/usr/share/doc/"${pkgname}"
  install -Dm644 "${srcdir}/${_name}-${pkgver}"/doc/Doxyfile "${pkgdir}"/usr/share/doc/"${pkgname}/."
  install -Dm644 "${srcdir}/${_name}-${pkgver}"/doc/README "${pkgdir}"/usr/share/doc/"${pkgname}/."
  install -Dm644 "${srcdir}/${_name}-${pkgver}"/doc/scatci_integrals.md "${pkgdir}"/usr/share/doc/"${pkgname}/."

  # -- other Fortran-based programs may need the module files from GBTOLib to be built
  install -d "${pkgdir}"/usr/mod/"${pkgname%-*}"
  install -Dm644 "${srcdir}/${_name}-${pkgver}"/build/mod/*.mod "${pkgdir}"/usr/mod/"${pkgname%-*}"

}

# vim: ts=2 sw=2 et :
