# Maintainer: Guillaume Dollé <dolle.guillaume@gmail.com>
# Contributor: Sosthène Guédon <sosthene.gued@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=freefem
pkgver=4.7.1
_pkgver=4.7-1
pkgrel=1
pkgdesc='A PDE oriented language using the finite element method'
arch=('x86_64')
url="https://freefem.org/index.html"
license=('LGPL')
depends=('freeglut' 'glu' 'hdf5' 'gsl' 'openmpi' 'suitesparse'
         'arpack' 'parmetis' )
makedepends=('bison' 'flex' 'texlive-core' 'gcc-fortran' 'unzip' 'autoconf' 'python')
optdepends=( 'cblas' 'fftw' 'nlopt' 'coin-or-ipopt' 'scotch' 'mumps' 'scalapack' 'lapack' 'superlu' 'mmg3d' 'petsc' 'slepc' 'boost' 'metis' 'tetgen')
conflicts=('freefem++')
provides=('freefem++')
source=($pkgname-$pkgver.tar.gz::https://github.com/FreeFem/FreeFem-sources/archive/v${_pkgver}.tar.gz
        freefem.sh
        freefem.csh)
sha256sums=('60d84424d20b5f6abaee638dc423480fc76f9c389bba1a2f23fd984e39a3fb96'
            '8dfad023deccc20044bac7fb1c4c73221026c8a8f52ed2d7727065c71d87e488'
            '56eea801f08cc0f790af79a49c680d54f763fee196ce7d65af470c732c3d1043')
prepare() {
  cd FreeFem-sources-${_pkgver}

  autoreconf -i
  # Use system/AUR packages for 3rdparty.
  # MUMPS, HPDDM provided by petsc.
  ./configure --prefix=/opt/freefem \
              --with-petsc=${PETSC_DIR}/lib/petsc/conf/petscvariables \
              --with-petsc=${SLEPC_DIR}/lib/slepc/conf/slepcvariables \
              --disable-superlu \
	      --disable-mumps_seq
              #--with-superlu-include=/usr/include/superlu \
}

build() {
  cd FreeFem-sources-${_pkgver}
  make -j4
}

check() {
  cd FreeFem-sources-${_pkgver}
  make check || true
}

package() {
  cd FreeFem-sources-${_pkgver}
  make -d DESTDIR="${pkgdir}" install || true
  cd ${srcdir}
  install -Dm 644 ${pkgname}.sh ${pkgdir}/etc/profile.d/${pkgname}.sh
  install -Dm 644 ${pkgname}.sh ${pkgdir}/etc/profile.d/${pkgname}.csh
}
