# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
# Contributor: Markus Heuser <markus.heuser@web.de>

pkgname=samtools
pkgver=1.3
pkgrel=1
pkgdesc="tools for manipulating next-generation sequencing data"
arch=('i686' 'x86_64')
url="http://www.htslib.org/"
license=('custom')
depends=('htslib' 'perl')
optdepends=('luajit: needed for r2plot.lua vcfutils.lua'
            'python2: needed for varfilter.py')
options=('staticlibs')
source=(https://github.com/samtools/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('7ab98b5c988e254d9bb5d796bf9337c9')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  # prevent shipped htslib to be used
  rm -rf htslib-1.3

  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' \
      -i misc/varfilter.py
}

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --with-htslib=system

  make
}

check() {
  cd $srcdir/$pkgname-$pkgver

  make check
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install

  for file in misc/*.lua ; do
    install -Dm755 $file $pkgdir/usr/bin/$(basename $file)
  done

  install -d $pkgdir/usr/include/bam
  install -Dm644 *.h $pkgdir/usr/include/bam

  install -Dm644 libbam.a $pkgdir/usr/lib/libbam.a

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
