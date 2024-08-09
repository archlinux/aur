# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Alexander Kobel <a-kobel@a-kobel.de>

pkgname="bertini"
pkgver=1.6
pkgrel=4
pkgdesc="Homotopy continuation solver for systems of polynomial equations"
arch=('any')
url="https://bertini.nd.edu"
license=('custom:Bertini license')
depends=('glibc' 'gmp' 'mpfr')
provides=("${pkgname}" "${pkgname}-serial" 'libbertini-serial.so')
conflicts=("${pkgname}")
_pkgsrc="BertiniSource_v${pkgver/./}"
source=("${_pkgsrc}.tar.gz::${url}/BertiniSource_v${pkgver}.tar.gz"
        "MANUAL.pdf::${url}/BertiniUsersManual.pdf"
        "${pkgname}_disable_mpi.patch")
sha256sums=('0bc4c5f0b057366500fc62b37526af116cadb7dcc190ca454e0ebe00a8998998'
            '017313464d162bb32640858faa0dc40ec8498eee439cb703dc22507baa15394f'
            '7488c3789d166d0825a2f8f01c518f4ff6428d6d4a9b97fabc1f0ae8f28cbc47')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  # workaround for OpenMPI 4 compatibility
  find . -type f -exec sed -i -e s/MPI_Address/MPI_Get_address/ -e s/MPI_Type_struct/MPI_Type_create_struct/ {} +

  for _patch in "${srcdir}/${pkgname}_"*".patch"; do
    patch -p1 -i "${_patch}"
  done
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  autoupdate
  ./configure \
    --prefix='/usr' \
    --includedir='/usr/include' \
    --disable-mpi
  make
}

package() {
  cd "${srcdir}"
  install -Dm644 "MANUAL.pdf" "${pkgdir}/usr/share/doc/${pkgname}/MANUAL.pdf"

  cd "${_pkgsrc}"
  make DESTDIR="${pkgdir}" install
  libtool --finish "${pkgdir}/usr/lib"

  install -Dm644 "README"  "${pkgdir}/usr/share/doc/${pkgname}/README"
  # install -Dm644 "NEWS"    "${pkgdir}/usr/share/doc/${_pkgname}/NEWS"
  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 "AUTHORS" "${pkgdir}/usr/share/licenses/${pkgname}/AUTHORS"
}
