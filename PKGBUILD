# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=freefem++
pkgver=3.62
pkgrel=2
pkgdesc='A PDE oriented language using the finite element method'
arch=('x86_64')
url="https://freefem.org/index.html"
license=('LGPL')
depends=('fftw' 'freeglut' 'glu' 'suitesparse' 'hdf5-openmpi' 'gsl' 'openmpi' 'lapack' 'arpack' 'parmetis' 'python')
makedepends=('texlive-core')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FreeFem/FreeFem-sources/archive/$pkgver.tar.gz")
sha256sums=('4db5ab10bf65692a5f9acb3577510005a4570e60f7c30de43eb625aacf7c6aad')
options=('!makeflags')

prepare() {
  cd FreeFem-sources-${pkgver}
  find ./download -name headers-sparsesolver.inc -exec sed -i 's+#\(FFMPIINCLUDE\s*=\).*+\1 -I/usr/include/+' {} \;
  perl download/getall -a
  autoreconf -i
  ./configure --prefix=/usr \
	      --sysconfdir=/etc \
	      --enable-download \
	      --enable-mumps \
	      --with-mpi=openmpi
  
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
