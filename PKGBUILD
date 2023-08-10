# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=FeynHiggs
pkgname=feynhiggs
pkgver=2.19.0
pkgrel=1
pkgdesc="FeynHiggs is a Fortran code for the (diagrammatic) calculation of the masses, mixings and much more of the Higgs bosons in the MSSM with real/complex parameters at the highest level of accuracy."
arch=("x86_64")
url="http://wwwth.mpp.mpg.de/members/heinemey/feynhiggs/cFeynHiggs.html"
license=('GPL3')
depends=("gcc-fortran")
options=('staticlibs')
source=("http://wwwth.mpp.mpg.de/members/heinemey/feynhiggs/newversion/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('42adefd41f37dd50613bd0d1d3ee462edb7f3e8a390ae5f584c571d69b7099be')

prepare() {
  cd "${_pkgname}-$pkgver"

  sed -i 's/LIBDIR = $(PREFIX)\/lib$(LIBDIRSUFFIX)/LIBDIR = $(PREFIX)\/lib/' \
      makefile.in
}

build() {
  cd "${_pkgname}-$pkgver"

  ./configure --prefix=/usr --enable-full-g-2 --enable-slhapara
  make ${MAKEFLAGS}
}

package() {
  cd "${_pkgname}-$pkgver"

  make PREFIX="$pkgdir/usr" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  cd $pkgdir/usr/bin; mv fcc fcc-feynhiggs; mv table table-feynhiggs
  cd $pkgdir/usr/include; mkdir -p FeynHiggs; mv *.h FeynHiggs
}
