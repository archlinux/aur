# $Id: PKGBUILD 57440 2011-10-27 20:16:15Z lcarlier $
# Maintainer: Hector <hsearaDOTatDOTgmailDOTcom>
# Maintainer: Vedran Miletic <vedran AT miletic DOT net>

pkgname=gromacs
pkgver=2023.1
pkgrel=2
pkgdesc='A versatile package to perform molecular dynamics, i.e. simulate the Newtonian equations of motion for systems with hundreds to millions of particles.'
url='http://www.gromacs.org/'
license=("LGPL")
arch=('x86_64')
depends=('lapack' 'zlib' 'hwloc')
optdepends=('cuda: Nvidia GPU support'
            'vmd: Accesibility to other trajectory formats (ONLY WHEN COMPILING)'
            'perl: needed for demux.pl and xplor2gmx.pl'
            'opencl-mesa: OpenCL support for AMD GPU'
            'opencl-nvidia: OpenCL support for Nvidia GPU')
makedepends=('cmake' 'libxml2' 'hwloc')
options=('!libtool')
source=(https://gitlab.com/gromacs/gromacs/-/archive/v${pkgver}/gromacs-v${pkgver}.tar.gz)

sha256sums=('a9a0e5f8dbf6d813ea4fb30d3efe67848cc7fc9d1b3faed0d825dcf4fdf7dd85')

export VMDDIR=/usr/lib/vmd/ #If vmd is available at compilation time
                            #Gromacs will have the ability to read any
                            #trajectory file format that can be read by
                            #VMD installation (e.g. AMBER's DCD format).

# For CUDA (12+) support, compiling with GCC 12 is required.
# If you not need CUDA support, uncomment the next two lines
# and install cuda and gcc12 packages.
#export CC=gcc-12
#export CXX=g++-12

build() {
  mkdir -p ${srcdir}/{single,double}

  msg2 "Building the double precision files"
  cd ${srcdir}/double
  cmake ../gromacs-v${pkgver}/ \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DGMX_DOUBLE=ON \
        -DGMX_BUILD_OWN_FFTW=ON \
        -DREGRESSIONTEST_DOWNLOAD=ON
  make

  msg2 "Building the single precision files"
  cd ${srcdir}/single
  cmake ../gromacs-v${pkgver}/ \
        -DCMAKE_INSTALL_PREFIX=/usr/ \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DGMX_BUILD_OWN_FFTW=ON \
        -DREGRESSIONTEST_DOWNLOAD=ON \
        #-GMX_GPU=CUDA
  # For GPU acceleration support, uncomment the previous line and pick one: OFF, CUDA, OpenCL, SYCL
  make
}

check () {
  msg2 "Testing double precision compilation"
  cd ${srcdir}/double
  #make check
  msg2 "Testing single precision compilation"
  cd ${srcdir}/single
  #make check
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
#  msg2 "Installing completion and environment setup script"
  msg2 "Installing environment setup script"
  mkdir -p ${pkgdir}/etc/profile.d/
#  mkdir -p ${pkgdir}/usr/share/bash-completion/completions
#  install -D -m755 ${srcdir}/gromacs-v${pkgver}/src/programs/completion/gmx-completion.bash "${pkgdir}/usr/share/bash-completion/completions/gromacs"
  mv ${pkgdir}/usr/bin/GMXRC.* ${pkgdir}/etc/profile.d/
  sed "s:/usr/bin:/etc/profile.d:" ${pkgdir}/usr/bin/GMXRC > ${pkgdir}/etc/profile.d/GMXRC
  chmod 755 ${pkgdir}/etc/profile.d/GMXRC
#  rm -f ${pkgdir}/usr/bin/completion.*
  rm -f ${pkgdir}/usr/bin/GMXRC
}
