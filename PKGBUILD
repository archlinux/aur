# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=bcftools
pkgver=1.5
pkgrel=1
pkgdesc="Reading/writing BCF2/VCF/gVCF files and calling/filtering/summarising SNP and short indel sequence variants"
arch=('i686' 'x86_64')
url="http://samtools.github.io/bcftools/"
license=('GPL')
depends=('gsl' 'htslib')
optdepends=('python2: needed for some scripts')
source=(https://github.com/samtools/bcftools/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2)

prepare() {
  cd $srcdir/$pkgname-$pkgver

  # prevent shipped htslib to be used
  rm -rf htslib-$pkgver

  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' \
      -e 's|#!/usr/bin/python|#!/usr/bin/env python2|' \
      -i misc/plot-roh.py misc/guess-ploidy.py
}

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --enable-libgsl \
    --with-bcf-plugin-dir=/usr/lib/$pkgname \
    --with-cblas=gslcblas \
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
}

md5sums=('e43efe3df5f9c55acb4b48cee214d281')
