# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Jose Negron <josenj.arch@mailnull.net>

pkgname=sdcc
pkgver=3.7.0
pkgrel=4
pkgdesc="Retargettable ANSI C compiler (Intel 8051, Maxim 80DS390, Zilog Z80 and the Motorola 68HC08)"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('bash' 'gcc-libs' 'boost-libs')
makedepends=('gputils' 'flex' 'bison' 'patch' 'boost')
optdepends=('python')
url="http://sdcc.sourceforge.net/"
options=(!strip  staticlibs)
source=(https://downloads.sourceforge.net/sourceforge/sdcc/$pkgname-src-${pkgver//_/-}.tar.bz2
        glibc220-build-fix.patch)
md5sums=('76cc85d7ff27c46b930d309ea940a02f'
         'de3be2a60baaafbdbfe5efaaacbb3028')

prepare() {
  cd "$srcdir"/$pkgname
  sed -i 's|CC -E|CC -O2 -E|g' support/sdbinutils/libiberty/configure

  # Fix build with glibc 2.20
  # http://sourceforge.net/p/sdcc/bugs/2303/
  # patch -Np0 -i ../glibc220-build-fix.patch
}

build() {
  cd "$srcdir"/$pkgname
  ./configure \
	--prefix=/usr \
	--includedir=/usr/include/sdcc \
	--libdir=/usr/lib/sdcc \
	--disable-werror
  make
}

package() {
  cd "$srcdir"/$pkgname

  make install DESTDIR="$pkgdir"

  if [ -d "$pkgdir"/usr/lib/lib ]; then
    mv "$pkgdir"/usr/lib/lib/* "$pkgdir"/usr/lib/sdcc/
    rm -rf "$pkgdir"/usr/lib/lib
  fi

  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python3|' "$pkgdir"/usr/bin/as2gbmap
  rm -rf "$pkgdir"/usr/share/info
}
