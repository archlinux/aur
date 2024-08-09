# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Alexander Kobel <a-kobel@a-kobel.de>

_name="bertini"
pkgname="${_name}-parallel"
pkgver=1.6
pkgrel=1
pkgdesc="Homotopy continuation solver for systems of polynomial equations - OpenMPI parallelism"
arch=('any')
url="https://bertini.nd.edu"
license=('custom:Bertini license')
depends=('glibc' 'gmp' 'mpfr' 'openmpi')
provides=("${_name}" "${_name}-serial" "${_name}-parallel"
          'libbertini-serial.so' 'libbertini-parallel.so')
conflicts=("${_name}")
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
    --includedir='/usr/include'
  make
}

package() {
  cd "${srcdir}"
  install -Dm644 "MANUAL.pdf" "${pkgdir}/usr/share/doc/${_name}/MANUAL.pdf"

  cd "${_pkgsrc}"
  make DESTDIR="${pkgdir}" install
  libtool --finish "${pkgdir}/usr/lib"

  install -Dm644 "README"  "${pkgdir}/usr/share/doc/${_name}/README"
  # install -Dm644 "NEWS"    "${pkgdir}/usr/share/doc/${_name}/NEWS"
  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${_name}/COPYING"
  install -Dm644 "AUTHORS" "${pkgdir}/usr/share/licenses/${_name}/AUTHORS"
}
