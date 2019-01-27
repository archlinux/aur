# $Id: PKGBUILD 57440 2011-10-27 20:16:15Z lcarlier $
# Maintainer: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=gromacs-5.0-complete
pkgver=5.0.7
pkgrel=7
pkgdesc='A versatile package to perform molecular dynamics, i.e. simulate the Newtonian equations of motion for systems with hundreds to millions of particles.'
url='http://www.gromacs.org/'
license=("LGPL")
arch=('i686' 'x86_64')
depends=('lapack' 'zlib' 'libx11')
optdepends=('cuda: Nvidia GPU support'
            'openmotif:  needed for gmx view'
            'perl: needed for demux.pl and xplor2gmx.pl')
makedepends=('cmake' 'libxml2' 'hwloc')
options=('!libtool')
source=(ftp://ftp.gromacs.org/pub/gromacs/gromacs-${pkgver}.tar.gz
        GMXRC.bash.cmakein.patch)
sha1sums=('29fd9c13874d26c1e18cd45ec74bd2d9be0b78c1'
          '014b2cbfa13db9b495c88f653805c330747117dc')

export VMDDIR=/usr/lib/vmd/ #If vmd is available at compilation time
                            #Gromacs will have the ability to read any
                            #trajectory file format that can be read by
                            #VMD installation (e.g. AMBER's DCD format). 


prepare() {
cd ${srcdir}/gromacs-${pkgver}/scripts/
ls
patch -p0 -i ${srcdir}/GMXRC.bash.cmakein.patch
}


build() {
  mkdir -p ${srcdir}/{single,double}

  msg2 "Building the double precision files"
  cd ${srcdir}/double
  cmake ../gromacs-${pkgver}/ \
    -DCMAKE_INSTALL_PREFIX=/usr/local/gromacs/gromacs-${pkgver}/ \
    -DBUILD_SHARED_LIBS=ON \
    -DGMX_X11=ON \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DGMX_DOUBLE=ON \
    -DGMX_GPU=OFF \
    -DREGRESSIONTEST_DOWNLOAD=ON \
    -DGMX_BUILD_OWN_FFTW=ON \
    -DGMX_LIBS_SUFFIX=_d
  make

  msg2 "Building the single precision files"
  cd ${srcdir}/single
  cmake ../gromacs-${pkgver}/ \
    -DCMAKE_INSTALL_PREFIX=/usr/local/gromacs/gromacs-${pkgver}/ \
    -DBUILD_SHARED_LIBS=ON \
    -DGMX_X11=ON \
    -DREGRESSIONTEST_DOWNLOAD=ON \
    -DGMX_BUILD_OWN_FFTW=ON \
    -DGMX_GPU=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
    #For gromacs 5 in combination of CUDA 8
    #-DCMAKE_CXX_FLAGS="-std=c++11" \
  make
}

check () {
  msg2 "Testing double precision compilation"
  cd ${srcdir}/double
#  make check
  msg2 "Testing single precision compilation"
  cd ${srcdir}/single
#  make check
}

package() {

  msg2 "Making the single precision executables"
  cd ${srcdir}/single
  make DESTDIR=${pkgdir} install

  # Cleaning up, kept the csh completion at default location
  msg2 "Making the double precision executables"
  cd ${srcdir}/double
  make DESTDIR=${pkgdir} install

}
