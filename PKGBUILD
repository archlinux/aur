# Maintainer: Daniel Müllner <daniel@danifold.net>

# Remove the --enable-openmp flag below if you do not want parallelization.

pkgname=python-graph-tool
pkgver=2.12
pkgrel=2
pkgdesc='A Python module for manipulation and statistical analysis of graphs'
arch=('i686' 'x86_64')
url='http://projects.skewed.de/graph-tool/'
license=(GPL3)
depends=(boost python3 expat python3-scipy python3-numpy cgal)
makedepends=(sparsehash python2-cairo autoconf-archive)
optdepends=('graphviz: graph layout'
'cairomm: graph drawing'
'python-cairo: graph drawing'
'python-matplotlib: graph drawing')
provides=(python3-graph-tool)
conflicts=(python3-graph-tool)
replaces=(python3-graph-tool)
options=(!libtool)
source=("http://downloads.skewed.de/graph-tool/graph-tool-$pkgver.tar.bz2")
sha256sums=('ac5fdd65cdedb568302d302b453fe142b875f23e3500fe814a73c88db49993a9')

prepare() {
  cd "$srcdir/graph-tool-$pkgver"
  find -type f -print0 | xargs -0 sed -i 's/ placeholders:/ std::placeholders:/g'
  # Remove information about the source directory, which is temporary.
  sed -i '/AC_DEFINE_UNQUOTED(\[PACKAGE_SOURCE_DIR\].*)/d' configure.ac
  rm m4/ax_boost_python.m4
  aclocal
  autoconf
  ./configure --enable-openmp --prefix=/usr --docdir="/usr/share/doc/$pkgname"
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
