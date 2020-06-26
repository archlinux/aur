# Maintainer: Tiago de Paula Peixoto <tiago@skewed.de>

# Remove the --enable-openmp flag below if you do not want parallelization.

pkgname=python-graph-tool
pkgver=2.33
pkgrel=2
pkgdesc='A Python module for manipulation and statistical analysis of graphs'
arch=('i686' 'x86_64')
url='https://graph-tool.skewed.de'
license=(GPL3)
depends=(boost-libs python3 expat python3-scipy python-numpy cgal cairomm python-cairo)
makedepends=(boost sparsehash autoconf-archive)
optdepends=('graphviz: graph layout'
'python-matplotlib: graph drawing')
provides=(python3-graph-tool)
conflicts=(python3-graph-tool)
replaces=(python3-graph-tool)
options=(!libtool)
source=("https://downloads.skewed.de/graph-tool/graph-tool-$pkgver.tar.bz2")
sha256sums=('f07025160a8cb376551508c6d8aa5fd05a146c67c4706ea4635d2766aa5c9fcb')
prepare() {
  cd "$srcdir/graph-tool-$pkgver"
  export CXXFLAGS="-flto=jobserver"
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
