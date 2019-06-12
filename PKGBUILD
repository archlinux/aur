# Maintainer: bilabila <bilabila@qq.com>
_srcname=LuaFormatter
_pkgname=lua-format
_patch=(antlr4 g4 xdg_config)
pkgname=$_pkgname-ext-git
pkgver=r56.c068f4c
pkgrel=1
pkgdesc='LuaFormatter with extended identifiers'
arch=(x86_64)
url=https://github.com/tkkcc/LuaFormatter
provides=($_pkgname-ext $_pkgname $_srcname)
conflicts=($_pkgname-ext $_pkgname $_srcname)
license=(Apache2)
depends=(antlr4-runtime)
makedepends=(antlr4)
source=(git+https://github.com/Koihik/LuaFormatter ${_patch[@]/%/.patch})
sha512sums=(SKIP
  e33afdda51c9ab3aa23a7ccad536762f2807972e9bde52ea67793dbc9bb3c3884daf2fed830d44f0b34c6f7bef2e327af8634293fba74ceb091bf71bbd2fe662
  8747d10775b34b8e413263439b1284bd524ef0ef867e3646774cb5ed4dddf008f852b7a2b6f8a6a1492739a7f931d57e6346cb8b65e00542b7aa8d0b868a4ebc
  5497aa0fdc9d514049669e68b1eb4d140528403fa4a2846e3a7b5906ad7798a0108713d5d7a2accfe9ba69f0b8785ab2aa300731eec316e4c74ce08f573cc888)
pkgver() {
  cd $_srcname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
  cd $_srcname
  for i in ${_patch[@]/%/.patch};do
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
