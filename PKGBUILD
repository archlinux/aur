# Maintainer: Guillaume Dollé <dolle.guillaume@gmail.com>
# Contributor: Sosthène Guédon <sosthene.gued@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=freefem
pkgver=4.8.0
_pkgver=4.8
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
source=($pkgname-$pkgver.tar.gz::https://github.com/FreeFem/FreeFem-sources/archive/v${_pkgver}.tar.gz
        freefem.sh
        freefem.csh)
sha256sums=('499b1ca24d45088226a238412ea1492d9cc3eb6088866904145511469780180d'
            '8dfad023deccc20044bac7fb1c4c73221026c8a8f52ed2d7727065c71d87e488'
            '56eea801f08cc0f790af79a49c680d54f763fee196ce7d65af470c732c3d1043')
prepare() {
  cd FreeFem-sources-${_pkgver}

  autoreconf -i
  # Use system/AUR packages for 3rdparty.
  # MUMPS, HPDDM provided by petsc.
  ./configure --prefix=/opt/freefem \
              --enable-summary \
              --with-petsc=${PETSC_DIR}/lib/petsc/conf/petscvariables \
              --with-slepc=${SLEPC_DIR}/lib/slepc/conf/slepcvariables \
              --disable-superlu \
	      --disable-mumps_seq \
              --with-ipodpt-include 
              #--with-superlu-include=/usr/include/superlu \
  ./reconfigure
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
