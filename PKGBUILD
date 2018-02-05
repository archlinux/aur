# Maintainer: Michele Mocciola <mickele>
# Contributor: Guillaume Dollé < dolle dot guillaume at gmail dot com >
# Contributor: Lucas H. Gabrielli
pkgname=mumps
pkgver=5.1.2
pkgrel=1
pkgdesc="Sparse solver library using Gaussian elimination"
url="http://mumps.enseeiht.fr"
license=("custom")
depends=('lapack' 'openmpi' 'scotch>=6.0.3-3' 'scalapack' 'metis' 'zlib' 'bzip2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
arch=('i686' 'x86_64')
source=(http://mumps.enseeiht.fr/MUMPS_${pkgver}.tar.gz
        Makefile.inc)
sha256sums=('eb345cda145da9aea01b851d17e54e7eef08e16bfa148100ac1f7f046cd42ae9'
						'a19770669d0e0f1de47b1173f4aaeca405d93492966078fecc344abc37cc1b67')

build() {
  cd "${srcdir}/MUMPS_${pkgver}"
  cp "${srcdir}/Makefile.inc" .

  make -j1 all || return 1
}

package(){
  # Install all headers
  cd "${srcdir}/MUMPS_${pkgver}/include"
  install -m 755 -d "${pkgdir}/usr/include"
  install -D -m644 *.h "${pkgdir}/usr/include"

  # Install all libraries
  cd "${srcdir}/MUMPS_${pkgver}/lib" || return 1
  install -m 755 -d "${pkgdir}/usr/lib" || return 1
  install -D -m644 lib*.a ${pkgdir}/usr/lib || return 1
  for _FILE in `ls *.a | sed "s|\.a||"`; do
      ld -Bshareable -o ${_FILE}.so.${pkgver} -x -soname ${_FILE}.so --whole-archive ${_FILE}.a
      install -m 644 -D ${_FILE}.a ${pkgdir}/usr/lib/${_FILE}.a
      install -m 755 ${_FILE}.so.${pkgver} ${pkgdir}/usr/lib
      ln -sf ${_FILE}.so.${pkgver} ${pkgdir}/usr/lib/${_FILE}.so.${pkgver:0:1}
  done

  # Install libraries mpiseq
  cd "${srcdir}/MUMPS_${pkgver}/libseq"
  install -m 755 -d "${pkgdir}/usr/include/mpiseq"
  install -D -m644 *.h "${pkgdir}/usr/include/mpiseq"
  cd "${srcdir}/MUMPS_${pkgver}/libseq"
  install -D -m644 lib*.a ${pkgdir}/usr/lib
  for _FILE in `ls *.a | sed "s|\.a||"`; do
      ld -Bshareable -o ${_FILE}.so.${pkgver} -x -soname ${_FILE}.so --whole-archive ${_FILE}.a
      install -m 644 -D ${_FILE}.a ${pkgdir}/usr/lib/${_FILE}.a
      install -m 755 ${_FILE}.so.${pkgver} ${pkgdir}/usr/lib
      ln -sf ${_FILE}.so.${pkgver} ${pkgdir}/usr/lib/${_FILE}.so.${pkgver:0:1}
  done

  # Install examples
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}/examples"
  cd "${srcdir}/MUMPS_${pkgver}/examples"
  install -m 644 * "${pkgdir}/usr/share/doc/${pkgname}/examples"
  for _FILE in ssimpletest dsimpletest csimpletest zsimpletest c_example; do
    chmod 0755 "${pkgdir}/usr/share/doc/${pkgname}/examples/${_FILE}"
  done

  # Install license
  install -D -m644 "${srcdir}/MUMPS_${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
