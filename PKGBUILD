# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=freefem
pkgver=4.4
pkgrel=2
pkgdesc='A PDE oriented language using the finite element method'
arch=('x86_64')
url="https://freefem.org/index.html"
license=('LGPL')
depends=('fftw' 'freeglut' 'glu' 'suitesparse' 'hdf5' 'gsl' 'openmpi' 'lapack'
	 'arpack' 'parmetis' 'python')
makedepends=('texlive-core' 'gcc-fortran')
conflicts=('freefem++')
provides=('freefem++')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FreeFem/FreeFem-sources/archive/v$pkgver.tar.gz")
sha256sums=('46f2a197f916be5b529ed444ad472d737a9e1ead2fe47e831d43c09bc82568e1')
options=('!makeflags')

prepare() {
  cd FreeFem-sources-${pkgver}

  autoreconf -i
  ./configure --prefix=/usr \
	      --sysconfdir=/etc \
	      --enable-download \
	      --enable-hpddm \
	      --enable-optim \
	      --disable-mumps 

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
