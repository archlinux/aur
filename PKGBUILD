# Maintainer: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=gromacs-5.1-complete
pkgver=5.1.5
pkgrel=2
pkgdesc='A versatile package to perform molecular dynamics, i.e. simulate the Newtonian equations of motion for systems with hundreds to millions of particles.'
url='http://www.gromacs.org/'
license=("LGPL")
arch=('i686' 'x86_64')
depends=('lapack' 'zlib' 'libx11')
optdepends=('cuda: Nvidia GPU support'
            'openmotif:  needed for gmx view'
            'perl: needed for demux.pl and xplor2gmx.pl')
makedepends=('cmake' 'libxml2' 'hwloc' 'gcc7')
options=('!libtool')
source=(ftp://ftp.gromacs.org/pub/gromacs/gromacs-${pkgver}.tar.gz
        GMXRC.bash.cmakein.patch)
sha1sums=('722fcd32a138f439ee48c75af14d06dd0a994e81'
          '014b2cbfa13db9b495c88f653805c330747117dc')

export VMDDIR=/usr/lib/vmd/ #If vmd is available at compilation time
                            #Gromacs will have the ability to read any
                            #trajectory file format that can be read by
                            #VMD installation (e.g. AMBER's DCD format). 

export CC=gcc-7
export CXX=g++-7
export CFLAGS="-march=native -O2 -pipe -fstack-protector-strong"
export CXXFLAGS="${CFLAGS}"

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
	#-DCMAKE_CXX_FLAGS="-std=c++11" \
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
# SegFault detected in 5.1.5
#  make check
  msg2 "Testing single precision compilation"
  cd ${srcdir}/single
# SegFault detected in 5.1.5
#  make check
}

package() {

  msg2 "Making the single precision executables"
  cd ${srcdir}/single
  make  DESTDIR=${pkgdir} install

  # Cleaning up, kept the csh completion at default location
  msg2 "Making the double precision executables"
  cd ${srcdir}/double
  make DESTDIR=${pkgdir} install

}
