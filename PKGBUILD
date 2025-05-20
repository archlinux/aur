# Maintainer: Guillaume Dollé <dolle.guillaume@gmail.com>
# Contributor: Sosthène Guédon <sosthene.gued@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=freefem
pkgver=4.15.0
_pkgver=4.15
pkgrel=1
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
sha256sums=('9af8986cd125051cd2677e7426b9ee5ba4a8b4bee5eb9c5ff0fc87dba5f4b32b')

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
