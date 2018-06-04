# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=freefem++-git
pkgver=20180601
pkgrel=1
pkgdesc='A PDE oriented language using the finite element method from git'
arch=('x86_64')
url="http://www.freefem.org/ff++/index.htm"
license=('LGPL')
depends=('fftw' 'freeglut' 'glu' 'suitesparse' 'hdf5-openmpi' 'gsl' 'openmpi' 'openblas-lapack' 'arpack' 'parmetis' 'python')
makedepends=('git' 'flex' 'texlive-core' 'gcc54')
provides=("freefem++=3.60")
conflicts=('freefem++')
backup=('etc/freefem++.pref')
source=('FreeFem::git+https://github.com/FreeFem/FreeFem-sources.git#branch=develop')
md5sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd FreeFem
  echo $(git log -1 --format="%cd" --date=short | sed 's|-||g')
}

build() {
  cd FreeFem
  autoreconf -fi 
  perl download/getall -a
  ./configure CXX=g++-5 CXXFLAGS=" --std=c++11" \
	      --prefix=/usr \
	      --sysconfdir=/etc \
	      --enable-download \
	      --disable-mumps 
  make
}

check() {
  cd FreeFem
  make check || true
}

package() {
  cd FreeFem
  make -d DESTDIR="$pkgdir" install||true
  install -Dm644 examples++/freefem++.pref $pkgdir/etc/freefem++.pref
  find "$pkgdir"/usr/lib/ff++/ -name "*.h" -exec chmod o+r {} \;
  # remove unneeded files
  rm -f "$pkgdir"/usr/share/freefem++/${_pkgver}/INSTALL*
  rm -f "$pkgdir"/usr/share/freefem++/${_pkgver}/README_*
  rm -f "$pkgdir"/usr/share/freefem++/${_pkgver}/mode-mi-edp.zip
  rm -rf "$pkgdir"/usr/share/freefem++/${_pkgver}/download
}
