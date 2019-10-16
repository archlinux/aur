# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=freefem-git
pkgver=4.4.2r20191016
epoch=1
pkgrel=1
pkgdesc='A PDE oriented language using the finite element method from git'
arch=('x86_64')
url="https://freefem.org/index.html"
license=('LGPL')
depends=('fftw' 'freeglut' 'glu' 'suitesparse' 'hdf5' 'gsl' 'openmpi' 'openblas-lapack' 'arpack' 'parmetis' 'python')
makedepends=('git' 'texlive-core')
provides=('freefem' 'freefem++')
conflicts=('freefem' 'freefem++')
source=('FreeFem::git+https://github.com/FreeFem/FreeFem-sources.git#branch=develop')
md5sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd FreeFem
  printf "%sr%s" $(grep AC_INIT configure.ac| cut -d, -f2|tr - .) $(git log -1 --format="%cd" --date=short | sed 's|-||g')
}

prepare() {
  cd FreeFem
  autoreconf -fi 
  ./configure CXXFLAGS=" --std=c++11" \
	      --prefix=/usr \
	      --sysconfdir=/etc \
	      --enable-download \
	      --enable-optim \
	      --disable-mumps \
	      --disable-hpddm
}

build() {
  cd FreeFem
  make 
}

check() {
  cd FreeFem
  make check || true
}

package() {
  cd FreeFem
  make -d DESTDIR="$pkgdir" install||true
  find "$pkgdir"/usr/lib/ff++/ -name "*.h" -exec chmod o+r {} \;
  # remove unneeded files
  rm -f "$pkgdir"/usr/share/freefem++/${_pkgver}/INSTALL*
  rm -f "$pkgdir"/usr/share/freefem++/${_pkgver}/README_*
  rm -f "$pkgdir"/usr/share/freefem++/${_pkgver}/mode-mi-edp.zip
  rm -rf "$pkgdir"/usr/share/freefem++/${_pkgver}/download
}
