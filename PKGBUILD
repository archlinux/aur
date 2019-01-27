# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=('lua-socket-git' 'lua51-socket-git' 'lua52-socket-git')
pkgbase=lua-socket-git
pkgver=646.288219f
pkgrel=1
pkgdesc="Network support for the Lua language"
arch=('i686' 'x86_64')
url="http://www.impa.br/~diego/software/luasocket"
license=('MIT')
source=("$pkgbase::git+https://github.com/diegonehab/luasocket.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/"$pkgbase"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

_package_helper() {
  _lua_ver=$1
  _lua_ver_nodot=${_lua_ver//.}

  mkdir -p "$_lua_ver"
  cd "$pkgbase"
  luarocks-${_lua_ver} make --pack-binary-rock --deps-mode=none luasocket-scm-0.rockspec
  mv *.rock ../${_lua_ver}/
  luarocks-${_lua_ver} install --tree="$pkgdir/usr/" --deps-mode=none ../${_lua_ver}/*.rock
  find "$pkgdir/usr" -name manifest -delete
}

package_lua51-socket-git() {
  depends=('lua51' 'luarocks5.1')
  provides=('lua51-socket')

  _package_helper "5.1"
}

package_lua52-socket-git() {
  depends=('lua52' 'luarocks5.2')
  provides=('lua52-socket')

  _package_helper "5.2"
}

package_lua-socket-git() {
  depends=('lua' 'luarocks')
  provides=('lua-socket')

  _package_helper "5.3"
}
