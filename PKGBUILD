# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=freefem
pkgver=4.4.3
_pkgver=4.4-3
pkgrel=1
pkgdesc='A PDE oriented language using the finite element method'
arch=('x86_64')
url="https://freefem.org/index.html"
license=('LGPL')
depends=('fftw' 'freeglut' 'glu' 'suitesparse' 'hdf5' 'gsl' 'openmpi' 'lapack'
	 'arpack' 'parmetis' 'python')
makedepends=('texlive-core' 'gcc-fortran' 'unzip')
conflicts=('freefem++')
provides=('freefem++')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FreeFem/FreeFem-sources/archive/v${_pkgver}.tar.gz")
sha256sums=('57db0e1d8fc14b25265ebe155a9f748216b8a74e0d6af65b567b1beaade698b0')
options=('!makeflags')

prepare() {
  cd FreeFem-sources-${_pkgver}

  autoreconf -i
  ./configure --prefix=/usr \
	      --sysconfdir=/etc \
	      --enable-download \
	      --enable-hpddm \
	      --enable-optim \
	      --disable-mumps \
	      --disable-hpddm

  find . -name Makefile -exec sed -i 's+^gcc+gcc =+' {} \;
  find . -name Makefile -exec sed -i 's+^dir+dir =+' {} \;
}

build() {
  cd FreeFem-sources-${_pkgver}
  make 
}

check() {
  cd FreeFem-sources-${_pkgver}
  make check || true
}

package() {
  cd FreeFem-sources-${_pkgver}
  make -d DESTDIR="$pkgdir" install || true

  find "$pkgdir"/usr/lib/ff++/ -name "*.h" -exec chmod o+r {} \;
  # remove unneeded files
  rm -f "$pkgdir"/usr/share/${pkgname}/${pkgver}/INSTALL*
  rm -f "$pkgdir"/usr/share/${pkgname}/README_*
  rm -f "$pkgdir"/usr/share/${pkgname}/mode-mi-edp.zip
  rm -rf "$pkgdir"/usr/share/${pkgname}/download
}
