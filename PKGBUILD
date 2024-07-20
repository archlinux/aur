# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT CoM>
# Contributor: Michele Mocciola <mickele>
# Contributor: Guillaume Dollé <dolle dot guillaume at gmail dot com >
_pkgname=MUMPS
pkgname=${_pkgname,,}-seq
pkgver=5.7.3
pkgrel=1
pkgdesc="Sparse solver library using Gaussian elimination (sequential version)"
url="https://${_pkgname,,}-solver.org"
license=(CECILL-C)
depends=(gcc-libs lapack) # metis
makedepends=(gcc-fortran)
provides=(${_pkgname,,})
conflicts=(${_pkgname,,} ${_pkgname,,}-par ${_pkgname,,}-seq-shared)
arch=('i686' 'x86_64')
source=(${url}/${_pkgname}_${pkgver}.tar.gz
  Makefile.inc
  makefile_version.patch)
sha512sums=('abe97bc948c1e067fc1e1b810d6625afa8145fe9a5fe25c893ca2fbf254da77dd6891ddeba9f39fd26ac51234b2f5cdf0bebf70784795d8cbcfce1d95b1bf435'
            'd7f076defe93704bf503612d0844f71698e2ca84b50ce551748c3b1bc972a2232c735a1ba02c038bf3468fe1eeac0411e66ed436339cb50978a3e2679c813364'
            '6719a8fcb1c553514fc9b2c2c0389ac082ff69c86c0cf5b3e3a0d601ee27c32c1eb644b9419fbc600d3a81ccf38fafe1684d566328b9cd90771e651245c75424')

prepare() {
  cd "${srcdir}"/${_pkgname}_${pkgver}
  patch -p1 -i ../makefile_version.patch
  cp "${srcdir}"/Makefile.inc .
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
