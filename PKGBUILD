# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
# Contributor: Markus Heuser <markus.heuser@web.de>

pkgname=samtools
pkgver=1.2
pkgrel=2
pkgdesc="tools for manipulating next-generation sequencing data"
arch=('i686' 'x86_64')
url="http://www.htslib.org/"
license=('custom')
depends=('perl' 'htslib')
optdepends=('luajit: needed for r2plot.lua vcfutils.lua'
            'python2: needed for varfilter.py')
options=('staticlibs')
source=($pkgname-$pkgver.tar.gz::https://github.com/samtools/samtools/archive/$pkgver.tar.gz
        makefile-system-htslib.patch)
md5sums=('2748356ef392c0694ca1142de37cf2aa'
         '00f3b0b730f37cd7c8ff12376a9a0c6a')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  # patch Makefile to make it work with a system-provided htslib
  patch -Np1 -i $srcdir/makefile-system-htslib.patch

  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' \
      -i misc/varfilter.py
}

build() {
  cd $srcdir/$pkgname-$pkgver

  make HTSDIR=/usr/include HTSLIB= BGZIP= LDLIBS=-lhts
}

check() {
  cd $srcdir/$pkgname-$pkgver

  make HTSDIR=/usr/include HTSLIB= BGZIP= LDLIBS=-lhts check
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make HTSDIR=/usr/include HTSLIB= BGZIP= LDLIBS=-lhts DESTDIR=$pkgdir prefix=/usr install

  for file in misc/*.lua ; do
    install -Dm755 $file $pkgdir/usr/bin/$(basename $file)
  done

  install -d $pkgdir/usr/include/bam
  install -Dm644 *.h $pkgdir/usr/include/bam

  install -Dm644 libbam.a $pkgdir/usr/lib/libbam.a

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
