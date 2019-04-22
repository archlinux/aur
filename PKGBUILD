# Maintainer : Jörg Behrmann <behrmann@physik.fu-berlin.de>
# Contributer: eolianoe <eolianoe At GoogleMAIL DoT CoM>
# Contributor: Michele Mocciola <mickele>
# Contributor: Guillaume Dollé <dolle dot guillaume at gmail dot com >

pkgname=mumps-seq-shared
_pkgname=mumps
_PKGNAME=MUMPS
pkgver=5.2.0
pkgrel=1
pkgdesc="Sparse solver library using Gaussian elimination (sequential version, shared library version)"
url="http://mumps.enseeiht.fr"
license=('custom')
depends=('gcc-libs' 'blas' 'lapack' 'metis' 'scotch')
provides=('mumps')
conflicts=('mumps' 'mumps-seq')
arch=('any')
source=("http://mumps.enseeiht.fr/${_PKGNAME}_${pkgver}.tar.gz"
        "Makefile.seq.inc"
        "shared-libseq.patch"
        "shared-pord.patch"
        "shared-mumps.patch")
sha256sums=('41f2c7cb20d69599fb47e2ad6f628f3798c429f49e72e757e70722680f70853f'
            '82c19aa304ddc4cf14df7b3ad025306a8cb6a2b990e59cddac01d60bf9b388b9'
            'e2c800e95a6f6806899e7ae77c3cea1e538146aba20670ea847611b4ee838e0f'
            '99b138efd705f42c6b41543c9d26be2f6633d2c6a858b3081d12c89a34afe0d9'
            '0f0e10b2d76caf0884ad94863e1a961803be8eac4dde1d20e9a052d4b0ea669c')

prepare(){
  cd "${srcdir}/${_PKGNAME}_${pkgver}"

  # Makefile and patches are taking from Debian
  # https://salsa.debian.org/science-team/mumps/tree/master/debian
  ln -sf "${srcdir}/Makefile.seq.inc" Makefile.inc

  patch -p1 <../shared-pord.patch
  patch -p1 <../shared-mumps.patch
  patch -p1 <../shared-libseq.patch
}

build() {
  cd "${srcdir}/${_PKGNAME}_${pkgver}"

  make -j1 all
}

package(){
  # Install all headers
  cd "${srcdir}/${_PKGNAME}_${pkgver}/include"
  install -m 755 -d "${pkgdir}/usr/include/${pkgname}"
  install -D -m644 -- *.h "${pkgdir}/usr/include/${pkgname}"

  # Install all libraries
  cd "${srcdir}/${_PKGNAME}_${pkgver}/lib"
  install -m 755 -d "${pkgdir}/usr/lib"
  for _file in *.so; do
    cp -a "${_file}" "${pkgdir}/usr/lib/${_file}"
    chmod 755 "${pkgdir}/usr/lib/${_file}"
  done

  # Install mpiseq headers
  cd "${srcdir}/${_PKGNAME}_${pkgver}/libseq"
  install -m 755 -d "${pkgdir}/usr/include/mpiseq"
  install -D -m644 -- *.h "${pkgdir}/usr/include/mpiseq"
  # Install mpiseq libraries
  ln -sf "libmpiseq-${pkgver}.so" libmpiseq.so
  install -m 755 -d "${pkgdir}/usr/lib"
  for _file in *.so; do
    cp -a "${_file}" "${pkgdir}/usr/lib/${_file}"
    chmod 755 "${pkgdir}/usr/lib/${_file}"
  done

  # Install license
  install -D -m644 "${srcdir}/${_PKGNAME}_${pkgver}/LICENSE"\
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install doc
  #install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  #install -D -m644 "${srcdir}/${_PKGNAME}_${pkgver}/doc/userguide_${pkgver}.pdf"\
    #"${pkgdir}/usr/share/doc/${pkgname}/userguide_${pkgver}.pdf"

  # Install examples
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}/examples"
  cd "${srcdir}/${_PKGNAME}_${pkgver}/examples"
  install -m 644 * "${pkgdir}/usr/share/doc/${pkgname}/examples"
  for _FILE in ssimpletest dsimpletest csimpletest zsimpletest c_example; do
    chmod 0755 "${pkgdir}/usr/share/doc/${pkgname}/examples/${_FILE}"
  done
  rm -- "${pkgdir}/usr/share/doc/${pkgname}/examples/"*.o
}
