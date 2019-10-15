# Contributor: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=gromacs-plumed
pkgver=2019.4
_gromacsver=2019.4
_plumedver=2.5.3
pkgrel=1
pkgdesc='GROMACS is a versatile package to perform molecular dynamics, i.e. simulate the Newtonian equations of motion for systems with hundreds to millions of particles. (Plumed patched)'
url='http://www.gromacs.org/'
license=("LGPL")
arch=('x86_64')
depends=('lapack' 'zlib' "plumed>=${_plumedver}")
optdepends=('cuda: Nvidia GPU support'
            'opencl-mesa: OpenCL support for AMD GPU'
	    'opencl-nvidia: OpenCL support for Nvidia GPU')
makedepends=('cmake' 'libxml2' 'hwloc' 'gcc8')
options=('!libtool')
source=(ftp://ftp.gromacs.org/pub/gromacs/gromacs-${pkgver}.tar.gz)
sha256sums=('ba4366eedfc8a1dbf6bddcef190be8cd75de53691133f305a7f9c296e5ca1867')

export VMDDIR=/usr/lib/vmd/ #If vmd is available at compilation time
                            #Gromacs will have the ability to read any
                            #trajectory file format that can be read by
                            #VMD installation (e.g. AMBER's DCD format).


#For cuda support gcc8 is required, if you do not need cuda support comment the next two lines
export CC=gcc-8
export CXX=g++-8

#Plumed
export PLUMED_KERNEL=/usr/lib/libplumedKernel.so

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
        -DGMX_PREFER_STATIC_LIBS=ON \
        -DGMX_BUILD_MDRUN_ONLY=ON
        #-DGMX_SIMD=AVX2_256 \
        #-DGMX_SIMD=AVX_256 \
	#-DREGRESSIONTEST_DOWNLOAD=ON \
  make
}

#check () {
#  cd ${srcdir}/single
#  make check
#}

package() {
  msg2 "Making the single precision executables"
  cd ${srcdir}/single
  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/usr/share
  rm  ${pkgdir}/usr/bin/gmx-completion-mdrun.bash
  mv  ${pkgdir}/usr/bin/mdrun ${pkgdir}/usr/bin/mdrun_plumed
}
