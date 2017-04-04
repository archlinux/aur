# Maintainer: Antonio Cervone <ant dot cervone at gmail dot com>

pkgname=json11-git
_pkgname=json11
pkgver=r100.f450ff3
pkgrel=1
pkgdesc="A tiny JSON library for C++11"
arch=('i686' 'x86_64')
url="https://github.com/dropbox/json11.git"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake')
source=("git+https://github.com/dropbox/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  rm -rf build && mkdir build && cd build
  cmake $srcdir/$_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DBUILD_SHARED_LIBS=ON \
    -DJSON11_BUILD_TESTS=ON
  make
}

check() {
  cd build
  make test
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -D -m644 $srcdir/$_pkgname/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

