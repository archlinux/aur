# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=tophat
pkgver=2.1.0
pkgrel=1
pkgdesc="fast splice junction mapper for RNA-Seq reads"
arch=('x86_64' 'i686')
url="http://ccb.jhu.edu/software/tophat/index.shtml"
license=('BSL')
depends=('boost-libs' 'bowtie2' 'python2')
makedepends=('boost')
source=("http://ccb.jhu.edu/software/tophat/downloads/tophat-$pkgver.tar.gz")
md5sums=('1ace6e96fa692af6ed885bad5fe7c4d7')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  sed -e 's|-gdwarf-2||' \
      -e '/define.*esyscmd/d' \
      -e 's/svnversion/Unversioned directory/' \
      -i configure.ac

  sed -e 's|make $(SAMPROG)|make -e $(SAMPROG)|' \
      -i src/Makefile.am

  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' \
      -i src/bed_to_juncs \
         src/contig_to_chr_coords \
         src/sra_to_solid \
         src/tophat.py \
         src/tophat-fusion-post

  autoreconf -fi
}

build() {
  cd $srcdir/$pkgname-$pkgver

  export CC=clang
  export CXX=clang++
  export PYTHON=python2

  ./configure --prefix=/usr

  # do not link against system-installed libbam.a
  sed -e 's|-L/usr/lib||' \
      -i Makefile src/Makefile

  make -j1
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install
}
