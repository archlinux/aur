# Contributor: 'viperpaulo'
# Contributor: 'lazork'
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Andrea 'dedalus' Turconi <andy.dedalus@gmail.com>

pkgname=freefem++
pkgver=3.36
pkgrel=1
pkgdesc="A PDE oriented language using the finite element method"
arch=('i686' 'x86_64')
url="http://www.freefem.org/ff++/index.htm"
license=('LGPL')
depends=('arpack' 'fftw' 'freeglut' 'glu' 'suitesparse')
makedepends=('gcc-fortran' 'ed' 'wget')
options=('!makeflags')
source=("http://www.freefem.org/ff++/ftp/$pkgname-${pkgver//+/-}.tar.gz"
        'disable-doc.patch')
sha256sums=('e3aebb8bd79e679ff222e46912e873228fdcf978ceb557d5b3abb520cbdbb9de'
            '4df7aaecfc53f1721415cd38fd1b3ab066fc07cb118a13d32353c2338ba2e13d')

prepare() {
  cd "$pkgname-${pkgver//+/-}"

  ## disable doc
  patch -p1 < ../disable-doc.patch

  ## fix mumps Makefile includes
  ed -v download/mumps/Makefile-mumps-5.0.0.inc <<< $',s/^INCS = /& -I. -I\\/usr\\/include /g\nw'

  ## include downloaded headers in ff-c++ jobs
  # ed -v examples++-load/Makefile.in <<< $',s/^	 .\\/ff-c++/& -I..\\/download\\/include /g\nw'
}

build() {
  cd "$pkgname-${pkgver//+/-}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-silent-rules \
    --enable-download \
    --disable-pdf \
    --with-umfpack="-lumfpack -lsuitesparseconfig -lcholmod -lcolamd"

  make PREFIX=/usr
}

package() {
  cd "$pkgname-${pkgver//+/-}"

  make PREFIX=/usr DESTDIR="$pkgdir" install

  ## remove unneeded stuff
  rm -f "$pkgdir"/usr/share/"$pkgname/${pkgver//+/-}"/INSTALL*
  rm -f "$pkgdir"/usr/share/"$pkgname/${pkgver//+/-}"/README_*
  rm -f "$pkgdir"/usr/share/"$pkgname/${pkgver//+/-}"/mode-mi-edp.zip
  rm -rf "$pkgdir"/usr/share/"$pkgname/${pkgver//+/-}"/download
}
