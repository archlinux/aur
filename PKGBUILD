
# Maintainer: Nick Barrett <nick.barrett.93@gmail.com>
pkgname=anax
pkgver=v2.0.0.r9.g448e6c3
pkgrel=1
pkgdesc="An open source C++ entity system"
arch=('i686' 'x86_64')
url="https://github.com/miguelmartin75/anax"
license=('MIT')
groups=()
depends=(boost)
makedepends=('git' 'cmake')
provides=("$pkgname")
conflicts=("$pkgname")
backup=()
options=()
source=("patchfile" "$pkgname::git+https://github.com/miguelmartin75/anax.git")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/$pkgname"

# Git, tags available
  git describe --tags | git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
# Run cmake here
  rm -fr build
  mkdir build 
  cd build
  cmake .. -DBUILD_SHARED_LIBS=false -DBUILD_DOCS=true -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir/" install
  cd $srcdir
  patch -Np0 -i patchfile
  mkdir -p $pkgdir/usr/lib/cmake/anax
  cp $pkgname/cmake/Modules/Findanax.cmake $pkgdir/usr/lib/cmake/anax/anaxConfig.cmake
}
