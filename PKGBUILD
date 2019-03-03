# Maintainer : Jörg Behrmann <behrmann@physik.fu-berlin.de>
# Contributer: eolianoe <eolianoe At GoogleMAIL DoT CoM>
# Contributor: Michele Mocciola <mickele>
# Contributor: Guillaume Dollé <dolle dot guillaume at gmail dot com >

pkgname=mumps-seq-shared
_pkgname=mumps
_PKGNAME=MUMPS
pkgver=5.1.2
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
        "shared-mumps.patch")
sha256sums=('eb345cda145da9aea01b851d17e54e7eef08e16bfa148100ac1f7f046cd42ae9'
            '82c19aa304ddc4cf14df7b3ad025306a8cb6a2b990e59cddac01d60bf9b388b9'
            '90741c5b9c6888a86a929cc29df87dd580872d4c930d084e4a308299ecfcda27'
            '17bc8b1b901db1bd801e53676b821a7c4b7cc7a17f6f335fa1e89e2159480366'
            'e8634b66dfeb78343b607eb7587dadab1273ea4dc7eaedd84f6f552e65613291')

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
