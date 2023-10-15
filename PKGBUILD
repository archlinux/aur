# Maintainer: banana-bred <j.forer@posteo.net>

pkgname="ukrmol-in"
pkgver=3.2
pkgrel=1
pkgdesc="Inner region programs for UKRmol+"
arch=('any')
url='https://zenodo.org/records/5799110'
license=('GPL3')
groups=()
depends=('lapack' 'blas' 'gbtolib')
makedepends=('cmake' 'gcc' 'gcc-fortran' 'cmake' 'doxygen' 'openmpi')
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

build() {

  local _cmakeOptions=(
    -D CMAKE_C_COMPILER="$(command -v gcc)"
    -D CMAKE_CXX_COMPILER="$(command -v gcc)"
    -D CMAKE_Fortran_COMPILER="$(command -v mpifort)"
    -D CMAKE_Fortran_FLAGS='-fdefault-integer-8'
  )

  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake "${_cmakeOptions[@]}" $(pwd)

  make

}

check() {

  cd "${srcdir}/${pkgname}-${pkgver}"

  ctest -R serial

  mv ./Testing TestingSerial

  ctest -R parallel

  mv ./Testing TestingParallel
}

package() {

  install -d "${pkgdir}"/usr/bin/
  install -d "${pkgdir}/usr/lib/${pkgname}"

  install -Dm 755 "${srcdir}/${pkgname}-${pkgver}"/bin/* "${pkgdir}"/usr/bin/

  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}"/lib/*.a "${pkgdir}/usr/lib/${pkgname}"

}

# vim: ts=2 sw=2 et :
