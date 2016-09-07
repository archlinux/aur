# Maintainer: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=gromacs-5.1-complete
pkgver=5.1.3
pkgrel=1
pkgdesc='A versatile package to perform molecular dynamics, i.e. simulate the Newtonian equations of motion for systems with hundreds to millions of particles.'
url='http://www.gromacs.org/'
license=("LGPL")
arch=('i686' 'x86_64')
depends=('gcc5' 'fftw' 'lesstif' 'perl' 'libxml2' 'libsm' 'libx11')
makedepends=('cmake')
options=('!libtool')
source=(ftp://ftp.gromacs.org/pub/gromacs/gromacs-${pkgver}.tar.gz
        GMXRC.bash.cmakein.patch)
sha1sums=('da1ff3124679e9f7175c7d1cbdc7b2ede0fc3ae0'
          '014b2cbfa13db9b495c88f653805c330747117dc')

export VMDDIR=/usr/lib/vmd/ #If vmd is available at compilation time
                            #Gromacs will have the ability to read any
                            #trajectory file format that can be read by
                            #VMD installation (e.g. AMBER's DCD format). 

#With gcc5 currently there are less errors in the tests
# also the compilation is possible in cuda capable machines
export CC=gcc-5
export CXX=g++-5

prepare() {
cd ${srcdir}/gromacs-${pkgver}/scripts/
ls
patch -p0 -i ${srcdir}/GMXRC.bash.cmakein.patch
}


build() {
  mkdir -p ${srcdir}/{single,double}

  ###### CMAKE OPTIONS DISABLE BY DEFAULT ###########
  # If you are using a haswell CPU, you will have   #
  # problems compiling with AVX2 support unless you #
  # modify march=native in the /etc/makepkg.conf:   #
  # https://wiki.archlinux.org/index.php/Makepkg#Architecture.2C_compile_flagsAdd #
  ###################################################
  msg2 "Building the double precision files"
  cd ${srcdir}/double	
  cmake ../gromacs-${pkgver}/ \
        -DCMAKE_INSTALL_PREFIX=/usr/local/gromacs/gromacs-${pkgver}/ \
        -DBUILD_SHARED_LIBS=ON \
        -DGMX_X11=ON \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DGMX_DOUBLE=ON \
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

}
