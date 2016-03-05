# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=bcftools
pkgver=1.3
pkgrel=2
pkgdesc="Reading/writing BCF2/VCF/gVCF files and calling/filtering/summarising SNP and short indel sequence variants"
arch=('i686' 'x86_64')
url="http://samtools.github.io/bcftools/"
license=('GPL')
depends=('htslib' 'perl') # 'gsl'
source=(https://github.com/samtools/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2
        makefile-system-htslib.patch)
md5sums=('17f1f7d9e4a03d64a114b43ca896899f'
         'e5145d175dcd242634baf42749b838f0')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  # prevent shipped htslib to be used
  rm -rf htslib-1.3

  # patch Makefile to make it work with a system-provided htslib
  patch -i $srcdir/makefile-system-htslib.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver

  make prefix=/usr plugindir=/usr/lib/$pkgname # USE_GPL=1
}

check() {
  cd $srcdir/$pkgname-$pkgver

  make prefix=/usr plugindir=/usr/lib/$pkgname # USE_GPL=1 test
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make prefix=/usr plugindir=/usr/lib/$pkgname DESTDIR=$pkgdir install # USE_GPL=1
}
