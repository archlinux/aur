# Contributor: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=gromacs-plumed
pkgver=2021.3
_gromacsver=2021.3
_plumedver=2.7.2
pkgrel=2
pkgdesc='GROMACS is a versatile package to perform molecular dynamics, i.e. simulate the Newtonian equations of motion for systems with hundreds to millions of particles. (Plumed patched)'
url='http://www.gromacs.org/'
license=("LGPL")
arch=('x86_64')
depends=('lapack' 'zlib' "plumed>=${_plumedver}")
optdepends=('cuda: Nvidia GPU support'
            'opencl-mesa: OpenCL support for AMD GPU'
	    'opencl-nvidia: OpenCL support for Nvidia GPU')
makedepends=('cmake' 'libxml2' 'hwloc')
options=('!libtool')
source=(ftp://ftp.gromacs.org/pub/gromacs/gromacs-${pkgver}.tar.gz)
sha256sums=('e109856ec444768dfbde41f3059e3123abdb8fe56ca33b1a83f31ed4575a1cc6')

export VMDDIR=/usr/lib/vmd/ #If vmd is available at compilation time
                            #Gromacs will have the ability to read any
                            #trajectory file format that can be read by
                            #VMD installation (e.g. AMBER's DCD format).


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
        -DCMAKE_INSTALL_PREFIX=/usr/local/gromacs/gromacs-plumed \
        -DGMX_DEFAULT_SUFFIX=OFF -DGMX_BINARY_SUFFIX=_plumed -DGMX_LIBS_SUFFIX=_plumed \
	-DGMX_BUILD_OWN_FFTW=ON \
        -DREGRESSIONTEST_DOWNLOAD=ON
        #GMX_GPU: Framework for GPU acceleration. Pick one of: OFF, CUDA, OpenCL, SYCL
        #-DGMX_GPU=CUDA
  make
}

check () {
  msg2 "Testing single precision compilation with plumed"
  cd ${srcdir}/single
#  make check
}

package() {
  msg2 "Making the single precision mdrun_plumed executable"
  cd ${srcdir}/single
  make DESTDIR=${pkgdir} install
}
