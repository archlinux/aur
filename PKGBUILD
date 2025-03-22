# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: René Wagner < rwagner at rw-net dot de >
# Contributor: Diab Neiroukh <lazerl0rd@thezest.dev>

pkgname=mimalloc
pkgver=2.2.2
pkgrel=1
pkgdesc='General-purpose allocator with excellent performance characteristics'
arch=('x86_64')
url='https://github.com/microsoft/mimalloc'
license=('MIT')
depends=('glibc')
makedepends=('git' 'cmake')
source=(
  "$pkgname::git+$url#tag=v$pkgver"
  'remove-staticlib-refs.patch'
)
sha512sums=('43d65dffe0b10d9d26e0a759e6d2d3aa901e5b063b30a1e43be228b8f074e0f05c4f5eb25c7d957435554d88e7f7ec0c0b9ca66154304d7d5a73ed2eee01fc2d'
            'e8a32f066f269d449a765ddc54c192ce7b615e034753b1ffdc66153374e9b7f1973ebc7acf45a90f8ccf05962708f9288e4c5f3819abfe2c909530152e24437a')
b2sums=('6c2bc9c3d974097a48f015e6d9073c8f66f6976dfcaa474fa8405d3a7c2b413ff470c1c6c8f7718c4acbb7ea7751a7f107e20244a0cdbc3e8b39529e56147019'
        'b34f447b1cf74110c97404fe815329cf84ae8ff798766eefc0f4e451cf52211e5745463c3d99209eafa8d3e1bc02ca66b5e526c04773ec5a21b626b428942f1c')

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

  pushd "$pkgdir/usr/lib/cmake/mimalloc"
  patch -p1 -i "$srcdir/remove-staticlib-refs.patch"
  popd

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname/LICENSE"
}
