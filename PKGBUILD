# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=tophat
pkgver=2.1.0
pkgrel=3
pkgdesc="fast splice junction mapper for RNA-Seq reads"
arch=('x86_64' 'i686')
url="http://ccb.jhu.edu/software/tophat/index.shtml"
license=('custom')
depends=('boost-libs' 'bowtie2' 'python2')
makedepends=('boost')
source=("http://ccb.jhu.edu/software/tophat/downloads/tophat-$pkgver.tar.gz"
        'https://github.com/seqan/seqan/archive/seqan-v1.4.2.tar.gz'
        'fix_build_w_seqan1.4.patch')
md5sums=('34afa379b030c6672a31bbe3689745bc'
         '7b0080b01feeb223e054dabef53d6fc5'
         '93d47e54408b7b5eb4132d65f5dd5085')

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

  # fixes seqan issues
  rm -rf src/SeqAn-1.3
  patch -Np1 -i $srcdir/fix_build_w_seqan1.4.patch
  sed -e "s|-I./SeqAn-1.3|-I$srcdir/seqan-seqan-v1.4.2/core/include|" \
      -i configure.ac

  autoreconf -fi
}

build() {
  cd $srcdir/$pkgname-$pkgver

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

  # fix python install
  install -d $pkgdir/usr/lib/python2.7/site-packages
  mv \
    -t $pkgdir/usr/lib/python2.7/site-packages \
    $pkgdir/usr/bin/{intervaltree,sortedcontainers}

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
