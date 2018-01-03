# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>
pkgname=meep-git
pkgver=1.3.r125.gfc1b6b0
pkgrel=2
pkgdesc='Free finite-difference time-domain (FDTD) software for electromagnetic simulations (includes python interface)'
arch=('i686' 'x86_64')
url='https://github.com/stevengj/meep'
license=('GPL2')
depends=('harminv-git' 'libctl-git' 'hdf5' 'gsl' 'fftw' 'openmpi' 'swig' 'python-numpy')
makedepends=('gcc-fortran' 'suitesparse')
optdepends=('h5utils: visualization and conversion of scientific data'
						'python-h5py: process HDF5 data from python'
						'python-mpi4py: use MPI from the python interface'
            'mpb-git: calculation of electromagnetic modes')
options=('!libtool' '!makeflags')
provides=('meep')
conflicts=('meep')
source=('git+https://github.com/stevengj/meep.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/meep"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/meep"
	sed -i '/unknown argument/d' autogen.sh
  ./autogen.sh --prefix=/usr --enable-shared --with-mpi --with-python
  make
	sed -i -e "s/__name__\.rpartition.*/__name__/" python/__init__.py
}

package() {
  cd "${srcdir}/meep"
  make DESTDIR="$pkgdir" install
}
