# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=freefem++-hg
pkgver=3.56.1r4209.0ffcfd64cb7e
pkgrel=1
pkgdesc='A PDE oriented language using the finite element method (Mercurial)'
arch=('x86_64')
url="http://www.freefem.org/ff++/index.htm"
license=('LGPL')
depends=('fftw' 'freeglut' 'glu' 'suitesparse' 'hdf5-openmpi' 'gsl' 'openmpi' 'openblas-lapack' 'arpack' 'parmetis' 'python')
makedepends=('mercurial' 'flex-git' 'texlive-core')
provides=("freefem++=$_pkgver")
conflicts=('freefem++')
backup=('etc/freefem++.pref')
source=('hg+http://www.freefem.org/ff++/ff++/' longmin.patch)
sha256sums=('SKIP'
            'b8099ce2a2e2a72d117ff0582abb200ee34278b44b450f87169690a3f970f3e5')
options=('!makeflags')

pkgver() {
  cd ff++
  _pkgver=$(awk -F, '/AC_INIT/ {print $2}' configure.ac | tr - .) 
  printf "%sr%s.%s" $(echo $_pkgver) $(hg identify -n|sed 's/+//') $(hg identify -i|sed 's/+//')
}

prepare() {
  cd ff++
  patch -Np1 < "$srcdir"/longmin.patch
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
