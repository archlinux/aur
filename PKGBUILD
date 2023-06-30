# Maintainer: Guillaume Dollé <dolle.guillaume@gmail.com>
# Contributor: Sosthène Guédon <sosthene.gued@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=freefem
pkgver=4.13.0
_pkgver=4.13
pkgrel=2
pkgdesc='A PDE oriented language using the finite element method'
arch=('x86_64')
url="https://freefem.org/index.html"
license=('LGPL')
depends=('freeglut' 'glu' 'hdf5' 'gsl' 'openmpi' 'suitesparse'
         'arpack' 'parmetis' )
makedepends=('bison' 'flex' 'texlive-core' 'gcc-fortran' 'unzip' 'autoconf' 'python')
optdepends=( 'cblas' 'fftw' 'nlopt' 'coin-or-ipopt' 'scotch' 'mumps' 'scalapack' 'lapack' 'superlu' 'mmg3d' 'petsc' 'slepc' 'boost' 'metis' 'tetgen')
conflicts=('freefem-ext-dl' 'freefem-git')
provides=('freefem')
source=($pkgname-$pkgver.tar.gz::https://github.com/FreeFem/FreeFem-sources/archive/v${_pkgver}.tar.gz)
sha256sums=('aefd4ff02333209f7433abef2e74acb621b6946063ff27e81cf2da43120b6ae4')

prepare() {
  cd FreeFem-sources-${_pkgver}

  autoreconf -i
  # Use system/AUR packages for 3rdparty.
  # MUMPS, HPDDM provided by petsc.
  ./configure --prefix=/usr \
              --enable-summary \
              --with-petsc=${PETSC_DIR}/lib/petsc/conf/petscvariables \
              --with-slepc=${SLEPC_DIR}/lib/slepc/conf/slepcvariables \
              --disable-superlu \
	      --disable-mumps_seq
              #--with-ipopt-include 
              #--with-superlu-include=/usr/include/superlu \
  ./reconfigure
}

build() {
  cd FreeFem-sources-${_pkgver}
  # Set MAKEFLAGS in /etc/makepkg.conf for parallel builds.
  make
}

check() {
  cd FreeFem-sources-${_pkgver}
  make check || true
}

package() {
  cd FreeFem-sources-${_pkgver}
  make -d DESTDIR="${pkgdir}" install || true
}
