# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=lcmark
_project=$_rockname
pkgname=("lua-$_rockname-git" "lua53-$_rockname-git" "lua52-$_rockname-git" "lua51-$_rockname-git" "$_rockname-git")
pkgver=0.29.0.5.r0.g320a347
_branch='master'
_rockrel=5
pkgrel=2
pkgdesc='A higher level Lua interface exposing lua-cmark features'
arch=('x86_64' 'i686')
url="https://github.com/jgm/$_project"
license=('BSD')
_lua_deps=('cmark-git' 'lpeg' 'optparse' 'yaml')
makedepends=('git' 'lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("git+$url.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
  cd "$_project"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cp -a "$_project"{,-5.1}
  cp -a "$_project"{,-5.2}
  cp -a "$_project"{,-5.3}
  cp -a "$_project"{,-5.4}
  cp -a "$_project"{,-5.4cli}
}

_package_helper() {
  cd "$_project-$1$2"
  sed -i Makefile \
      -e "s!--local make!--lua-version='$1' --tree='$pkgdir/usr/' make --deps-mode=none --no-manifest!"
  make rock -B
  case $pkgname in
    lua*) rm -rf "$pkgdir/usr/bin" ;;
    *) rm -rf "$pkgdir/usr/"{lib,share} ;;
  esac
}

package_lua-lcmark-git() {
  depends=('lua' "${_lua_deps[@]/#/lua-}")
  provides=("${pkgname/-git}")
  conflicts=("${pkgname/-git}")
  _package_helper 5.4
}

package_lua53-lcmark-git() {
  depends=('lua53' "${_lua_deps[@]/#/lua53-}")
  provides=("${pkgname/-git}")
  conflicts=("${pkgname/-git}")
  _package_helper 5.3
}

package_lua52-lcmark-git() {
  depends=('lua52' "${_lua_deps[@]/#/lua52-}")
  provides=("${pkgname/-git}")
  conflicts=("${pkgname/-git}")
  _package_helper 5.2
}

package_lua51-lcmark-git() {
  depends=('lua51' "${_lua_deps[@]/#/lua51-}")
  provides=("${pkgname/-git}")
  conflicts=("${pkgname/-git}")
  _package_helper 5.1
}

package_lcmark-git() {
  pkgdesc="CLI interface for lua-lcmark"
  depends=('lua' "$pkgbase")
  provides=("${pkgname/-git}")
  conflicts=("${pkgname/-git}")
  _package_helper 5.4 cli
}
