# Maintainer: Luis Sarmiento <lgsarmientop-ala-unal.edu.co>

pkgname=upak
pkgver=10.6.8
pkgrel=5
pkgdesc="HRIBF Data Acquisition and analysis."
url="ftp://ftp.phy.ornl.gov/pub/upak/README.html"
arch=('i686' 'x86_64')
license=('unknown')
depends=('libx11' 'gcc-libs' 'tcsh' 'bash')
makedepends=('gcc-fortran>=4.2')
options=(staticlibs emptydirs)
source=("ftp://ftp.phy.ornl.gov/pub/${pkgname}/${pkgname}-src.tgz"
  "gfortran_x86_64.patch"
  "gfortran_i686.patch"
  "upak.install")
md5sums=('8ea938e72020b75cf1ca356d27821823'
         'fe89246ccc894cee04f20e590bab1b36'
         'a11d01b14c15731d21ee009de8dd3a9a'
         '1f5d22a84125d8cbcc6ee2fdfe73ffd4')
install="${pkgname}.install"
package() {

msg 'patch main Makefile'
  cd "${srcdir}/${pkgname}"
  if [ ${CARCH} == 'x86_64' ]; then
    patch -Np2 < ${srcdir}/gfortran_x86_64.patch
  else
    patch -Np2 < ${srcdir}/gfortran_i686.patch
  fi

##compile
  cd "${srcdir}/${pkgname}"
  make clean
  make -j1 INSTALLDIR="${pkgdir}/usr/bin" all

#libraries
  [ -d ${pkgdir}/usr/lib ] || install -d ${pkgdir}/usr/lib
  install -Dm644 ${pkgdir}/usr/bin/*.{a,o} ${pkgdir}/usr/lib/
#  rm -f ${pkgdir}/usr/bin/*.{a,o}

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
