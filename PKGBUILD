# Maintainer: Tiago de Paula Peixoto <tiago@skewed.de>

# Remove the --enable-openmp flag below if you do not want parallelization.

pkgname=python2-graph-tool
pkgver=2.28
pkgrel=1
pkgdesc='A Python module for manipulation and statistical analysis of graphs'
arch=('i686' 'x86_64')
url='https://graph-tool.skewed.de'
license=(GPL3)
depends=(boost-libs python2 expat python2-scipy python2-numpy cgal cairomm python2-cairo)
makedepends=(boost sparsehash)
optdepends=('graphviz: graph layout'
'python2-matplotlib: graph drawing')
options=(!libtool)
source=("https://downloads.skewed.de/graph-tool/graph-tool-$pkgver.tar.bz2"
	"https://git.skewed.de/count0/graph-tool/commit/c3a5066bc256e5d7ed450f89b324e84eb42fb511.diff")
sha256sums=('a2dbe0c926c058b1a6f696a05b9d9b65a3ceed57b8b6b0fe1474076bca9f8111'
            '3e3480b8b3c0018651c8e91e236f88af93e61d75aca87f4d2b3f606966133618')

prepare() {
  cd "$srcdir/graph-tool-$pkgver"
  patch -Np1 -i "${srcdir}/c3a5066bc256e5d7ed450f89b324e84eb42fb511.diff"
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
