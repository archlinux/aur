# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: René Wagner < rwagner at rw-net dot de >
# Contributor: Diab Neiroukh <lazerl0rd@thezest.dev>

pkgname=mimalloc
pkgver=2.0.7
pkgrel=1
pkgdesc='General-purpose allocator with excellent performance characteristics'
arch=('x86_64')
url='https://github.com/microsoft/mimalloc'
license=('MIT')
depends=('glibc')
makedepends=('git' 'cmake')
options=('debug')
_commit='91ba1f374da66e624841f53f6659da3a8f8f93ea'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cmake \
    -B build \
    -S "$pkgname" \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D MI_BUILD_STATIC=OFF \
    -D MI_BUILD_OBJECT=OFF \
    -D MI_INSTALL_TOPLEVEL=ON

  cmake --build build
}

check() {
  cd build

  ctest --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname/LICENSE"
}
