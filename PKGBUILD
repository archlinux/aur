# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=freefem++-hg
pkgver=3.44.r3723.856ef8166d4e
_pkgver=3.44
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
source=('hg+http://www.freefem.org/ff++/ff++/')
sha256sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd "$srcdir/ff++"
  printf "${_pkgver}.r%s.%s" $(hg identify -n|sed 's/+//') $(hg identify -i|sed 's/+//')
}

build() {
  cd "$srcdir/ff++"
  autoreconf -i 
  perl download/getall -a
  ./configure CC=mpicc CXX=mpic++ FC=mpifort \
	      --enable-download --enable-m64 --sysconfdir=/etc \
	      --with-mpi --disable-schwarz --prefix=/usr 
  cd "$srcdir/ff++"/download/PETSc
  cp Makefile Makefile.old
  sed -e 's/--download-ml/--with-shared-libraries/' \
      -e 's/all-local:/#all-local:/' \
      -e 's/(CC)/(MPICC)/' Makefile.old > Makefile
  make
  cd -
  cp configure configure.old
  sed 's/\/petsc\/conf\/petscvariables/\/conf\/petscvariables/' \
      configure.old > configure
  cd "$srcdir/ff++"
  
  ./configure CC=mpicc CXX=mpic++ FC=mpifort \
	      CXXFLAGS=" -std=c++11" \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-download \
    --with-mpi \
    --with-petsc=$srcdir/download/PETSc/petsc-3.5.2/arch-linux2-c-debug \
    --disable-hpddm --enable-schwarz
  make 
}

#check() {
 # cd "$srcdir/ff++"
 # make check || true
#}

package() {
  cd "$srcdir/ff++"
  make -d DESTDIR="$pkgdir" install||true
  install -Dm644 examples++/freefem++.pref $pkgdir/etc/freefem++.pref
  find $pkgdir/usr/lib/ff++/ -name "*.h" -exec chmod o+r {} \;
  # remove unneeded files
  rm -f $pkgdir/usr/share/freefem++/${_pkgver}/INSTALL*
  rm -f $pkgdir/usr/share/freefem++/${_pkgver}/README_*
  rm -f $pkgdir/usr/share/freefem++/${_pkgver}/mode-mi-edp.zip
  rm -rf $pkgdir/usr/share/freefem++/${_pkgver}/download
}
