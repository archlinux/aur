# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Alexander Kobel <a-kobel@a-kobel.de>

pkgbase="bertini"
pkgname=('bertini' 'bertini-parallel')
pkgver=1.6
pkgrel=4
pkgdesc="Homotopy continuation solver for systems of polynomial equations"
arch=('any')
url="https://bertini.nd.edu"
license=('custom:Bertini license')
makedepends=('openmpi')
depends=('glibc' 'gmp' 'mpfr')
provides=("${pkgbase}" "${pkgbase}-serial" 'libbertini-serial.so')
conflicts=("${pkgbase}")
_pkgsrc="BertiniSource_v${pkgver/./}"
source=("${_pkgsrc}.tar.gz::${url}/BertiniSource_v${pkgver}.tar.gz"
        "MANUAL.pdf::${url}/BertiniUsersManual.pdf")
sha256sums=('0bc4c5f0b057366500fc62b37526af116cadb7dcc190ca454e0ebe00a8998998'
            '017313464d162bb32640858faa0dc40ec8498eee439cb703dc22507baa15394f')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  # workaround for OpenMPI 4 compatibility
  find . -type f -exec sed -i -e s/MPI_Address/MPI_Get_address/ -e s/MPI_Type_struct/MPI_Type_create_struct/ {} +
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  autoupdate
  ./configure \
    --prefix='/usr' \
    --includedir="/usr/include/${pkgbase}"
  make
}

_package_common() {
  cd "${srcdir}"
  install -Dm644 "MANUAL.pdf" "${pkgdir}/usr/share/doc/${pkgbase}/MANUAL.pdf"

  cd "${_pkgsrc}"
  make DESTDIR="${pkgdir}" install
  libtool --finish "${pkgdir}/usr/lib"

  install -Dm644 "README"  "${pkgdir}/usr/share/doc/${pkgbase}/README"
  # install -Dm644 "NEWS"    "${pkgdir}/usr/share/doc/${_pkgname}/NEWS"
  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgbase}/COPYING"
  install -Dm644 "AUTHORS" "${pkgdir}/usr/share/licenses/${pkgbase}/AUTHORS"
}

package_bertini() {
  _package_common

  cd "${pkgdir}/usr/bin"
  rm -f "bertini" "bertini-parallel"
  ln -s "bertini-serial" "bertini"

  cd "${pkgdir}/usr/lib"
  rm -f "libbertini-parallel"*
}

package_bertini-parallel() {
  pkgdesc+=" - OpenMPI parallelism"
  depends+=('openmpi')
  provides+=("${pkgbase}-parallel" 'libbertini-parallel.so')

  _package_common
}
