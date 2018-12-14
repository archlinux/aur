# Maintainer : eolianoe <eolianoe At GoogleMAIL DoT CoM>
# Contributor: Michele Mocciola <mickele>
# Contributor: Guillaume Dollé <dolle dot guillaume at gmail dot com >

pkgname=mumps-seq
_pkgname=mumps
_PKGNAME=MUMPS
pkgver=5.1.2
pkgrel=1
pkgdesc="Sparse solver library using Gaussian elimination (sequential version)"
url="http://mumps.enseeiht.fr"
license=('custom')
depends=('gcc-libs' 'blas' 'metis')
provides=('mumps')
conflicts=('mumps')
arch=('i686' 'x86_64')
source=("http://mumps.enseeiht.fr/${_PKGNAME}_${pkgver}.tar.gz"
        "Makefile.seq.inc")
sha256sums=('eb345cda145da9aea01b851d17e54e7eef08e16bfa148100ac1f7f046cd42ae9'
            'e73105ab186f78c14c71f8032deec0af77f9f32f6fe51381a56f0a545fd6ea3c')

prepare(){
  cd "${srcdir}/${_PKGNAME}_${pkgver}"

  ln -sf "${srcdir}/Makefile.seq.inc" Makefile.inc
}

build() {
  cd "${srcdir}/${_PKGNAME}_${pkgver}"

  make -j1 all

  # Convert static libs to shared libs
  # for mumps libs
  cd "${srcdir}/${_PKGNAME}_${pkgver}/lib"
  _libs=$(find . -maxdepth 1 -regex ".*\.a" | xargs | sed "s|\.a||g")
  for _FILE in ${_libs}; do
    ld -Bshareable -o ${_FILE}_seq.so.${pkgver} -x -soname ${_FILE}_seq.so --whole-archive ${_FILE}.a
  done
  # for mpiseq libs
  cd "${srcdir}/${_PKGNAME}_${pkgver}/libseq"
  ld -Bshareable -o libmpiseq.so.${pkgver} -x -soname libmpiseq.so --whole-archive libmpiseq.a
}

package(){
  # Install all headers
  cd "${srcdir}/${_PKGNAME}_${pkgver}/include"
  install -m 755 -d "${pkgdir}/usr/include/${pkgname}"
  install -D -m644 -- *.h "${pkgdir}/usr/include/${pkgname}"

  # Install all libraries
  cd "${srcdir}/${_PKGNAME}_${pkgver}/lib"
  install -m 755 -d "${pkgdir}/usr/lib"
  _libs=$(find . -maxdepth 1 -regex ".*\.a" | xargs | sed "s|\.a||g")
  for _FILE in ${_libs}; do
    install -m 755 ${_FILE}_seq.so.${pkgver} "${pkgdir}/usr/lib"
    ln -sf ${_FILE}_seq.so.${pkgver} "${pkgdir}/usr/lib/${_FILE}_seq.so.${pkgver:0:1}"
  done

  # Install mpiseq headers
  cd "${srcdir}/${_PKGNAME}_${pkgver}/libseq"
  install -m 755 -d "${pkgdir}/usr/include/mpiseq"
  install -D -m644 -- *.h "${pkgdir}/usr/include/mpiseq"
  # Install mpiseq libraries
  install -m 755 libmpiseq.so.${pkgver} "${pkgdir}/usr/lib"
  ln -sf libmpiseq.so.${pkgver} "${pkgdir}/usr/lib/libmpiseq.so.${pkgver:0:1}"

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
