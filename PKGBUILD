# $Id: PKGBUILD 57440 2011-10-27 20:16:15Z lcarlier $
# Contributor: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=gromacs-plumed
pkgver=2016.3
_gromacsver=2016.3
_plumedver=2.3.2
pkgrel=2
pkgdesc='GROMACS is a versatile package to perform molecular dynamics, i.e. simulate the Newtonian equations of motion for systems with hundreds to millions of particles. (Plumed patched)'
url='http://www.gromacs.org/'
license=("LGPL")
arch=('i686' 'x86_64')
depends=('lapack' 'zlib')
optdepends=('cuda: Nvidia GPU support'
            'opencl-mesa: OpenCL support for AMD GPU'
	    'opencl-nvidia: OpenCL support for Nvidia GPU')
makedepends=('cmake' 'libxml2' 'hwloc' 'gcc5' 'plumed=2.3.2')
options=('!libtool')
source=(ftp://ftp.gromacs.org/pub/gromacs/gromacs-${pkgver}.tar.gz)
sha1sums=('1ae1ea922b94c74f43ee066e3ea64bafa1c6c3b6')

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

   ###### CMAKE OPTIONS DISABLE BY DEFAULT ###########
  # If you are using a haswell CPU, you will have   #
  # problems compiling with AVX2 support unless you #
  # modify march=native in the /etc/makepkg.conf:   #
  # https://wiki.archlinux.org/index.php/Makepkg#Architecture.2C_compile_flagsAdd #
  ###################################################

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
