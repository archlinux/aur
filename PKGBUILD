# Maintainer : Jörg Behrmann <behrmann@physik.fu-berlin.de>
# Contributer: eolianoe <eolianoe At GoogleMAIL DoT CoM>
# Contributor: Michele Mocciola <mickele>
# Contributor: Guillaume Dollé <dolle dot guillaume at gmail dot com >

pkgname=mumps-seq-shared
_pkgname=mumps
pkgver=5.3.5
pkgrel=1
pkgdesc="Sparse solver library using Gaussian elimination (sequential version, shared library version)"
url="http://mumps.enseeiht.fr"
license=('custom')
depends=('gcc-libs' 'blas' 'lapack' 'metis' 'scotch')
provides=('mumps')
conflicts=('mumps' 'mumps-seq')
arch=('any')
source=("http://mumps.enseeiht.fr/${_pkgname^^}_${pkgver}.tar.gz"
        "Makefile.seq.inc"
        "shared-libseq.patch"
        "shared-pord.patch"
        "shared-mumps.patch")
sha256sums=('e5d665fdb7043043f0799ae3dbe3b37e5b200d1ab7a6f7b2a4e463fd89507fa4'
            '1a3d973ca91854bc2b0ab3b9813e09a598309e6c10ac65af8a139db5e1146cdc'
            '68b5b924dc1a4837b81c6efc5c36160bbd5ea5adcefb55939d7a615c16352338'
            '05e8b966828aa447a78770f8049d713f5d67bebb0137bc040b91f881c103fbb4'
            '9ab7a80a65051916eeabe69d693648b513a6b0ebdb83e6b12de63cf2015776a6')

prepare(){
  cd "${srcdir}/${_pkgname^^}_${pkgver}"

  # Makefile and patches are taking from Debian
  # https://salsa.debian.org/science-team/mumps/tree/master/debian
  ln -sf "${srcdir}/Makefile.seq.inc" Makefile.inc

  patch -p1 <../shared-pord.patch
  patch -p1 <../shared-mumps.patch
  patch -p1 <../shared-libseq.patch
}

build() {
  cd "${srcdir}/${_pkgname^^}_${pkgver}"

  export VERSION=${pkgver}
  export SOVERSION=5

  make -j1 all
}

package(){
  # Install all headers
  cd "${srcdir}/${_pkgname^^}_${pkgver}/include"
  install -m 755 -d "${pkgdir}/usr/include/${pkgname}"
  install -D -m644 -- *.h "${pkgdir}/usr/include/${pkgname}"

  # Install all libraries
  cd "${srcdir}/${_pkgname^^}_${pkgver}/lib"
  install -m 755 -d "${pkgdir}/usr/lib"
  for _file in *.so; do
    cp -a "${_file}" "${pkgdir}/usr/lib/${_file}"
    chmod 755 "${pkgdir}/usr/lib/${_file}"
  done

  # Install mpiseq headers
  cd "${srcdir}/${_pkgname^^}_${pkgver}/libseq"
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
  install -D -m644 "${srcdir}/${_pkgname^^}_${pkgver}/LICENSE"\
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install doc
  #install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  #install -D -m644 "${srcdir}/${_pkgname^^}_${pkgver}/doc/userguide_${pkgver}.pdf"\
    #"${pkgdir}/usr/share/doc/${pkgname}/userguide_${pkgver}.pdf"

  # Install examples
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}/examples"
  cd "${srcdir}/${_pkgname^^}_${pkgver}/examples"
  install -m 644 * "${pkgdir}/usr/share/doc/${pkgname}/examples"
  for _FILE in ssimpletest dsimpletest csimpletest zsimpletest c_example; do
    chmod 0755 "${pkgdir}/usr/share/doc/${pkgname}/examples/${_FILE}"
  done
  rm -- "${pkgdir}/usr/share/doc/${pkgname}/examples/"*.o
}
