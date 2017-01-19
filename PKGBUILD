# Maintainer: Felipe Barriga Richards < felipe at felipebarriga DOT cl >
pkgname=lag-git
_pkgver="6b0b2fb"
pkgver="r384.$_pkgver"
pkgrel=1
pkgdesc="LAG is a software for visualisation, analysis and processing of LiDAR data."
arch=('i686' 'x86_64')
url="https://github.com/arsf/lag"
license=('GPL2')
source=("git+https://github.com/arsf/lag.git" 0001-bugfix-lag.cpp-fix-opengl-context-creation.patch)
md5sums=('SKIP' '794eb60e1fcb9bfcc5a934a70709d87f')
depends=(laslib-git lidarquadtree-git boost gtkmm gtkglextmm libgeotiff)
pkgver() {
  cd "$srcdir/lag"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/lag"
  patch -p1 < "$srcdir/0001-bugfix-lag.cpp-fix-opengl-context-creation.patch"

  libtoolize
  autoheader
  aclocal
  automake --add-missing
  autoconf
  # when laslib-git package is fixed to be installed
  # on /usr change the following lines...
  export laslib_CFLAGS=-I/usr/local/include
  export laslib_LIBS=-L/usr/lib
  export lidarquadtree_CFLAGS=-I/usr/include/lidar/quadtree
  export lidarquadtree_LIBS=-llidarquadtree

  ./configure --prefix=/usr LIBS="-ldl /usr/lib/liblaslib.a"
  make
}

package() {
  cd "$srcdir/lag"
  make DESTDIR=$pkgdir install
}
