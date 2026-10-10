# Maintainer: hiruocha <hiruocha[at]outlook[dot]com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: René Wagner < rwagner at rw-net dot de >
# Contributor: Diab Neiroukh <lazerl0rd@thezest.dev>

pkgname=mimalloc2
pkgver=2.2.4
pkgrel=1
pkgdesc='General-purpose allocator with excellent performance characteristics'
arch=('x86_64')
url='https://github.com/microsoft/mimalloc'
license=('MIT')
depends=('glibc')
makedepends=('git' 'cmake')
provides=('libmimalloc.so=2-64')
source=(
  "$pkgname::git+$url#tag=v$pkgver"
)
sha512sums=('9d4b6aa445c7cf1056fdd0e7aebfb534784e591c267f20242085aa3249dd9f92069bda52e7325f0b262a2063581ddfe7cabee47cfe171c46c69e834250acd65f')
b2sums=('c998cacfd3711eaddde276d26ab99955ef326d9587b2865ddbf183524989c8258d4c4ce7d15b28dace975f84f057248519035f9bbd4d574b522c8010130fcf93')

build() {
  cmake \
    -B build \
    -S "$pkgname" \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release \
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

  rm -rf "$pkgdir/usr/include"
  rm -rf "$pkgdir/usr/lib/cmake"
  rm -rf "$pkgdir/usr/lib/pkgconfig"
  rm -f "$pkgdir/usr/lib/libmimalloc.a"
  rm -f "$pkgdir/usr/lib/libmimalloc.so"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname/LICENSE"
}
