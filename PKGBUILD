# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=freefem++-hg
pkgver=3.39.r3376.358816cdd019
_pkgver=3.39
pkgrel=1
pkgdesc='A PDE oriented language using the finite element method (Mercurial)'
arch=('i686' 'x86_64')
url="http://www.freefem.org/ff++/index.htm"
license=('LGPL')
depends=('blas' 'lapack' 'arpack' 'fftw' 'freeglut' 'glu' 'suitesparse' 'hdf5-cpp-fortran' 'gsl' 'openmpi')
makedepends=('mercurial' 'gcc-fortran' 'texlive-core')
provides=("freefem++=$_pkgver")
conflicts=('freefem++')
backup=('etc/freefem++.pref')
source=('hg+http://www.freefem.org/ff++/ff++')
sha256sums=('SKIP')
options=('!buildflags')

pkgver() {
  cd 'ff++'
  printf "${_pkgver}.r%s.%s" $(hg identify -n) $(hg identify -i)
}

prepare() {
  cd ff++/download/PETSc
  sed 's/--download-ml//' Makefile > Makefile
}

build() {
  cd 'ff++'
  autoreconf -i
  ./configure CC=mpicc CXX=mpic++ FC=mpifort \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-download \
    --with-umfpack="-lumfpack -lsuitesparseconfig -lcholmod -lcolamd" \
    --with-mpi=openmpi \
    --with-petsc=$srcdir/download/PETSc/petsc-3.5.2/arch-linux2-c-debug \
    --disable-schwarz 
  perl download/getall -a
  make PREFIX=/usr 
}

check() {
  cd ff++
  make check
}

package() {
  cd 'ff++'
  make -d  DESTDIR="$pkgdir" install
  install -Dm644 examples++/freefem++.pref $pkgdir/etc/freefem++.pref
  find $pkgdir/usr/lib/ff++/ -name "*.h" -exec chmod o+r {} \;
  # remove unneeded stuff
  rm -f $pkgdir/usr/share/freefem++/${_pkgver}/INSTALL*
  rm -f $pkgdir/usr/share/freefem++/${_pkgver}/README_*
  rm -f $pkgdir/usr/share/freefem++/${_pkgver}/mode-mi-edp.zip
  rm -rf $pkgdir/usr/share/freefem++/${_pkgver}/download
}
