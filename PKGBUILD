# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=tophat
pkgver=2.1.1
pkgrel=2
pkgdesc="fast splice junction mapper for RNA-Seq reads"
arch=('x86_64' 'i686')
url="http://ccb.jhu.edu/software/tophat/index.shtml"
license=('custom')
depends=('boost-libs' 'bowtie2' 'python2')
makedepends=('boost')
source=("http://ccb.jhu.edu/software/tophat/downloads/tophat-$pkgver.tar.gz"
        'make_pair.patch')
md5sums=('4b2391de46457ba6b2b7268a9da593e4'
         '53378885f3620a1d02fb345077609d05')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  sed -e 's|make $(SAMPROG)|make -e $(SAMPROG)|' \
      -i src/Makefile.am

  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' \
      -i src/bed_to_juncs \
         src/contig_to_chr_coords \
         src/sra_to_solid \
         src/tophat-fusion-post \
         src/tophat.py

  patch -Np1 -i $srcdir/make_pair.patch
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
