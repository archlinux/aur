# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=bcftools
pkgver=1.4.1
pkgrel=1
pkgdesc="Reading/writing BCF2/VCF/gVCF files and calling/filtering/summarising SNP and short indel sequence variants"
arch=('i686' 'x86_64')
url="http://samtools.github.io/bcftools/"
license=('GPL')
depends=('gsl' 'htslib')
optdepends=('python2: needed for some scripts')
source=(https://github.com/samtools/bcftools/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2
        makefile-system-htslib.patch)

prepare() {
  cd $srcdir/$pkgname-$pkgver

  # prevent shipped htslib to be used
  rm -rf htslib-$pkgver

  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' \
      -e 's|#!/usr/bin/python|#!/usr/bin/env python2|' \
      -i misc/plot-roh.py misc/guess-ploidy.py

  # patch Makefile to make it work with a system-provided htslib
  patch -i $srcdir/makefile-system-htslib.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver

  make prefix=/usr plugindir=/usr/lib/$pkgname USE_GPL=1
}

check() {
  cd $srcdir/$pkgname-$pkgver

  make prefix=/usr plugindir=/usr/lib/$pkgname USE_GPL=1 test
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make prefix=/usr plugindir=/usr/lib/$pkgname USE_GPL=1 DESTDIR=$pkgdir install
}

md5sums=('103729569ca3e265b13d2fed5775016e'
         '1777e7d3bcfd428de407f62c870904cb')
