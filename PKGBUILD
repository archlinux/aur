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
  sed -i 's/LIBEXT  = .a/LIBEXT  = .so/' ${_pkgname}_${pkgver}/Make.inc/Makefile.inc.generic.SEQ
  sed -i 's/#LMETISDIR = \/opt\/metis-5.1.0\/build\/Linux-x86_64\/libmetis/LMETISDIR = \/usr\/lib/' ${_pkgname}_${pkgver}/Make.inc/Makefile.inc.generic.SEQ
  sed -i 's/#IMETIS    = \/opt\/metis-5.1.0\/include/IMETIS    = \/usr\/include/' ${_pkgname}_${pkgver}/Make.inc/Makefile.inc.generic.SEQ
  sed -i 's/^#LMETIS    = -L$(LMETISDIR) -lmetis/LMETIS    = -L$(LMETISDIR) -lmetis/' ${_pkgname}_${pkgver}/Make.inc/Makefile.inc.generic.SEQ
  sed -i 's/^ORDERINGSF  = -Dpord/ORDERINGSF  = -Dpord -Dmetis/' ${_pkgname}_${pkgver}/Make.inc/Makefile.inc.generic.SEQ
  sed -i 's/^OPTF    = -O/OPTF    = -DALLOW_NON_INIT -fallow-argument-mismatch ${FFLAGS} -fPIC/' ${_pkgname}_${pkgver}/Make.inc/Makefile.inc.generic.SEQ
  sed -i 's/^OPTC    = -O -I./OPTC    = ${CFLAGS} -fPIC -I./' ${_pkgname}_${pkgver}/Make.inc/Makefile.inc.generic.SEQ
  sed -i 's/^OPTL    = -O/OPTL    = ${LDFLAGS} -fPIC/' ${_pkgname}_${pkgver}/Make.inc/Makefile.inc.generic.SEQ
  cd ${_pkgname}_${pkgver}
  cp Make.inc/Makefile.inc.generic.SEQ Makefile.inc
}

build() {
  cd "${srcdir}"/${_pkgname}_${pkgver}
  make all
}

check() {
  cd "${srcdir}"/${_pkgname}_${pkgver}/examples
  make all

  export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${srcdir}/${_pkgname}_${pkgver}/lib"
  ./ssimpletest <input_simpletest_real
  ./dsimpletest <input_simpletest_real
  ./csimpletest <input_simpletest_cmplx
  ./zsimpletest <input_simpletest_cmplx
  ./c_example
  ./multiple_arithmetics_example
  ./ssimpletest_save_restore <input_simpletest_real
  ./dsimpletest_save_restore <input_simpletest_real
  ./csimpletest_save_restore <input_simpletest_cmplx
  ./zsimpletest_save_restore <input_simpletest_cmplx
  ./c_example_save_restore
}

package() {
  # Install all headers
  cd "${srcdir}/${_pkgname}_${pkgver}/include"
  install -m 755 -d "${pkgdir}/usr/include"
  install -D -m644 -- *.h "${pkgdir}/usr/include"

  # Install all libraries
  cd "${srcdir}/${_pkgname}_${pkgver}/lib"
  install -m 755 -d "${pkgdir}/usr/lib"
  install -D -m644 lib* ${pkgdir}/usr/lib

  # Install mumps_seq headers
  cd "${srcdir}/${_pkgname}_${pkgver}/libseq"
  install -m 755 -d "${pkgdir}/usr/include/mumps_seq"
  install -D -m644 -- *.h "${pkgdir}/usr/include/mumps_seq"

  # Install mpiseq libraries
  install -D -m644 lib* ${pkgdir}/usr/lib

  # Install doc
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -D -m644 "${srcdir}/${_pkgname}_${pkgver}/doc/userguide_${pkgver}.pdf" \
    "${pkgdir}/usr/share/doc/${pkgname}/userguide_${pkgver}.pdf"

  # Install examples
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}/examples"
  cd "${srcdir}/${_pkgname}_${pkgver}/examples"
  install -m 644 * "${pkgdir}/usr/share/doc/${pkgname}/examples"
  install -m 644 "${srcdir}"/${_pkgname}_${pkgver}/Makefile.inc "${pkgdir}/usr/share/doc/${pkgname}/examples"
  sed -i 's_\(topdir =\).*_\1 /usr_g; s-.*\(Makefile.inc\)-include Makefile.inc-g' "${pkgdir}/usr/share/doc/${pkgname}/examples/Makefile"
  rm -- "${pkgdir}/usr/share/doc/${pkgname}/examples/"*.o

  # Install license
  install -D -m644 "${srcdir}/${_pkgname}_${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
