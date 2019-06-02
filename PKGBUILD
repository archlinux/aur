# Maintainer: bilabila <bilabila@qq.com>
_srcname=LuaFormatter
_pkgname=lua-format
pkgname=$_pkgname-ext-git
pkgver=r50.21e0205
pkgrel=5
pkgdesc='LuaFormatter with extended identifiers'
arch=(x86_64)
url=https://github.com/tkkcc/LuaFormatter
provides=($_pkgname-ext $_pkgname $_srcname)
conflicts=($_pkgname-ext $_pkgname $_srcname)
license=(Apache2)
depends=(antlr4-runtime)
makedepends=(antlr4)
source=(git+https://github.com/Koihik/LuaFormatter
  antlr4.patch
  g4.patch)
sha512sums=(SKIP
  e33afdda51c9ab3aa23a7ccad536762f2807972e9bde52ea67793dbc9bb3c3884daf2fed830d44f0b34c6f7bef2e327af8634293fba74ceb091bf71bbd2fe662
  8b15e06a09db2ce1462011b4484336873825660268a3d97d982c9f49a600016f0e35e16e24d3e1cb1004a0a910b39ab85e2a7654f86f6c2e9f59c06ee056da63)
pkgver() {
  cd $_srcname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
  cd $_srcname
  patch -Np1 -i ../antlr4.patch
  patch -Np1 -i ../g4.patch
}
build() {
  cd $_srcname
  antlr4 -Dlanguage=Cpp -no-listener -visitor -o generated Lua.g4
  cmake -D BUILD_TESTS=OFF COVERAGE=OFF .
  make clean
  make
}
package() {
  install -Dm644 $_srcname/LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm755 $_srcname/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
