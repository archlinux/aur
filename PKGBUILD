# Maintainer: Tiago de Paula Peixoto <tiago@skewed.de>

# Remove the --enable-openmp flag below if you do not want parallelization.

pkgname=python-graph-tool
pkgver=2.59
pkgrel=2
pkgdesc='A Python module for manipulation and statistical analysis of graphs'
arch=('i686' 'x86_64')
url='https://graph-tool.skewed.de'
license=(LGPL3)
depends=(boost-libs python expat python-scipy python-numpy cgal cairomm-1.16 python-cairo python-zstandard python-gobject)
makedepends=(boost sparsehash autoconf-archive)
optdepends=('graphviz: graph layout'
'python-matplotlib: graph drawing')
provides=(python3-graph-tool)
conflicts=(python3-graph-tool)
replaces=(python3-graph-tool)
options=(!libtool)
source=("https://downloads.skewed.de/graph-tool/graph-tool-$pkgver.tar.bz2")
sha256sums=('cde479c0a7254b72f6e795d03b0273b0a7d81611a6a3364ba649c2c85c99acae')
prepare() {
  cd "$srcdir/graph-tool-$pkgver"
  # disable assertions which lead to runtime performance degradation
  CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS/}
  export CXXFLAGS="$CXXFLAGS -O3 -march=native -flto=auto -fno-fat-lto-objects"
  ./configure --enable-openmp --prefix=/usr --docdir="/usr/share/doc/$pkgname"
}

build() {
  cd "$srcdir/graph-tool-$pkgver"
  make -j 1  # most users will be surprised with the high memory usage required for parallel builds
}

check() {
  cd "$srcdir/graph-tool-$pkgver"
  make check
}

package() {
  cd "$srcdir/graph-tool-$pkgver"
  make DESTDIR="$pkgdir/" install
}
