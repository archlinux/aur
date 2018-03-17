# $Id: PKGBUILD 57440 2011-10-27 20:16:15Z lcarlier $
# Contributor: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=gromacs-plumed
pkgver=2016.4
_gromacsver=2016.4
_plumedver=2.4.1
pkgrel=3
pkgdesc='GROMACS is a versatile package to perform molecular dynamics, i.e. simulate the Newtonian equations of motion for systems with hundreds to millions of particles. (Plumed patched)'
url='http://www.gromacs.org/'
license=("LGPL")
arch=('i686' 'x86_64')
depends=('lapack' 'zlib' plumed=${_plumedver})
optdepends=('cuda: Nvidia GPU support'
            'opencl-mesa: OpenCL support for AMD GPU'
	    'opencl-nvidia: OpenCL support for Nvidia GPU')
makedepends=('cmake' 'libxml2' 'hwloc' 'gcc6')
options=('!libtool')
source=(ftp://ftp.gromacs.org/pub/gromacs/gromacs-${pkgver}.tar.gz)
sha1sums=('b142c9c77e793fa8def24aeacebaf8b8f1dd55fc')

# In order to use CUDA 9 we need to use gcc6
# for machines requiring cuda 8 use gcc5 instead
export CC=gcc-6
export CXX=g++-6
export CFLAGS="-march=native -O2 -pipe -fstack-protector-strong"
export CXXFLAGS="${CFLAGS}"

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
  msg2 "Building the gromacs with plumed support (single precision)"
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
