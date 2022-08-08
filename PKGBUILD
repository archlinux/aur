# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=lcmark
_project=$_rockname
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname" "$_rockname")
pkgver=0.30.2
_rockrel=1
pkgrel=1
pkgdesc='A higher level Lua interface exposing lua-cmark features'
arch=('x86_64' 'i686')
url="https://github.com/jgm/$_project"
license=('BSD')
_lua_deps=('cmark' 'lpeg' 'optparse' 'yaml')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$pkgver-$_rockrel.tar.gz::$url/archive/$pkgver-$_rockrel.tar.gz")
sha256sums=('141aedbba8afc46258e2b80223c789326f11f506e297e2e4d70971dd4c15968f')

prepare() {
  cp -a "$_project-$pkgver-$_rockrel"{,-5.1}
  cp -a "$_project-$pkgver-$_rockrel"{,-5.2}
  cp -a "$_project-$pkgver-$_rockrel"{,-5.3}
  cp -a "$_project-$pkgver-$_rockrel"{,-5.4}
  cp -a "$_project-$pkgver-$_rockrel"{,-5.4cli}
}

_package_helper() {
  cd "$_project-$pkgver-$_rockrel-$1$2"
  sed -i Makefile \
      -e "s!--local make!--lua-version='$1' --tree='$pkgdir/usr/' make --deps-mode=none --no-manifest!"
  make rock
  case $pkgname in
    lua*) rm -rf "$pkgdir/usr/bin" ;;
    *) rm -rf "$pkgdir/usr/"{lib,share} ;;
  esac
}

package_lua-lcmark() {
  depends=('lua' "${_lua_deps[@]/#/lua-}")
  _package_helper 5.4
}

package_lua53-lcmark() {
  depends=('lua53' "${_lua_deps[@]/#/lua53-}")
  _package_helper 5.3
}

package_lua52-lcmark() {
  depends=('lua52' "${_lua_deps[@]/#/lua52-}")
  _package_helper 5.2
}

package_lua51-lcmark() {
  depends=('lua51' "${_lua_deps[@]/#/lua51-}")
  _package_helper 5.1
}

package_lcmark() {
  pkgdesc="CLI interface for lua-lcmark"
  depends=('lua' "$pkgbase")
  _package_helper 5.4 cli
}
