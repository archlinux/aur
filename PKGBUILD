# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Jose Negron <josenj.arch@mailnull.net>

pkgname=sdcc
pkgver=3.6.0
pkgrel=4
pkgdesc="Retargettable ANSI C compiler (Intel 8051, Maxim 80DS390, Zilog Z80 and the Motorola 68HC08)"
arch=('x86_64')
license=('GPL')
depends=('bash' 'gcc-libs' 'boost-libs')
makedepends=('gputils' 'flex' 'bison' 'patch' 'boost')
optdepends=('python')
url="http://sdcc.sourceforge.net/"
options=(!strip  staticlibs)
source=(http://downloads.sourceforge.net/sourceforge/sdcc/$pkgname-src-$pkgver.tar.bz2
        glibc220-build-fix.patch)
md5sums=('4c4cf17d8d2b2d37af66c5b7511f62d8'
         'de3be2a60baaafbdbfe5efaaacbb3028')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  sed -i 's|CC -E|CC -O2 -E|g' support/sdbinutils/libiberty/configure

  # Fix build with glibc 2.20
  # http://sourceforge.net/p/sdcc/bugs/2303/
  patch -Np0 -i ../glibc220-build-fix.patch
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure \
	--prefix=/usr \
	--includedir=/usr/include/sdcc \
	--libdir=/usr/lib/sdcc \
	--disable-werror
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make install DESTDIR="$pkgdir"

  if [ -d "$pkgdir"/usr/lib/lib ]; then
    mv "$pkgdir"/usr/lib/lib/* "$pkgdir"/usr/lib/sdcc/
    rm -rf "$pkgdir"/usr/lib/lib
  fi

  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python3|' "$pkgdir"/usr/bin/as2gbmap
  rm -rf "$pkgdir"/usr/share/info
}
