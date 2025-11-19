# Maintainer: banana-bred <j.forer@posteo.net>

pkgname="ukrmol-out"
pkgver=3.2
pkgrel=5
_minCmake="3.10"
epoch=
pkgdesc="Outer region programs for UKRmol+"
arch=('any')
url='https://zenodo.org/records/5799134'
license=('custom')
groups=()
depends=('lapack64' 'blas64-openblas' 'gbtolib' 'mpich-fint64')
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
source=('https://zenodo.org/record/5799134/files/ukrmol-out-'"${pkgver}"'.tar.gz?download=1')
sha256sums=('9d3acc132c4128957d0a34ac8700924d3efdb7b84e37107fad6f80ac840aee59')

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
    -D GBTOLIB_INCLUDE_DIRS="/usr/mod/gbtolib"
    -D GBTOLIB_LIBRARIES="$(whereis libGBTO.a | cut -d " " -f2)"
  )

  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake "${_cmakeOptions[@]}" $(pwd)

  make

}

package() {

  install -d "${pkgdir}"/usr/bin/
  install -d "${pkgdir}/usr/lib/${pkgname}"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"

  install -Dm 755 "${srcdir}/${pkgname}-${pkgver}"/bin/* "${pkgdir}"/usr/bin/

  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}"/lib/*.a "${pkgdir}/usr/lib/${pkgname}/."

  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}"/doc/* "${pkgdir}/usr/share/doc/${pkgname}"

  install -Dm 644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

# vim: ts=2 sw=2 et :
