# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=wgs-assembler
pkgver=8.3rc2
pkgrel=1
pkgdesc="Whole-Genome Shotgun Assembler"
arch=('i686' 'x86_64')
url="http://wgs-assembler.sourceforge.net/"
license=('GPL2')
depends=('bzip2' 'gcc-libs' 'samtools')
conflicts=('blasr' 'blasr-git' 'pbdagcon' 'pbdagcon-git')
source=("http://downloads.sourceforge.net/$pkgname/wgs-$pkgver.tar.bz2")
md5sums=('70e8efea279d7061718d442a8c1217b3')

prepare() {
  cd $srcdir/wgs-$pkgver

  rm -rf samtools*

  sed -e 's|@mkdir $(LOCAL_BIN)/TIGR|@mkdir -p $(LOCAL_BIN)/TIGR|' \
      -i src/AS_RUN/Makefile

  sed -e 's|-L/usr/local/lib|$(LDFLAGS)|' \
      -i $(grep -rl -- -L/usr/local/lib .)

  sed -e 's|KMERLIBS         = libmerylguts.a libkmer.a libmeryl.a libseq.a libbio.a libutil.a|KMERLIBS         = $(LOCAL_WORK)/kmer/meryl/libmerylguts.a $(LOCAL_WORK)/kmer/libkmer/libkmer.a $(LOCAL_WORK)/kmer/libmeryl/libmeryl.a $(LOCAL_WORK)/kmer/libseq/libseq.a $(LOCAL_WORK)/kmer/libbio/libbio.a $(LOCAL_WORK)/kmer/libutil/libutil.a|' \
      -i src/AS_MER/Makefile
}

build() {
  cd $srcdir/wgs-$pkgver/kmer

  make install

  cd $srcdir/wgs-$pkgver/src

  make -j1
}

package() {
  cd $srcdir/wgs-$pkgver

  mkdir -p \
    $pkgdir/usr/bin \
    $pkgdir/usr/lib/java/lib \
    $pkgdir/usr/share/perl5/vendor_perl

  cp    Linux-*/bin/*              $pkgdir/usr/bin || true
  cp    Linux-*/lib/*.a            $pkgdir/usr/lib
  cp    Linux-*/lib/java/*.jar     $pkgdir/usr/lib/java
  cp    Linux-*/lib/java/lib/*.jar $pkgdir/usr/lib/java/lib
  cp -r Linux-*/bin/TIGR           $pkgdir/usr/share/perl5/vendor_perl
}
