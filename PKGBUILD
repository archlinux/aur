# $Id: PKGBUILD 57440 2011-10-27 20:16:15Z lcarlier $
# Maintainer: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=gromacs-2018-complete
pkgver=2018.8
pkgrel=3
pkgdesc='A versatile package to perform molecular dynamics, i.e. simulate the Newtonian equations of motion for systems with hundreds to millions of particles.'
url='http://www.gromacs.org/'
license=("LGPL")
arch=('x86_64')
depends=('lapack' 'zlib' 'libx11')
optdepends=('cuda: Nvidia GPU support'
            'vmd: Accesibility to other trajectory formats (ONLY WHEN COMPILING)' 
            'perl: needed for demux.pl and xplor2gmx.pl'
	    'opencl-mesa: OpenCL support for AMD GPU'
	    'opencl-nvidia: OpenCL support for Nvidia GPU')
makedepends=('cmake' 'libxml2' 'hwloc')
options=('!libtool')
source=(http://ftp.gromacs.org/pub/gromacs/gromacs-${pkgver}.tar.gz
        GMXRC.bash.cmakein.patch)
sha256sums=('776923415df4bc78869d7f387c834141fdcda930b2e75be979dc59ecfa6ebecf'
            'b345e0d81a4f7ce7ee1719c4ce78096a1105a12bae9c8696b09bf1187ae35c3a')

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
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_SHARED_LIBS=ON \
        -DGMX_DOUBLE=ON \
        -DGMX_BUILD_OWN_FFTW=ON \
        -DREGRESSIONTEST_DOWNLOAD=ON
        #-DGMX_SIMD=AVX_512 \
        #-DGMX_SIMD=AVX2_256 \
        #-DGMX_SIMD=AVX_256 \
  make

  msg2 "Building the single precision files"
  cd ${srcdir}/single
  cmake ../gromacs-${pkgver}/ \
        -DCMAKE_INSTALL_PREFIX=/usr/local/gromacs/gromacs-${pkgver}/ \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_SHARED_LIBS=ON \
        -DGMX_BUILD_OWN_FFTW=ON \
        -DREGRESSIONTEST_DOWNLOAD=ON
        #-DGMX_SIMD=AVX_512 \
        #-DGMX_SIMD=AVX2_256 \
        #-DGMX_SIMD=AVX_256 \
  make
}

check () {
  msg2 "Testing double precision compilation"
  cd ${srcdir}/double
  make check
  msg2 "Testing single precision compilation"
  cd ${srcdir}/single
  make check
}

package() {
  msg2 "Making the single precision executables"
  cd ${srcdir}/single
  make  DESTDIR=${pkgdir} install

  msg2 "Making the double precision executables"
  cd ${srcdir}/double
  make DESTDIR=${pkgdir} install
}
