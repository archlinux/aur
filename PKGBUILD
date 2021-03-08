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
source=("ftp://ftp.fu-berlin.de/unix/graphics/grace/src/grace5/$pkgname-$pkgver.tar.gz"
        "grace-fftw3.patch")
sha512sums=('9ea68483af1dfc98d217ae730b7a51b66deae5aaa8dfda29d5a3337ed4b5728b45aa03f561bf7d4173e73d6af8dee03cbabd95c0c8dd36999303c89451a3728a'
            '6d9190a1a51bd411e067bd02910e60b3612df48bee2002d5f33c97ecca38bbc5d79538e73b2e743eda234f2921fe59ebfd855efe56097c3692a72593ddd10611')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i '1,1i#include <zlib.h>' src/rstdrv.c
  sed -i 's|png_ptr->jmpbuf|png_jmpbuf(png_ptr)|g' src/rstdrv.c
  patch -p1 -i ../grace-fftw3.patch # port to FFTW3 (Debian)
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr --exec-prefix=/usr \
    --enable-grace-home=/usr/share/grace \
    --includedir=/usr/include --libdir=/usr/lib \
    -with-helpviewer="firefox %s"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  (cd "$pkgdir"/usr/share/grace && mv bin lib include ../../)
}
