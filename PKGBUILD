# $Id: PKGBUILD 57440 2011-10-27 20:16:15Z lcarlier $
# Contributor: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=gromacs-plumed
pkgver=2016.1
_gromacsver=2016.1
_plumedver=2.3
pkgrel=1
pkgdesc='GROMACS is a versatile package to perform molecular dynamics, i.e. simulate the Newtonian equations of motion for systems with hundreds to millions of particles. (Plumed patched)'
url='http://www.gromacs.org/'
license=("LGPL")
arch=('i686' 'x86_64')
depends=('plumed' 'fftw' 'lesstif' 'perl' 'libxml2' 'libsm' 'libx11' 'gcc5')
makedepends=('cmake')
options=('!libtool')
source=(ftp://ftp.gromacs.org/pub/gromacs/gromacs-${pkgver}.tar.gz)
sha1sums=('2d6d80e13dad28fe5bd222785c1658a698f6ae47')

#With gcc5 currently there are less errors in the tests
# also the compilation is possible in cuda capable machines
export CC=gcc-5
export CXX=g++-5

export VMDDIR=/usr/lib/vmd/ #If vmd is available at compilation time
                            #Gromacs will have the ability to read any
                            #trajectory file format that can be read by
                            #VMD installation (e.g. AMBER's DCD format). 
prepare() {
  msg2 "Patching plumed for gromacs"
  cd ${srcdir}/gromacs-${pkgver}
  plumed patch -p -e gromacs-${_gromacsver} --shared
}

build() {
  mkdir -p ${srcdir}/single

  msg2 "Building the single precision files"
  cd ${srcdir}/single
  cmake ../gromacs-${_gromacsver} \
        -DCMAKE_INSTALL_PREFIX=/usr/ \
        -DBUILD_SHARED_LIBS=OFF \
        -DGMX_BUILD_MDRUN_ONLY=ON
  make

}

check () {
  cd ${srcdir}/single
  make check
}

package() {
  msg2 "Making the single precision executables"
  cd ${srcdir}/single 
  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/usr/share
  rm  ${pkgdir}/usr/bin/gmx-completion-mdrun.bash
  mv  ${pkgdir}/usr/bin/mdrun ${pkgdir}/usr/bin/mdrun_plumed
}
