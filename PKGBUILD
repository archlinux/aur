# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=freefem++-hg
pkgver=3.39.r3368.c4d8233716ea
_pkgver=3.39
pkgrel=1
pkgdesc='A PDE oriented language using the finite element method (Mercurial)'
arch=('i686' 'x86_64')
url="http://www.freefem.org/ff++/index.htm"
license=('LGPL')
depends=('arpack' 'fftw' 'freeglut' 'glu' 'suitesparse' 'hdf5-cpp-fortran' 'gsl')
makedepends=('mercurial' 'gcc-fortran' 'texlive-core')
provides=('freefem++=3.39')
conflicts=('freefem++')
backup=('etc/freefem++.pref')
source=('hg+http://www.freefem.org/ff++/ff++')
sha256sums=('SKIP')
options=('!buildflags')

pkgver() {
  cd 'ff++'
  printf "${_pkgver}.r%s.%s" $(hg identify -n) $(hg identify -i)
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
  rm -f $pkgdir/usr/share/freefem++/${_pkgver}/INSTALL*
  rm -f $pkgdir/usr/share/freefem++/${_pkgver}/README_*
  rm -f $pkgdir/usr/share/freefem++/${_pkgver}/mode-mi-edp.zip
  rm -rf $pkgdir/usr/share/freefem++/${_pkgver}/download
  install -Dm644 $pkgdir/usr/share/freefem++/freefem++doc.pdf \
	  $pkgdir/usr/share/doc/freefem++/freefem++doc.pdf
  rm $pkgdir/usr/share/freefem++/freefem++doc.pdf
}
