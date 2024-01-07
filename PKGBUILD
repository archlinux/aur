# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Yushin Huang <hyslion AT gmail.com>

_pkgname=libchewing
pkgname=libchewing-rust-git
pkgver=0.6.0rc.1.r0.g06b577b
pkgrel=1
epoch=1
pkgdesc='Intelligent Chinese phonetic input method (experimental Rust implementation)'
url='https://chewing.im/'
arch=('i686' 'x86_64')
license=('LGPL2.1')
conflicts=("$_pkgname" "$_pkgname-git")
provides=("$_pkgname" "$_pkgname-git")
depends=('sqlite')
makedepends=('cmake' 'git' 'rust')
source=("git+https://github.com/chewing/libchewing/")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-rc/rc/;s/-/./g;s/^v//'
  )
}

prepare() {
  cd "$_pkgname"
  mkdir build
}

build() {
  cd $_pkgname/build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DBUILD_INFO=ON \
    -DWITH_RUST=ON \
    ..
  make
}

check() {
  cd $_pkgname/build
  # parallel testing is broken (https://github.com/chewing/libchewing/issues/293)
  make -j1 check
  # Additional tests added in https://github.com/chewing/libchewing/pull/387
  cargo test
}

package() {
  cd $_pkgname/build
  make DESTDIR="$pkgdir" install
}
