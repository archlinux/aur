# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Alexander Kobel <a-kobel@a-kobel.de>

pkgbase="bertini"
pkgname=("${pkgbase}-"{common,serial,parallel})
pkgver=1.6
pkgrel=5
pkgdesc="Homotopy continuation solver for systems of polynomial equations"
arch=('x86_64' 'i686')
url="https://bertini.nd.edu"
license=('custom:Bertini License')
makedepends=('glibc' 'gmp' 'mpfr' 'openmpi')
_pkgsrc="${pkgbase}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/BertiniSource_v${pkgver}.tar.gz"
        "MANUAL.pdf::${url}/BertiniUsersManual.pdf"
        "${pkgbase}.sh")
sha256sums=('0bc4c5f0b057366500fc62b37526af116cadb7dcc190ca454e0ebe00a8998998'
            '017313464d162bb32640858faa0dc40ec8498eee439cb703dc22507baa15394f'
            'f55f838946e4ab2ee73cb87cb3111989cfa9b9f6c4fcea2c0dd00a9e4d0c0db5')

prepare() {
  cd "${srcdir}"
  rm -rf "${_pkgsrc}"
  mkdir -p "${_pkgsrc}"

  mv "BertiniSource_v${pkgver//./}"/* "${_pkgsrc}"
  rm -rf "BertiniSource_v${pkgver//./}"

  cd "${_pkgsrc}"
  # workaround for OpenMPI 4 compatibility
  find . -type f -exec sed -e s/MPI_Address/MPI_Get_address/ \
                           -e s/MPI_Type_struct/MPI_Type_create_struct/ \
                           -i {} +
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

package_bertini-common() {
  pkgdesc+=" (common files and documentation)"
  arch=('any')
  depends=('sh')

  cd "${srcdir}"
  install -vDm755 "${pkgbase}.sh" "${pkgdir}/usr/bin/${pkgbase}"
  install -vDm644 "MANUAL.pdf"    "${pkgdir}/usr/share/doc/${pkgbase}/MANUAL.pdf"

  cd "${_pkgsrc}"
  find "include" -type f -exec install -vDm644 "{}" "${pkgdir}/usr/{}" \;

  install -vDm644 "README"    "${pkgdir}/usr/share/doc/${pkgbase}/README"
  # install -vDm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgbase}/NEWS"
  # install -vDm644 "CHANGELOG" "${pkgdir}/usr/share/doc/${pkgbase}/CHANGELOG"
  install -vDm644 "AUTHORS"   "${pkgdir}/usr/share/doc/${pkgbase}/AUTHORS"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgbase}/COPYING"
}

package_bertini-serial() {
  pkgdesc+=" (serial version)"
  depends=('bertini-common' 'glibc' 'gmp' 'mpfr')
  provides=("${pkgbase}" "lib${pkgname}.so")

  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf include

  cd "${pkgdir}/usr/bin"
  rm -f *parallel* bertini

  cd "${pkgdir}/usr/lib"
  rm -f *parallel*
}

package_bertini-parallel() {
  pkgdesc+=" (parallel version with OpenMPI)"
  depends=('bertini-common' 'glibc' 'gmp' 'mpfr' 'openmpi')
  provides=("${pkgbase}" "lib${pkgname}.so")

  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf include

  cd "${pkgdir}/usr/bin"
  rm -f *serial* bertini

  cd "${pkgdir}/usr/lib"
  rm -f *serial*
}
