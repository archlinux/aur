# Maintainer: 2ion <dev@2ion.de>
pkgname=lua-anidb-git
pkgver=r79.b54c373
pkgrel=2
pkgdesc="Client library and command line client for the AniDB.net HTTP API"
arch=('any')
url="https://github.com/2ion/lua-anidb"
license=('GPL3')
depends=('lua' 'lua-posix-git' 'lua-penlight' 'lua-socket' 'lua-zlib' 'lua-ansicolors')
optdepends=(\
  'lua-expat: Recommended, faster XML parser; utilized automatically by lua-penlight')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(\
  'git+https://github.com/2ion/lua-anidb.git#branch=master' \
  'anic-global-package-path.patch')
md5sums=(\
  'SKIP' \
  '585a8e697d0b41ea0de20bbfa6535ca8')

prepare() {
  patch "$srcdir/${pkgname%-git}/anic" < anic-global-package-path.patch
}

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  local _lua_version=$(lua -e 'print(_VERSION:sub(-3,-1))')
  cd "$srcdir/${pkgname%-git}"
  install -m755 -d "$pkgdir"/usr/share/lua/${_lua_version}/anidb/api
  install -Tm755 api/http.lua "$pkgdir"/usr/share/lua/${_lua_version}/anidb/api/http.lua
  install -Dm755 anic "$pkgdir"/usr/bin/anic
}
