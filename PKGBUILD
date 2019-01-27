# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=('lua-cgilua-git' 'lua51-cgilua-git' 'lua52-cgilua-git')
pkgbase=lua-cgilua-git
_rockname=cgilua
pkgver=527.cd1a504
pkgrel=1
pkgdesc="CGILua is a tool for creating dynamic HTML pages and manipulating input data from Web forms."
arch=('i686' 'x86_64')
url="http://keplerproject.github.com/cgilua"
license=('MIT')
source=("$pkgbase::git+https://github.com/keplerproject/cgilua.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/"$pkgbase"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

_package_helper() {
  _lua_ver=$1

  mkdir -p "$_lua_ver"
  cd "$pkgbase"
  luarocks-${_lua_ver} make --pack-binary-rock --deps-mode=none rockspec/${_rockname}-6.0.0-0.rockspec # The CVS rockspecs seem broken
  mv *.rock ../${_lua_ver}/
  luarocks-${_lua_ver} install --tree="$pkgdir/usr/" --deps-mode=none ../${_lua_ver}/*.rock
  find "$pkgdir/usr" -name manifest -delete
}

package_lua51-cgilua-git() {
  depends=('lua51' 'lua51-filesystem' 'luarocks5.1')
  provides=('lua51-cgilua')

  _package_helper "5.1"
}

package_lua52-cgilua-git() {
  depends=('lua52' 'lua52-filesystem' 'luarocks5.2')
  provides=('lua52-cgilua')

  _package_helper "5.2"
}

package_lua-cgilua-git() {
  depends=('lua' 'lua-filesystem' 'luarocks')
  provides=('lua-cgilua')

  _package_helper "5.3"
}
