# Maintainer: Tiago de Paula Peixoto <tiago@skewed.de>

# Remove the --enable-openmp flag below if you do not want parallelization.

pkgname=python2-graph-tool
pkgver=2.27
pkgrel=1
pkgdesc='A Python module for manipulation and statistical analysis of graphs'
arch=('i686' 'x86_64')
url='https://graph-tool.skewed.de'
license=(GPL3)
depends=(boost python2 expat python2-scipy python2-numpy cgal cairomm python2-cairo)
makedepends=(sparsehash)
optdepends=('graphviz: graph layout'
'python2-matplotlib: graph drawing')
options=(!libtool)
source=("http://downloads.skewed.de/graph-tool/graph-tool-$pkgver.tar.bz2"
        "https://git.skewed.de/count0/graph-tool/commit/aa39e4a6b42d43fac30c841d176c75aff92cc01a.diff")
sha256sums=('4740c69720dfbebf8fb3e77057b3e6a257ccf0432cdaf7345f873247390e4313'
            '5a4ea386342c2de9422da5b07dd4272d47d2cdbba99d9b258bff65a69da562c1')

prepare() {
  cd "$srcdir/graph-tool-$pkgver"
  patch -Np1 -i "${srcdir}/aa39e4a6b42d43fac30c841d176c75aff92cc01a.diff"
  ./configure --enable-openmp --prefix=/usr --docdir="/usr/share/doc/$pkgname" PYTHON=python2
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
