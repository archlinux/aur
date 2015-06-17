# Maintainer: James W. Barnett <jbarnet4@tulane.edu>
pkgname=gromacs-git
pkgver=5.1.beta1.r121.gabc4a07
pkgrel=1
pkgdesc='A versatile package to perform molecular dynamics, i.e. simulate the Newtonian equations of motion for systems with hundreds to millions of particles. Development branch.'
url='http://www.gromacs.org/'
license=("LGPL")
arch=('i686' 'x86_64')
depends=('fftw-bettersimd')
makedepends=('cmake')
optdepends=('openmpi: needed for parallelization across nodes'
             'lapack: normal modes and matrix manipulation'
             'boost-libs: better implementation support for smart pointers and exception handling'
             'libxml2: required for running test suite'
             'libx11: needed for gmx view'
             'lesstif: needed for gmx view'
             'vmd: visualization')
options=('!libtool')
source=(git://git.gromacs.org/gromacs.git)
sha1sums=('SKIP')

build() {
  mkdir -p ${srcdir}/gromacs/build
  cd ${srcdir}/gromacs/build
  cmake .. \
         -DCMAKE_INSTALL_PREFIX=/usr \
         -DCMAKE_INSTALL_LIBDIR=lib \
		 -DGMX_DEFAULT_SUFFIX=OFF \
         -DGMX_BINARY_SUFFIX=_dev \
         -DGMX_LIBS_SUFFIX=_dev \
         -DREGRESSIONTEST_DOWNLOAD=ON
  make
}

pkgver() {
    cd ${srcdir}/gromacs
    git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd ${srcdir}/gromacs/build
  make check
}

package() {
  cd ${srcdir}/gromacs/build
  make DESTDIR=${pkgdir} install
}
