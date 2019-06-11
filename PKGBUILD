# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=freefem++
pkgver=4.2.1
pkgrel=1
pkgdesc='A PDE oriented language using the finite element method'
arch=('x86_64')
url="https://freefem.org/index.html"
license=('LGPL')
depends=('fftw' 'freeglut' 'glu' 'suitesparse' 'hdf5' 'gsl' 'openmpi' 'lapack'
	 'arpack' 'parmetis' 'python')
makedepends=('texlive-core' 'gcc-fortran')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FreeFem/FreeFem-sources/archive/v$pkgver.tar.gz")
sha256sums=('be6ee15fb7dc31a51438220bcb8a179f92013fbf0d97501c27b232d117c293bd')
options=('!makeflags')

prepare() {
  cd FreeFem-sources-${pkgver}

  autoreconf -i
  ./configure --prefix=/usr \
	      --sysconfdir=/etc \
	      --enable-download \
	      --disable-mumps \
	      --enable-hpddm

  find . -name Makefile -exec sed -i 's+^gcc+gcc =+' {} \;
  find . -name Makefile -exec sed -i 's+^dir+dir =+' {} \;
}

build() {
  cd FreeFem-sources-${pkgver}
  make 
}

check() {
  cd FreeFem-sources-${pkgver}
  make check || true
}

package() {
  cd FreeFem-sources-${pkgver}
  make -d DESTDIR="$pkgdir" install || true

  find "$pkgdir"/usr/lib/ff++/ -name "*.h" -exec chmod o+r {} \;
  # remove unneeded files
  rm -f "$pkgdir"/usr/share/${pkgname}/${_pkgver}/INSTALL*
  rm -f "$pkgdir"/usr/share/${pkgname}/README_*
  rm -f "$pkgdir"/usr/share/${pkgname}/mode-mi-edp.zip
  rm -rf "$pkgdir"/usr/share/${pkgname}/download
}
