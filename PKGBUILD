# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=bcftools
pkgver=1.2
pkgrel=3
pkgdesc="Reading/writing BCF2/VCF/gVCF files and calling/filtering/summarising SNP and short indel sequence variants"
arch=('i686' 'x86_64')
url="http://samtools.github.io/bcftools/"
license=('GPL')
depends=('gsl' 'htslib' 'perl')
source=($pkgname-$pkgver.tar.gz::https://github.com/samtools/bcftools/archive/$pkgver.tar.gz
        bcftools-profile.sh
        makefile-system-htslib.patch)
md5sums=('87efbd0092b6e4828c17842c9ae57ec9'
         '50efd8fdb3f4c11a5dff7748c666d90e'
         '5ae8f6433b42acf1f4bc7b7658a10805')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  # patch Makefile to make it work with a system-provided htslib
  patch -Np1 -i $srcdir/makefile-system-htslib.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver

  make USE_GPL=1
}

check() {
  cd $srcdir/$pkgname-$pkgver

  make USE_GPL=1 test
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make USE_GPL=1 DESTDIR=$pkgdir prefix=/usr install

  for plugin in plugins/*.so ; do
    install -Dm755 $plugin $pkgdir/usr/lib/bcftools/$(basename $plugin)
  done

  install -Dm644 $srcdir/bcftools-profile.sh $pkgdir/etc/profile.d/bcftools.sh
}
