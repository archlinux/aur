# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=freefem++-hg
pkgver=r3356.1249f08c0ad3
pkgrel=1
pkgdesc='A PDE oriented language using the finite element method (Mercurial)'
arch=('i686' 'x86_64')
url="http://www.freefem.org/ff++/index.htm"
license=('LGPL')
depends=('arpack' 'fftw' 'freeglut' 'glu' 'suitesparse' 'hdf5-cpp-fortran' 'gsl')
makedepends=('mercurial' 'gcc-fortran')
provides=('freefem++')
conflicts=('freefem++')
backup=('etc/freefem++.pref')
source=('hg+http://www.freefem.org/ff++/ff++/')
sha256sums=('SKIP')
options=('!buildflags')

pkgver() {
  cd 'ff++'
  printf "r%s.%s" $(hg identify -n) $(hg identify -i)
}

build() {
  cd 'ff++'
  autoreconf -i
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-download \
    --with-umfpack="-lumfpack -lsuitesparseconfig -lcholmod -lcolamd" \
      --with-mpi=openmpi
  perl download/getall -a
  make CXX=mpic++ PREFIX=/usr 
}

package() {
  cd 'ff++'
  make -d  DESTDIR="$pkgdir" install
  install -Dm644 examples++/freefem++.pref $pkgdir/etc/freefem++.pref
  find $pkgdir/usr/lib/ff++/ -name "*.h" -exec chmod o+r {} \;
  # remove unneeded stuff
  rm -f $pkgdir/usr/share/freefem++/INSTALL*
  rm -f $pkgdir/usr/share/freefem++/README_*
  rm -f $pkgdir/usr/share/freefem++/mode-mi-edp.zip
  rm -rf $pkgdir/usr/share/freefem++/download
}
