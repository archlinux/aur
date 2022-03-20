# Maintainer: Martin Diehl <aur@martin-diehl.net>
_fname=stdlib
pkgname=fortran_${_fname}
pkgver=0.2.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Fortran standard library"
url="https://github.com/fortran-lang/stdlib"
depends=("gcc-libs")
makedepends=("gcc-fortran"
             "fypp"
             "cmake"
             "ninja")
options=('strip')
license=('MIT')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/fortran-lang/stdlib/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('eccb7a1027b3055699e05e2a55cce9802c17292355380cfa5365dedd8ebe754d')

build() {
  cd "${srcdir}/${_fname}-${pkgver}"
  local _build="build_${CARCH}"

  FC=gfortran cmake \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -B"${_build}"
  cmake --build "${_build}"
}

package() {
  cd "${srcdir}/${_fname}-${pkgver}/build_${CARCH}"

  DESTDIR="${pkgdir}" \
  cmake --install .

  install -Dm0644 "${srcdir}/${_fname}-${pkgver}/LICENSE" "${pkgdir}/share/licenses/${pkgname}/LICENSE"
}
