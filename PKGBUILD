# $Id: PKGBUILD 57440 2011-10-27 20:16:15Z lcarlier $
# Maintainer: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=gromacs
pkgver=2019.1
pkgrel=1
pkgdesc='A versatile package to perform molecular dynamics, i.e. simulate the Newtonian equations of motion for systems with hundreds to millions of particles.'
url='http://www.gromacs.org/'
license=("LGPL")
arch=('i686' 'x86_64')
depends=('lapack' 'zlib' 'hwloc')
optdepends=('cuda: Nvidia GPU support'
            'vmd: Accesibility to other trajectory formats (ONLY WHEN COMPILING)'
            'perl: needed for demux.pl and xplor2gmx.pl'
	    'opencl-mesa: OpenCL support for AMD GPU'
	    'opencl-nvidia: OpenCL support for Nvidia GPU')
makedepends=('cmake' 'libxml2' 'hwloc' 'gcc7')
options=('!libtool')
source=(http://ftp.gromacs.org/pub/gromacs/gromacs-${pkgver}.tar.gz)
sha1sums=('f9abf82ecbe67b8dfe66874b828c4da2bb780376')

#With gcc7 currently there are less errors in the tests
# also the compilation is possible in cuda capable machines
export CC=gcc-7
export CXX=g++-7
export CFLAGS="-march=native -O2 -pipe -fstack-protector-strong -fno-plt"
export CXXFLAGS="${CFLAGS}"

export VMDDIR=/usr/lib/vmd/ #If vmd is available at compilation time
                            #Gromacs will have the ability to read any
                            #trajectory file format that can be read by
                            #VMD installation (e.g. AMBER's DCD format).

build() {
  mkdir -p ${srcdir}/{single,double}

 
  msg2 "Building the double precision files"
  cd ${srcdir}/double	
  cmake ../gromacs-${pkgver}/ \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DGMX_DOUBLE=ON \
        -DGMX_BUILD_OWN_FFTW=ON \
        -DREGRESSIONTEST_DOWNLOAD=ON
#        -DGMX_LIBS_SUFFIX=_d
#        -DBUILD_SHARED_LIBS=ON \
#        -DGMX_X11=ON \
  make

  msg2 "Building the single precision files"
  cd ${srcdir}/single
  cmake ../gromacs-${pkgver}/ \
        -DCMAKE_INSTALL_PREFIX=/usr/ \
        -DCMAKE_INSTALL_LIBDIR=lib\
        -DGMX_BUILD_OWN_FFTW=ON \
        -DREGRESSIONTEST_DOWNLOAD=ON
#        -DBUILD_SHARED_LIBS=ON \
#        -DGMX_X11=ON \
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

  # Cleaning up, kept the csh completion at default location
  msg2 "Making the double precision executables"
  cd ${srcdir}/double
  make DESTDIR=${pkgdir} install

  # installing completions in correct location and environment setup script
  msg2 "Installing completion and environment setup script"
  mkdir -p ${pkgdir}/etc/profile.d/
  mkdir -p ${pkgdir}/usr/share/bash-completion/completions
  install -D -m755 ${srcdir}/gromacs-${pkgver}/src/programs/completion/gmx-completion.bash "${pkgdir}/usr/share/bash-completion/completions/gromacs"
  mv ${pkgdir}/usr/bin/GMXRC.* ${pkgdir}/etc/profile.d/
  sed "s:/usr/bin:/etc/profile.d:" ${pkgdir}/usr/bin/GMXRC > ${pkgdir}/etc/profile.d/GMXRC
  chmod 755 ${pkgdir}/etc/profile.d/GMXRC
  rm -f ${pkgdir}/usr/bin/completion.*
  rm -f ${pkgdir}/usr/bin/GMXRC
}
