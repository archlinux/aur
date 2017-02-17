pkgname=solvespace
pkgver=2.3
pkgrel=1
pkgdesc="A parametric 3d CAD program"
arch=('i686' 'x86_64')
url='http://solvespace.com/'
license=('GPL3')
depends=('json-c' 'glew' 'gtkmm')
makedepends=('git' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/solvespace/solvespace/archive/v$pkgver.tar.gz"
        "git+https://github.com/solvespace/libdxfrw.git#commit=3475a9bf811afddde7d0638fbcc2b0200d542b07"
        "solvespace.patch")
sha256sums=('0fdd4ccf81ac0b0efbb6373ae66260aaf6b8f434952c5c44739362093f59fcd7'
            'SKIP'
            'de179d8af6bdcb2868f79e09cc752fd90af2e64bcbbdd4d8c249fa230ef352fb')

prepare() {
  mkdir -p build
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < "$srcdir/solvespace.patch"
  cd "$srcdir/$pkgname-$pkgver/extlib"
  rm -r libdxfrw
  ln -s ../../libdxfrw libdxfrw
}

build() {
  cd build
  cmake ../solvespace-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
