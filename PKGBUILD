# Maintainer: bilabila <bilabila@qq.com>
_srcname=LuaFormatter
_pkgname=lua-format
_patch=(g4)
pkgname=$_pkgname-ext
pkgver=1.3.6
pkgrel=3
pkgdesc='LuaFormatter with extended identifiers'
arch=(x86_64 aarch64)
url=https://github.com/tkkcc/LuaFormatter
provides=($_pkgname-ext $_pkgname $_srcname)
conflicts=($_pkgname-ext $_pkgname $_srcname)
license=(Apache2)
depends=()
makedepends=(git cmake java-environment)
source=(
  git+https://github.com/Koihik/LuaFormatter#tag=1.3.6 ${_patch[@]/%/.patch}
  antlr4.jar::https://www.antlr.org/download/antlr-4.7.1-complete.jar
)
sha512sums=(
  SKIP
  8747d10775b34b8e413263439b1284bd524ef0ef867e3646774cb5ed4dddf008f852b7a2b6f8a6a1492739a7f931d57e6346cb8b65e00542b7aa8d0b868a4ebc
  de1c230d7294e05ac7b451cbc639bab9d416a674b281e21092fb4a9329ca8b6d4b92b9ad78a9771cff475a1610f1d0419819c4619bdff36c683019da67ef13b1
)
prepare() {
  cd $_srcname
  git submodule update --init
  for i in ${_patch[@]/%/.patch}; do
    patch -Np1 -i ../$i
  done
}
build() {
  cd $_srcname
  java -jar ../antlr4.jar -Dlanguage=Cpp -no-listener -visitor -o generated Lua.g4
  cmake -D BUILD_TESTS=OFF -D COVERAGE=OFF .
  make
}
package() {
  install -Dm644 $_srcname/LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm755 $_srcname/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
