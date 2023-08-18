# Maintainer: Tiago de Paula Peixoto <tiago@skewed.de>

_pkgname=python-graph-tool
pkgname=python-graph-tool-git
pkgver=99
pkgrel=1
pkgdesc='A Python module for manipulation and statistical analysis of graphs'
arch=('i686' 'x86_64')
url='https://graph-tool.skewed.de'
license=(GPL3)
depends=(boost-libs python expat python-scipy python-numpy cgal cairomm-1.16 python-cairo python-zstandard python-gobject)
makedepends=(boost sparsehash autoconf-archive)
optdepends=('graphviz: graph layout'
            'python-matplotlib: graph drawing')
provides=("$_pkgname")
conflicts=(python3-graph-tool)
replaces=(python3-graph-tool)
options=(!libtool)
source=("$pkgname::git+https://git.skewed.de/count0/graph-tool.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/release\.//'
}

build() {
  cd "$pkgname"
  ./autogen.sh
  # disable assertions which lead to runtime performance degradation
  CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS/}
  export CXXFLAGS="$CXXFLAGS -O3 -march=native -flto=auto -fno-fat-lto-objects"
  ./configure --enable-openmp --prefix=/usr --docdir="/usr/share/doc/$_pkgname"
  make -j 1  # most users will be surprised with the high memory usage required for parallel builds
}

check() {
  cd "$pkgname"
  make check
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}
