# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=freefem++-hg
pkgver=3.56.1r4192.4b2f46f5231d
pkgrel=2
pkgdesc='A PDE oriented language using the finite element method (Mercurial)'
arch=('i686' 'x86_64')
url="http://www.freefem.org/ff++/index.htm"
license=('LGPL')
depends=('fftw' 'freeglut' 'glu' 'suitesparse' 'hdf5-openmpi' 'gsl' 'openmpi' 'openblas-lapack' 'arpack' 'parmetis' 'python')
makedepends=('mercurial' 'flex-git' 'texlive-core')
provides=("freefem++=$_pkgver")
conflicts=('freefem++')
backup=('etc/freefem++.pref')
source=('hg+http://www.freefem.org/ff++/ff++/' getall.patch)
sha256sums=('SKIP'
            '456cd15503c01484559bd8710cf816edcdf4ffbea9cb028c9c635ae4ae2c0bd8')
options=('!makeflags')

pkgver() {
  cd "$srcdir/ff++"
  _pkgver=$(awk -F, '/AC_INIT/ {print $2}' configure.ac | tr - .) 
  printf "%sr%s.%s" $(echo $_pkgver) $(hg identify -n|sed 's/+//') $(hg identify -i|sed 's/+//')
}

prepare() {
  cd ff++/download
  patch -p0 < "$srcdir"/getall.patch || true
}

build() {
  cd ff++
  autoreconf -fi 
  perl download/getall -a
   ./configure CC=mpicc CXX=mpic++ FC=mpifort CXXFLAGS=" -std=c++11" \
	      --prefix=/usr \
	      --sysconfdir=/etc \
	      --enable-download \
	      --with-mpi 
  make
}

#check() {
#  cd "$srcdir/ff++"
#  make check || true
#}

package() {
  cd ff++
  make -d DESTDIR="$pkgdir" install||true
  install -Dm644 examples++/freefem++.pref $pkgdir/etc/freefem++.pref
  find $pkgdir/usr/lib/ff++/ -name "*.h" -exec chmod o+r {} \;
  # remove unneeded files
  rm -f $pkgdir/usr/share/freefem++/${_pkgver}/INSTALL*
  rm -f $pkgdir/usr/share/freefem++/${_pkgver}/README_*
  rm -f $pkgdir/usr/share/freefem++/${_pkgver}/mode-mi-edp.zip
  rm -rf $pkgdir/usr/share/freefem++/${_pkgver}/download
}
