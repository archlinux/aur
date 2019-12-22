# Maintainer: bilabila <bilabila@qq.com>
_src=LuaFormatter
_pkg=lua-format
_pkgver=1.3.0
_lib=args
_libver=6.2.2
_patch=lib.patch
pkgname=$_pkg-ext
pkgver=$_pkgver
pkgrel=1
pkgdesc='LuaFormatter with extended identifiers'
arch=(x86_64)
url=https://github.com/Koihik/LuaFormatter
provides=($_pkg-ext $_pkg $_src)
conflicts=($_pkg-ext $_pkg $_src)
license=(Apache2)
depends=(antlr4-runtime yaml-cpp)
makedepends=(antlr4)
source=($_pkg-$pkgver::https://github.com/Koihik/$_src/archive/$_pkgver.tar.gz
  $_lib-$_libver::https://github.com/Taywee/$_lib/archive/$_libver.tar.gz
  $_patch
  ext.patch
)
_src=$_src-$pkgver
sha512sums=(1ea6183759c71147128caf36c22bcc5108cf0a4604d5c1ff426b91e6debceeb86f5ead87fef4e4de5e6339f2e35a8d2f7d48bd6722ccfd4e356151749b10fa2c
  29b0f53316fe35f65ab92c807180c1e6cc6084dfed9f635aa2e3e848137ee8e5d24ec6831cf19189c6432335f73d1466564e0bc9bc259c98f3f0de264637f971
  6c12fd6eae7ea8243216378a392e4bc1a3c2d7a6d16cf89c864c8f6656550e73754542e3068000abfd8ae6cd64af21fe4c2aa353e811fd5d2f94343452c6321b
  8747d10775b34b8e413263439b1284bd524ef0ef867e3646774cb5ed4dddf008f852b7a2b6f8a6a1492739a7f931d57e6346cb8b65e00542b7aa8d0b868a4ebc
)
prepare() {
  cd $_src
  rm -rf third_party/$_lib
  ln -sr ../$_lib-$_libver third_party/$_lib
  patch -Np1 -i ../$_patch
  patch -Np1 -i ../ext.patch
}
build() {
  cd $_src
  antlr4 -Dlanguage=Cpp -no-listener -visitor -o generated Lua.g4
  cmake -D BUILD_TESTS=OFF COVERAGE=OFF .
  make
}
package() {
  install -Dm644 $_src/LICENSE "$pkgdir"/usr/share/licenses/$_pkg/LICENSE
  install -Dm755 $_src/$_pkg "$pkgdir"/usr/bin/$_pkg
}
