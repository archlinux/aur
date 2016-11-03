pkgname=solvespace
pkgver=2.2
pkgrel=1
pkgdesc="A parametric 3d CAD program"
arch=('i686' 'x86_64')
url='http://solvespace.com/'
license=('GPL3')
depends=('libpng' 'json-c' 'glew' 'gtkmm' 'zlib' 'freetype2' 'fontconfig')
makedepends=('git' 'cmake')
source=("https://github.com/solvespace/solvespace/archive/v$pkgver.tar.gz"
        "git+https://github.com/solvespace/libdxfrw.git#commit=8f95895"
        "v2.2.patch")
md5sums=('114781d60197a95113b0b6d18f60f916'
         'SKIP'
         'f785e1b6036eaca0588e1a09c6b6e92b')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch < "$srcdir/v2.2.patch"
  cd "$srcdir/$pkgname-$pkgver/extlib"
  rmdir libdxfrw
  ln -s ../../libdxfrw libdxfrw
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib ..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
