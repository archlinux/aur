# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildbox-common
pkgver=0.0.44.r0.gdc9c1f3
pkgrel=1
pkgdesc="Shared protocol-buffer definitions and various helper functions"
arch=(x86_64)
url="https://buildgrid.build"
license=('Apache')
depends=('c-ares' 'grpc' 'gtest' 'gmock' 'gflags' 'google-glog' 'benchmark')
makedepends=('cmake' 'git')
_commit=dc9c1f311e977f6b67c6b4a2a355c06ef7d2badb # release 0.0.44
source=("git+https://gitlab.com/BuildGrid/buildbox/buildbox-common#commit=$_commit"
        "include-memory.patch")
sha256sums=('SKIP'
            'b64d568eeb1d07d62920d3c563ba2cc1c0b4ef62e0252b3d44ade5e21a8b0567')

prepare() {
  cd $pkgname
  git apply "$srcdir/include-memory.patch"
}

pkgver() {
  cd $pkgname
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p build
  cd build
  cmake ../$pkgname             \
    -DCMAKE_BUILD_TYPE=Release  \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

check() {
  cd build
  make -k test
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
