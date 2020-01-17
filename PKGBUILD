# Maintainer: bilabila <bilabila@qq.com>
_srcname=LuaFormatter
_pkgname=lua-format
_patch=(g4)
pkgname=$_pkgname-ext-git
pkgver=r126.2c3edd0
pkgrel=1
pkgdesc='LuaFormatter with extended identifiers'
arch=(x86_64)
url=https://github.com/tkkcc/LuaFormatter
provides=($_pkgname-ext $_pkgname $_srcname)
conflicts=($_pkgname-ext $_pkgname $_srcname)
license=(Apache2)
depends=()
makedepends=(git cmake antlr4)
source=(git+https://github.com/Koihik/LuaFormatter ${_patch[@]/%/.patch})
sha512sums=(SKIP
  8747d10775b34b8e413263439b1284bd524ef0ef867e3646774cb5ed4dddf008f852b7a2b6f8a6a1492739a7f931d57e6346cb8b65e00542b7aa8d0b868a4ebc
)
pkgver() {
  cd $_srcname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
  cd $_srcname
  git submodule update --init
  for i in ${_patch[@]/%/.patch}; do
    patch -Np1 -i ../$i
  done
}
build() {
  cd $_srcname
  antlr4 -Dlanguage=Cpp -no-listener -visitor -o generated Lua.g4
  cmake -D BUILD_TESTS=OFF COVERAGE=OFF .
  make
}
package() {
  install -Dm644 $_srcname/LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm755 $_srcname/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
