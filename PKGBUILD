# Maintainer: Daniel Müllner <daniel@danifold.net>

# Remove the --enable-openmp flag below if you do not want parallelization.

pkgname=python2-graph-tool
pkgver=2.12
pkgrel=2
pkgdesc='A Python module for manipulation and statistical analysis of graphs'
arch=('i686' 'x86_64')
url='http://projects.skewed.de/graph-tool/'
license=(GPL3)
depends=(boost python2 expat python2-scipy python2-numpy cgal)
makedepends=(sparsehash python2-cairo)
optdepends=('graphviz: graph layout'
'cairomm: graph drawing'
'python2-cairo: graph drawing'
'python2-matplotlib: graph drawing')
options=(!libtool)
source=("http://downloads.skewed.de/graph-tool/graph-tool-$pkgver.tar.bz2")
sha256sums=('ac5fdd65cdedb568302d302b453fe142b875f23e3500fe814a73c88db49993a9')

prepare() {
  cd "$srcdir/graph-tool-$pkgver"
  find -type f -print0 | xargs -0 sed -i 's/ placeholders:/ std::placeholders:/g'
  # Remove information about the source directory, which is temporary.
  sed -i '/AC_DEFINE_UNQUOTED(\[PACKAGE_SOURCE_DIR\].*)/d' configure.ac
  autoconf
  ./configure --enable-openmp --prefix=/usr --docdir="/usr/share/doc/$pkgname" PYTHON=python2
}

build() {
  cd "$srcdir/graph-tool-$pkgver"
  make
}

check() {
  cd "$srcdir/graph-tool-$pkgver"
  make check
}

package() {
  cd "$srcdir/graph-tool-$pkgver"
  make DESTDIR="$pkgdir/" install
}
