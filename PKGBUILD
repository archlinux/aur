# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=zig
pkgver=0.0.0
pkgrel=4
pkgdesc='System programming language intended to replace C'
arch=('x86_64' 'i686')
url='http://ziglang.org/'
license=('MIT')
depends=('llvm' 'clang')
makedepends=('cmake')
source=("git://github.com/andrewrk/zig.git#commit=f18e34c"
        "https://github.com/andrewrk/zig/commit/3f05fdc8e8fdc25faec2ca51547404411b314ce1.patch")
md5sums=('SKIP'
         '8a106418ee946cb978dbced687836298')

prepare() {
  cd "$pkgname"

  patch -p1 -i ../3f05fdc8e8fdc25faec2ca51547404411b314ce1.patch
}

build() {
  mkdir -p build
  cd build
  cmake "../$pkgname" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DZIG_LIBC_LIB_DIR=$(dirname $(cc -print-file-name=crt1.o)) \
    -DZIG_LIBC_INCLUDE_DIR=$(echo -n | cc -E -x c - -v 2>&1 | grep -B1 "End of search list." | head -n1 | cut -c 2-) \
    -DZIG_LIBC_STATIC_LIB_DIR=$(dirname $(cc -print-file-name=crtbegin.o)) \
    -GNinja
  ninja
}

check() {
  cd build

  ./run_tests
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
