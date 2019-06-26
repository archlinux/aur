# Maintainer: Luis Sarmiento <Luis.Sarmiento-ala-nuclear.lu.se>

pkgname=upak
pkgver=10.6.8 # <-- current source doesn't have a version. We keep the last known one
pkgrel=9
pkgdesc="HRIBF Data Acquisition and analysis."
url="ftp://ftp.phy.ornl.gov/pub/upak/README.html"
arch=('x86_64')
license=('unknown')
depends=('libx11' 'tcsh' 'bash')
makedepends=('gcc-fortran>=4.2')
options=(staticlibs emptydirs)
source=("ftp://ftp.phy.ornl.gov/pub/${pkgname}/${pkgname}-src.tgz"
  "upak.install")
md5sums=('6fda860ff33eda39c2914f34453ce96b'
         '7d8e9e7ec0f6ed54683a65f640899e20')


install="${pkgname}.install"

package() {

  ## compile
  cd "${srcdir}/${pkgname}"
  make clean
  make -j1 INSTALLDIR="${pkgdir}/usr/bin" all  # <-- this already goes to ${pkgdir} therefore must be package() not build()

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
