# Contributor: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=gromacs-plumed
pkgver=2024.3
_gromacsver=2024.3
_plumedver=2.9.2
pkgrel=1
pkgdesc='GROMACS is a versatile package to perform molecular dynamics, i.e. simulate the Newtonian equations of motion for systems with hundreds to millions of particles. (Plumed patched)'
url='http://www.gromacs.org/'
license=(LGPL-2.1-only)
arch=('x86_64')
depends=('lapack' 'fftw' 'zlib' 'hwloc' 'gcc13-libs' 'tinyxml2' "plumed>=${_plumedver}")
optdepends=('cuda: Nvidia GPU support'
            'opencl-clover-mesa: OpenCL support for AMD/Intel GPU'
            'opencl-rusticl-mesa: OpenCL support for AMD/Intel GPU'
	    'opencl-nvidia: OpenCL support for Nvidia GPU')
makedepends=('cmake' 'gcc13')
options=('!libtool' '!lto')
source=(ftp://ftp.gromacs.org/pub/gromacs/gromacs-${pkgver}.tar.gz)
sha256sums=('bbda056ee59390be7d58d84c13a9ec0d4e3635617adf2eb747034922cba1f029')

export VMDDIR=/usr/lib/vmd/ #If vmd is available at compilation time
                            #Gromacs will have the ability to read any
                            #trajectory file format that can be read by
                            #VMD installation (e.g. AMBER's DCD format).

# For CUDA (12+) support, compiling with GCC 13 is required.
# If you not need CUDA support, uncomment the next two lines
# and install cuda and gcc13 packages.
export CC=gcc-13
export CXX=g++-13

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
        -DGMX_GPU=OFF \
	-DGMX_BUILD_OWN_FFTW=ON \
        -DREGRESSIONTEST_DOWNLOAD=ON
        #GMX_GPU: Framework for GPU acceleration. Pick one of: OFF, CUDA, OpenCL, SYCL
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
