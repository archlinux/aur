# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT CoM>
# Contributor: Michele Mocciola <mickele>
# Contributor: Guillaume Dollé <dolle dot guillaume at gmail dot com >
_pkgname=MUMPS
pkgname=${_pkgname,,}-seq
pkgver=5.6.1
pkgrel=2
pkgdesc="Sparse solver library using Gaussian elimination (sequential version)"
url="http://${_pkgname,,}-solver.org"
license=('custom')
depends=(gcc-libs lapack metis)
makedepends=(gcc-fortran)
provides=(${_pkgname,,})
conflicts=(${_pkgname,,} ${_pkgname,,}-par)
arch=('i686' 'x86_64')
source=(${url}/${_pkgname}_${pkgver}.tar.gz)
sha512sums=('7d0f7e6e852a967ee93b7eac1a13b491d85e1c3fa39df8c5aed6f12069f0a4f8ee369c049fddba52f19f60ff579eff189e5546a7dd41a1de0a80d915398f0f53')

prepare() {
  sed -i 's/cc/gcc/' ${_pkgname}_${pkgver}/Make.inc/Makefile.inc.generic.SEQ
  sed -i 's/f90/gfortran/' ${_pkgname}_${pkgver}/Make.inc/Makefile.inc.generic.SEQ
  sed -i 's/#LMETISDIR = \/opt\/metis-5.1.0\/build\/Linux-x86_64\/libmetis/LMETISDIR = \/usr\/lib/' ${_pkgname}_${pkgver}/Make.inc/Makefile.inc.generic.SEQ
  sed -i 's/#IMETIS    = \/opt\/metis-5.1.0\/include/IMETIS    = \/usr\/include/' ${_pkgname}_${pkgver}/Make.inc/Makefile.inc.generic.SEQ
  sed -i 's/^#LMETIS    = -L$(LMETISDIR) -lmetis/LMETIS    = -L$(LMETISDIR) -lmetis/' ${_pkgname}_${pkgver}/Make.inc/Makefile.inc.generic.SEQ
  sed -i 's/^ORDERINGSF  = -Dpord/ORDERINGSF  = -Dpord -Dmetis/' ${_pkgname}_${pkgver}/Make.inc/Makefile.inc.generic.SEQ
  sed -i 's/^OPTF    = -O/OPTF    = -O2 -fPIC --std=legacy/' ${_pkgname}_${pkgver}/Make.inc/Makefile.inc.generic.SEQ
  sed -i 's/^OPTC    = -O -I./OPTC    = $(CFLAGS) -fPIC -I./' ${_pkgname}_${pkgver}/Make.inc/Makefile.inc.generic.SEQ
  sed -i 's/^OPTL    = -O/OPTL    = $(LDFAGS)/' ${_pkgname}_${pkgver}/Make.inc/Makefile.inc.generic.SEQ
  cd ${_pkgname}_${pkgver}
  cp Make.inc/Makefile.inc.generic.SEQ Makefile.inc
}

build() {
  cd "${srcdir}"/${_pkgname}_${pkgver}
  make all

  # Convert static libs to shared libs
  # for mumps libs
  cd "${srcdir}"/${_pkgname}_${pkgver}/lib
  _libs=$(find . -maxdepth 1 -regex ".*\.a" | xargs | sed "s|\.a||g")
  for _FILE in ${_libs}; do
    ld -Bshareable -o ${_FILE}_seq.so.${pkgver} -x -soname ${_FILE}_seq.so --whole-archive ${_FILE}.a
  done
  # for mpiseq libs
  cd "${srcdir}/${_pkgname}_${pkgver}/libseq"
  ld -Bshareable -o libmpiseq.so.${pkgver} -x -soname libmpiseq.so --whole-archive libmpiseq.a
}

package() {
  # Install all headers
  cd "${srcdir}/${_pkgname}_${pkgver}/include"
  install -m 755 -d "${pkgdir}/usr/include"
  install -D -m644 -- *.h "${pkgdir}/usr/include"

  # Install all libraries
  cd "${srcdir}/${_pkgname}_${pkgver}/lib"
  install -m 755 -d "${pkgdir}/usr/lib"
  _libs=$(find . -maxdepth 1 -regex ".*\.a" | xargs | sed "s|\.a||g")
  for _FILE in ${_libs}; do
    install -m 755 ${_FILE}_seq.so.${pkgver} "${pkgdir}/usr/lib"
    ln -sf ${_FILE}_seq.so.${pkgver} "${pkgdir}/usr/lib/${_FILE}_seq.so.${pkgver:0:1}"
  done

  # Install mumps_seq headers
  cd "${srcdir}/${_pkgname}_${pkgver}/libseq"
  install -m 755 -d "${pkgdir}/usr/include/mumps_seq"
  install -D -m644 -- *.h "${pkgdir}/usr/include/mumps_seq"
  # Install mpiseq libraries
  install -m 755 libmpiseq.so.${pkgver} "${pkgdir}/usr/lib"
  ln -sf libmpiseq.so.${pkgver} "${pkgdir}/usr/lib/libmpiseq.so.${pkgver:0:1}"

  # Install license
  install -D -m644 "${srcdir}/${_pkgname}_${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install doc
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -D -m644 "${srcdir}/${_pkgname}_${pkgver}/doc/userguide_${pkgver}.pdf" \
    "${pkgdir}/usr/share/doc/${pkgname}/userguide_${pkgver}.pdf"

  # Install examples
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}/examples"
  cd "${srcdir}/${_pkgname}_${pkgver}/examples"
  install -m 644 * "${pkgdir}/usr/share/doc/${pkgname}/examples"
  for _FILE in ssimpletest dsimpletest csimpletest zsimpletest c_example; do
    chmod 0755 "${pkgdir}/usr/share/doc/${pkgname}/examples/${_FILE}"
  done
  rm -- "${pkgdir}/usr/share/doc/${pkgname}/examples/"*.o
}
