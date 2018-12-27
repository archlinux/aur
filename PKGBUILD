# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=freefem++
pkgver=3.61.1
_pkgver=3.61-1
pkgrel=3
pkgdesc='A PDE oriented language using the finite element method'
arch=('x86_64')
url="https://freefem.org/index.html"
license=('LGPL')
depends=('fftw' 'freeglut' 'glu' 'suitesparse' 'hdf5-openmpi' 'gsl' 'openmpi' 'lapack' 'arpack' 'parmetis' 'python')
makedepends=('texlive-core')
source=("$pkgname-$pkgver.tar.gz::http://www3.freefem.org/ff++/ftp/$pkgname-${_pkgver}.tar.gz" gcc8.patch)
sha256sums=('1f225c5b5d3081df157794174a1a31037a622d111051258ad979ec9d52a48c67'
            '5a80de210d97ce08e97ebda63cda51d74100c8c05a3cc4a7d5b0733f64ab30ed')
options=('!makeflags')

prepare() {
  cd ${pkgname}-${_pkgver}
#  autoreconf -fi 
  perl download/getall -a
  ./configure CXXFLAGS=" --std=c++11" \
	      --prefix=/usr \
	      --sysconfdir=/etc \
	      --enable-download \
	      --enable-mumps
  
  find . -name Makefile -exec sed -i 's+^gcc+gcc =+' {} \;
  find . -name Makefile -exec sed -i 's+^dir+dir =+' {} \;
  patch -Np1 < "$srcdir"/gcc8.patch
}

build() {
  cd ${pkgname}-${_pkgver}
  make 
}

check() {
  cd ${pkgname}-${_pkgver}
  make check || true
}

package() {
  cd ${pkgname}-${_pkgver}
  make -d DESTDIR="$pkgdir" install||true

  find "$pkgdir"/usr/lib/ff++/ -name "*.h" -exec chmod o+r {} \;
  # remove unneeded files
  rm -f "$pkgdir"/usr/share/${pkgname}/${_pkgver}/INSTALL*
  rm -f "$pkgdir"/usr/share/${pkgname}/README_*
  rm -f "$pkgdir"/usr/share/${pkgname}/mode-mi-edp.zip
  rm -rf "$pkgdir"/usr/share/${pkgname}/download
}
