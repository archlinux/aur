# Maintainer: Sosthène Guédon <sosthene.gued@gmail.com>
# contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=freefem
pkgver=4.5
_pkgver=4.5
pkgrel=1
pkgdesc='A PDE oriented language using the finite element method'
arch=('x86_64')
url="https://freefem.org/index.html"
license=('LGPL')
depends=('fftw' 'freeglut' 'glu' 'suitesparse' 'hdf5' 'gsl' 'openmpi' 'lapack'
	 'arpack' 'parmetis' 'cblas')
makedepends=('texlive-core' 'gcc-fortran' 'unzip''autoconf' 'python')
conflicts=('freefem++')
provides=('freefem++')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FreeFem/FreeFem-sources/archive/v${_pkgver}.tar.gz")
sha256sums=('5b2d4125c312da8fbedd49a72e742f18f35e0ae100c82fb493067dfad5d51432')

prepare() {
  cd FreeFem-sources-${_pkgver}

  autoreconf -i
  ./configure --prefix=/usr \
	      --sysconfdir=/etc \
	      --enable-download \
	      --enable-optim \
	      --disable-mumps \
	      --disable-hpddm \
              --disable-parmmg
    cd 3rdparty
    make clean

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
