# $Id: PKGBUILD 57440 2011-10-27 20:16:15Z lcarlier $
# Maintainer: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=gromacs
pkgver=2016.3
pkgrel=2
pkgdesc='A versatile package to perform molecular dynamics, i.e. simulate the Newtonian equations of motion for systems with hundreds to millions of particles.'
url='http://www.gromacs.org/'
license=("LGPL")
arch=('i686' 'x86_64')
depends=('lapack' 'zlib' 'libx11')
optdepends=('cuda: Nvidia GPU support'
            'openmotif:  needed for gmx view'
            'perl: needed for demux.pl and xplor2gmx.pl'
	    'opencl-mesa: OpenCL support for AMD GPU'
	    'opencl-nvidia: OpenCL support for Nvidia GPU')
makedepends=('cmake' 'libxml2' 'hwloc' 'gcc5')
options=('!libtool')
source=(ftp://ftp.gromacs.org/pub/gromacs/${pkgname}-${pkgver}.tar.gz)
sha1sums=('1ae1ea922b94c74f43ee066e3ea64bafa1c6c3b6')

#With gcc5 currently there are less errors in the tests
# also the compilation is possible in cuda capable machines
export CC=gcc-5
export CXX=g++-5


build() {
  mkdir -p ${srcdir}/{single,double}

  ###### CMAKE OPTIONS DISABLE BY DEFAULT ###########
  # If you are using an AVX2 capable CPU, you will #
  # not have AVX2 binaries unless you set -march to #
  # 'native', your respective architecture flag: #
  # https://gcc.gnu.org/onlinedocs/gcc-5.3.0/gcc/x86-Options.html#x86-Options #
  # or just include '-mavx2' to the default compiler#
  # flags in the /etc/makepkg.conf: #
  # https://wiki.archlinux.org/index.php/Makepkg#Architecture.2C_compile_flagsAdd #
  ###################################################
 
  msg2 "Building the double precision files"
  cd ${srcdir}/double	
  cmake ../${pkgname}-${pkgver}/ \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DGMX_X11=ON \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DGMX_DOUBLE=ON \
        -DGMX_BUILD_OWN_FFTW=ON \
        -DREGRESSIONTEST_DOWNLOAD=ON \
        -DGMX_LIBS_SUFFIX=_d
  make

  msg2 "Building the single precision files"
  cd ${srcdir}/single
  cmake ../${pkgname}-${pkgver}/ \
        -DCMAKE_INSTALL_PREFIX=/usr/ \
        -DBUILD_SHARED_LIBS=ON \
        -DGMX_X11=ON \
        -DGMX_BUILD_OWN_FFTW=ON \
        -DREGRESSIONTEST_DOWNLOAD=ON \
        -DCMAKE_INSTALL_LIBDIR=lib
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
  install -D -m755 ${srcdir}/${pkgname}-${pkgver}/src/programs/completion/gmx-completion.bash "${pkgdir}/usr/share/bash-completion/completions/gromacs"
  mv ${pkgdir}/usr/bin/GMXRC.* ${pkgdir}/etc/profile.d/
  sed "s:/usr/bin:/etc/profile.d:" ${pkgdir}/usr/bin/GMXRC > ${pkgdir}/etc/profile.d/GMXRC
  chmod 755 ${pkgdir}/etc/profile.d/GMXRC
  rm -f ${pkgdir}/usr/bin/completion.*
  rm -f ${pkgdir}/usr/bin/GMXRC
}
