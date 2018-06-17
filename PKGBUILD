# Maintainer: Tiago de Paula Peixoto <tiago@skewed.de>

# Remove the --enable-openmp flag below if you do not want parallelization.

pkgname=python-graph-tool
pkgver=2.26
pkgrel=1
pkgdesc='A Python module for manipulation and statistical analysis of graphs'
arch=('i686' 'x86_64')
url='https://graph-tool.skewed.de'
license=(GPL3)
depends=(boost python3 expat python3-scipy python-numpy cgal cairomm python-cairo)
makedepends=(sparsehash cairomm python-cairo autoconf-archive)
optdepends=('graphviz: graph layout'
'python-matplotlib: graph drawing')
provides=(python3-graph-tool)
conflicts=(python3-graph-tool)
replaces=(python3-graph-tool)
options=(!libtool)
source=("http://downloads.skewed.de/graph-tool/graph-tool-$pkgver.tar.bz2"
        "https://git.skewed.de/count0/graph-tool/commit/9bd68ef9df7cadb2ca537037a425664ce14dc220.diff")
sha256sums=('df6273dc5ef327a0eaf1ef1c46751fce4c0b7573880944e544287b85a068f770'
            '89a56cd125b70ba074950ea6252bdd10a8b2e75cf6ee53b6b38e4855fe066373')
prepare() {
  cd "$srcdir/graph-tool-$pkgver"
  patch -p1 -i ../9bd68ef9df7cadb2ca537037a425664ce14dc220.diff 
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
