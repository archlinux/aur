# Maintainer : Jörg Behrmann <behrmann@physik.fu-berlin.de>
# Contributer: eolianoe <eolianoe At GoogleMAIL DoT CoM>
# Contributor: Michele Mocciola <mickele>
# Contributor: Guillaume Dollé <dolle dot guillaume at gmail dot com >

pkgname=mumps-seq-shared
_pkgname=mumps
_PKGNAME=MUMPS
pkgver=5.0.2
pkgrel=1
pkgdesc="Sparse solver library using Gaussian elimination (sequential version, shared library version)"
url="http://mumps.enseeiht.fr"
license=('custom')
depends=('gcc-libs' 'blas' 'metis')
provides=('mumps')
conflicts=('mumps' 'mumps-seq')
arch=('any')
source=("http://mumps.enseeiht.fr/${_PKGNAME}_${pkgver}.tar.gz"
        "Makefile.seq.inc"
        "shared-libseq.patch"
        "shared-pord.patch"
        "shared-mumps.patch"
        "shared-mumps-makefile.patch")
sha256sums=('77292b204942640256097a3da482c2abcd1e0d5a74ecd1d4bab0f5ef6e60fe45'
            '45e54b8280f3f59576a3cc692a299483abd20a3f35f041ec09eda11d42b5fc4d'
            '64761306fb864ecc039bb3342e52c5147f40d05c9c9cb1caf946192a1875b398'
            '8bc83f91d34b90a18c5104e01463c956902969b692a79d1f1a1a5410e43cf615'
            '433f8ad140190dca546672f1b4bcfb632c441324da9177c1dbb8db797c5c5020'
            '9a7efa79a97247d4bbbf9de7df1054359c16e17568afc4ca6663be7f9b933ee8')

prepare(){
  cd "${srcdir}/${_PKGNAME}_${pkgver}"

  ln -sf "${srcdir}/Makefile.seq.inc" Makefile.inc

  patch "${srcdir}/${_PKGNAME}_${pkgver}/libseq/Makefile" "../shared-libseq.patch"
  patch "${srcdir}/${_PKGNAME}_${pkgver}/PORD/lib/Makefile" "../shared-pord.patch"
  patch "${srcdir}/${_PKGNAME}_${pkgver}/src/Makefile" "../shared-mumps.patch"
  patch "${srcdir}/${_PKGNAME}_${pkgver}/Makefile" "../shared-mumps-makefile.patch"
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
  install -D -m644 -- *.so "${pkgdir}/usr/lib"

  # Install mpiseq headers
  cd "${srcdir}/${_PKGNAME}_${pkgver}/libseq"
  install -m 755 -d "${pkgdir}/usr/include/mpiseq"
  install -D -m644 -- *.h "${pkgdir}/usr/include/mpiseq"
  # Install mpiseq libraries
  install -m 755 libmpiseq.so "${pkgdir}/usr/lib"

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
