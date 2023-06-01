# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=tophat
pkgver=2.1.2
pkgrel=3
pkgdesc="fast splice junction mapper for RNA-Seq reads"
arch=('x86_64' 'i686')
url="http://ccb.jhu.edu/software/tophat/index.shtml"
license=('custom')
depends=('boost-libs' 'bowtie2' 'python')
makedepends=('boost' 'clang')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/DaehwanKimLab/tophat/archive/refs/tags/v${pkgver}.tar.gz"
        'make_pair.patch'
        'configure.patch'
        )
md5sums=('db844fd7f53c519e716cd6222e6195b2'
         '4f53cd3e611c2a0744babede14c3ae66'
         '175420b0b08f2979d9585ec55cbeb0ee')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  sed -e 's|make $(SAMPROG)|make -e $(SAMPROG)|' \
      -i src/Makefile.am

  # sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' \
  #     -i src/bed_to_juncs \
  #        src/contig_to_chr_coords \
  #        src/sra_to_solid \
  #        src/tophat-fusion-post \
  #        src/tophat.py

  # to python3
  2to3 -w  -n .

  patch -Np1 -i $srcdir/make_pair.patch
  patch -Np0 -i $srcdir/configure.patch
  autoreconf -i
  autoupdate
  autoconf
}

build() {
  cd $srcdir/$pkgname-$pkgver
  export CC=clang
  export CXX=clang++
  ./configure --prefix=/usr --with-python-sys-prefix

  # do not link against system-installed libbam.a
  sed -e 's|-L/usr/lib||' \
      -i Makefile src/Makefile

  make -j1
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install

  # fix python install
  _pyver=$(python -V | cut -d ' '  -f2)
  install -d $pkgdir/usr/lib/python${_pyver:0:4}/site-packages
  mv \
    -t $pkgdir/usr/lib/python${_pyver:0:4}/site-packages \
    $pkgdir/usr/bin/{intervaltree,sortedcontainers}

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
