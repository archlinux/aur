# Maintainer: Luis Sarmiento <Luis.Sarmiento-ala-nuclear.lu.se>

pkgname=upak
pkgver=10.6.8
pkgrel=7
pkgdesc="HRIBF Data Acquisition and analysis."
url="ftp://ftp.phy.ornl.gov/pub/upak/README.html"
arch=('i686' 'x86_64')
license=('unknown')
depends=('libx11' 'tcsh' 'bash')
makedepends=('gcc-fortran>=4.2')
options=(staticlibs emptydirs)
source=("ftp://ftp.phy.ornl.gov/pub/${pkgname}/${pkgname}-src.tgz"
  "gfortran_x86_64.patch"
  "gfortran_i686.patch"
  "upak.install")
md5sums=('c167fd178279d88e05320c7e580b05b4'
         'cb904633d49f17c707515646c2bd2338'
         'd1accbca0c14b8499870577b3e2fe05f'
         '7d8e9e7ec0f6ed54683a65f640899e20')
install="${pkgname}.install"

prepare() {

  msg 'patch main Makefile'
  cd "${srcdir}/${pkgname}"
  if [ ${CARCH} == 'x86_64' ]; then
    patch -Np2 < ${srcdir}/gfortran_x86_64.patch
  else
    patch -Np2 < ${srcdir}/gfortran_i686.patch
  fi

}

package() {

  ##compile
  cd "${srcdir}/${pkgname}"
  make clean
  make -j1 INSTALLDIR="${pkgdir}/usr/bin" all

  #libraries
  [ -d ${pkgdir}/usr/lib ] || install -d ${pkgdir}/usr/lib
 install -Dm644 ${pkgdir}/usr/bin/*.{a,o} ${pkgdir}/usr/lib/
  rm -f ${pkgdir}/usr/bin/*.{a,o}

  #documentation
  _DOCDIR=${pkgdir}/usr/share/doc/${pkgname}
  [ -d ${_DOCDIR} ] || install -d ${_DOCDIR}
  install -Dm644 ${pkgdir}/usr/bin/*.{hep,ps,dat} ${_DOCDIR}

  #correct the location of the doc dir and change executable permissions
  install -m644 ${pkgdir}/usr/bin/doc/*  ${_DOCDIR}
  rm -rf ${pkgdir}/usr/bin/doc

  cd "${srcdir}/${pkgname}"
  install -m644 Dreadme/README-Apr07   ${_DOCDIR}
  install -m644 Dreadme/readme.{tex,doc} ${_DOCDIR}
  install -m644 Dreadme/dvd.{tex,doc} ${_DOCDIR}

  #clean bin directory from everything else already placed in the doc dir.
  rm -f ${pkgdir}/usr/bin/*.*

  msg 'Change permissions to the usual 755 for bin files'
  chmod 755 ${pkgdir}/usr/bin/*

}
