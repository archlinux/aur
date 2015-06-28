# Maintainer: Michele Mocciola <mickele>
# Contributor: Guillaume Dollé < dolle dot guillaume at gmail dot com >
pkgname=mumps4
pkgver=4.10.0
pkgrel=1
pkgdesc="Sparse solver library using Gaussian elimination"
url="http://mumps.enseeiht.fr"
license="custom"
depends=('lapack' 'openmpi' 'scotch>=6.0.3-3' 'scalapack' 'metis4' 'bzip2')
makedepends=()
provides=(mumps=4.10.0)
conflicts=(mumps)
replaces=()
backup=()
arch=('i686' 'x86_64')
source=(http://mumps.enseeiht.fr/MUMPS_${pkgver}.tar.gz Makefile.inc)

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
md5sums=('959e9981b606cd574f713b8422ef0d9f'
         '02f6cb0fd81a4df2ddcffcf06b576114')
