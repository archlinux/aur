# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: damir <damir@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=grace
pkgver=5.1.25
pkgrel=6
pkgdesc="2D plotting tool"
arch=(x86_64)
url="http://plasma-gate.weizmann.ac.il/Grace/"
depends=('libjpeg' 'libpng' 'openmotif' 't1lib' 'netcdf' 'fftw')
license=('GPL')
options=('staticlibs')
source=(ftp://plasma-gate.weizmann.ac.il/pub/grace/src/grace5/$pkgname-$pkgver.tar.gz grace-fftw3.patch)
md5sums=('c0482b1f18b113192946a96f5ff35a4d'
         '0c61460189e4d19713e59a84c28f23c2')

prepare() {
  cd $pkgname-$pkgver
  sed -i '1,1i#include <zlib.h>' src/rstdrv.c
  sed -i 's|png_ptr->jmpbuf|png_jmpbuf(png_ptr)|g' src/rstdrv.c
  patch -p1 -i ../grace-fftw3.patch # port to FFTW3 (Debian)
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure   --prefix=/usr --exec-prefix=/usr \
		--enable-grace-home=/usr/share/grace \
		--includedir=/usr/include --libdir=/usr/lib \
		-with-helpviewer="firefox %s"
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  (cd "$pkgdir"/usr/share/grace && mv bin lib include ../../)
}
