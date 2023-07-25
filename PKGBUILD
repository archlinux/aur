# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT CoM>
# Contributor: Michele Mocciola <mickele>
# Contributor: Guillaume Dollé <dolle dot guillaume at gmail dot com >
_pkgname=MUMPS
pkgname=${_pkgname,,}-seq
pkgver=5.6.1
pkgrel=3
pkgdesc="Sparse solver library using Gaussian elimination (sequential version)"
url="http://${_pkgname,,}-solver.org"
license=('custom')
depends=(gcc-libs lapack) # metis
makedepends=(gcc-fortran)
provides=(${_pkgname,,})
conflicts=(${_pkgname,,} ${_pkgname,,}-par)
arch=('i686' 'x86_64')
source=(${url}/${_pkgname}_${pkgver}.tar.gz
  Makefile.inc
  shared-mumps.patch
  shared-libseq.patch
  shared-pord.patch
  makefile_version.patch)
sha512sums=('7d0f7e6e852a967ee93b7eac1a13b491d85e1c3fa39df8c5aed6f12069f0a4f8ee369c049fddba52f19f60ff579eff189e5546a7dd41a1de0a80d915398f0f53'
  'd7f076defe93704bf503612d0844f71698e2ca84b50ce551748c3b1bc972a2232c735a1ba02c038bf3468fe1eeac0411e66ed436339cb50978a3e2679c813364'
  '8eb7e2325a392786b3d811bdd10cfa3f55519efd52587821af4a252d4218e0355e2276a66762a8f631dd9201c45ce6eda0f47dae4f324dd2418d093bd433bcfc'
  'c3b881aa55cdce34b4192f5c08f1cfc906f8a52ad70433aaa1e17f1c0504a2d2e4a2af6777fabbb5b09b3ed313e7322b05fcb648fae335818a26e58773e36521'
  'eef8996257e0088fbdfd44a13856558dfcc8a9561774064d5d2382609391d66ae47a3678b390d4b272f7ea77ee1b8796f0eb12def6f7be561b0c9bbdc3d50b32'
  '5f306ff374ae2782f92df0b1b27659e8ee8cccbe481e59c33fe9cff492a20fceec10fb5e4c1510c0e6342ad74c87cd2dbb58b607a9d40f8d2a1c6bc9177783e4')

prepare() {
  cd "${srcdir}"/${_pkgname}_${pkgver}
  patch -p1 -i ../shared-mumps.patch
  patch -p1 -i ../shared-libseq.patch
  patch -p1 -i ../shared-pord.patch
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
