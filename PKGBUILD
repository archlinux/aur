# Maintainer: Felipe Barriga Richards < felipe at felipebarriga DOT cl >
pkgname=lidarquadtree-git
_pkgver="6b0b2fb"
pkgver="r384.$_pkgver"
pkgrel=1
pkgdesc="Lidarquadtree is a library originally built and used for LAG software. It features disk caching of points to allow it to load potentially very huge datasets and still support spatial indexing, meaning it can be using for LAS processing."
arch=('i686' 'x86_64')
url="https://github.com/arsf/lag/tree/master/lidarquadtree"
license=('GPL2')
source=("git+https://github.com/arsf/lag.git")
md5sums=('SKIP')
depends=(lzo laslib-git)
pkgver() {
  cd "$srcdir/lag"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/lag/lidarquadtree"
  libtoolize
  autoheader
  aclocal
  automake --add-missing
  autoconf
  # when laslib-git package is fixed to be installed
  # on /usr change the following lines...
  export laslib_CFLAGS=-I/usr/local/include
  export laslib_LIBS=-L/usr/lib

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/lag/lidarquadtree"
  make DESTDIR=$pkgdir install
}
