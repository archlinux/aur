# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=freefem++-hg
pkgver=3.59r4303.53b304a5195d
pkgrel=1
pkgdesc='A PDE oriented language using the finite element method (Mercurial)'
arch=('x86_64')
url="http://www.freefem.org/ff++/index.htm"
license=('LGPL')
depends=('julia' 'fftw' 'freeglut' 'glu' 'suitesparse' 'hdf5-openmpi' 'gsl' 'openmpi' 'openblas-lapack' 'arpack' 'parmetis' 'python')
makedepends=('mercurial' 'flex-git' 'texlive-core')
provides=("freefem++=$_pkgver")
conflicts=('freefem++')
backup=('etc/freefem++.pref')
source=('hg+http://www.freefem.org/ff++/ff++/')
sha256sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd ff++
  _pkgver=$(awk -F, '/AC_INIT/ {print $2}' configure.ac | tr - .) 
  printf "%sr%s.%s" $(echo $_pkgver) $(hg identify -n|sed 's/+//') $(hg identify -i|sed 's/+//')
}

build() {
  cd ff++
  autoreconf -fi 
  perl download/getall -a
   ./configure CXXFLAGS=" -std=c++11" \
	      --prefix=/usr \
	      --sysconfdir=/etc \
	      --enable-download \
	      --disable-mumps 
  make
}

check() {
  cd ff++
  make check || true
}

package() {
  cd ff++
  make -d DESTDIR="$pkgdir" install||true
  install -Dm644 examples++/freefem++.pref $pkgdir/etc/freefem++.pref
  find "$pkgdir"/usr/lib/ff++/ -name "*.h" -exec chmod o+r {} \;
  # remove unneeded files
  rm -f "$pkgdir"/usr/share/freefem++/${_pkgver}/INSTALL*
  rm -f "$pkgdir"/usr/share/freefem++/${_pkgver}/README_*
  rm -f "$pkgdir"/usr/share/freefem++/${_pkgver}/mode-mi-edp.zip
  rm -rf "$pkgdir"/usr/share/freefem++/${_pkgver}/download
}
