# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: René Wagner < rwagner at rw-net dot de >
# Contributor: Diab Neiroukh <lazerl0rd@thezest.dev>

pkgname=mimalloc
pkgver=2.1.2
pkgrel=1
pkgdesc='General-purpose allocator with excellent performance characteristics'
arch=('x86_64')
url='https://github.com/microsoft/mimalloc'
license=('MIT')
depends=('glibc')
makedepends=('git' 'cmake')
_commit='43ce4bd7fd34bcc730c1c7471c99995597415488'
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
