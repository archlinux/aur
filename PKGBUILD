# Maintainer: Luis Sarmiento <Luis.Sarmiento-ala-nuclear.lu.se>

pkgname=upak
pkgver=10.6.8
pkgrel=8
pkgdesc="HRIBF Data Acquisition and analysis."
url="ftp://ftp.phy.ornl.gov/pub/upak/README.html"
arch=('x86_64')
license=('unknown')
depends=('libx11' 'tcsh' 'bash')
makedepends=('gcc-fortran>=4.2')
options=(staticlibs emptydirs)
source=("ftp://ftp.phy.ornl.gov/pub/${pkgname}/${pkgname}-src.tar.gz"
  "Dscanor.Makefile.patch"
  "upak.install")
md5sums=('bcdddfd685f4a19cd93452be18de238b'
         'ec5128392e9f7b52a3e5dc5650cd7de5'
         '7d8e9e7ec0f6ed54683a65f640899e20')
install="${pkgname}.install"

prepare() {

  #
  #  diff -puN src/upak/Dscanor/Makefile Dscanor.Makefile > Dscanor.Makefile.patch
  #
  msg 'patch Dscanor Makefile'
  cd "${srcdir}/${pkgname}/Dscanor"
  patch -Np3 < ${srcdir}/Dscanor.Makefile.patch

}

package() {

  ## compile
  cd "${srcdir}/${pkgname}"
  make clean
  make -j1 INSTALLDIR="${pkgdir}/usr/bin" all

  ## documentation (0)
  _DOCDIR=${pkgdir}/usr/share/doc/${pkgname}
  [ -d ${_DOCDIR} ] || install -d ${_DOCDIR}

  #  correct the location of the doc dir and change executable permissions
  install -m644 ${pkgdir}/usr/bin/doc/*  ${_DOCDIR}
  rm -rf ${pkgdir}/usr/bin/doc

  # correct the location of the file and create DOC dir
  install -Dm644 ${pkgdir}/usr/bin/*.{hep,ps,dat,make,f} ${_DOCDIR}

  #clean bin directory from what is already placed in the doc dir.
  rm -f ${pkgdir}/usr/bin/*.{hep,ps,dat,make,f}

  ## libraries
  _LIBDIR=${pkgdir}/usr/lib
  [ -d ${_LIBDIR} ] || install -d ${_LIBDIR}

  install -Dm644 ${pkgdir}/usr/bin/*.{a,o} ${pkgdir}/usr/lib/

  #clean bin directory from what is already placed in the lib dir.
  rm -f ${pkgdir}/usr/bin/*.{a,o}

  ## others
  cd "${srcdir}/${pkgname}"
  install -m644 Dreadme/README-Apr07     ${_DOCDIR}
  install -m644 Dreadme/readme.{tex,doc} ${_DOCDIR}
  install -m644 Dreadme/dvd.{tex,doc}    ${_DOCDIR}

}
