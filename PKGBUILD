# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=tl
pkgbase=teal
pkgname=(teal "lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.13.2
pkgrel=3
pkgdesc="The compiler for Teal, a typed dialect of Lua"
arch=(any)
url=https://github.com/teal-language/$_rockname
license=(MIT)
_lua_deps=(argparse
           filesystem)
makedepends=(lua
             lua51
             lua52
             lua53
             luarocks)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a42c8dd1719933de027f8954b3edd4b255785d933f6ff183ae32bbf8adc7c6ae')

_package_helper() {
	cd "$_rockname-$pkgver"
	luarocks --lua-version=$1 --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-dev-1.rockspec"
	find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##" {} \;
	[[ -v 2 ]] &&
		rm -rf "$pkgdir/usr/"{lib,share} ||
		rm -rf "$pkgdir/usr/bin"
}

package_teal() {
	depends+=(lua lua-tl)
	optdepends+=('cyan: The Teal build system and project manager')
	provides+=($_rockname)
	_package_helper 5.4 bin
}

package_lua-tl() {
	depends+=(lua "${_lua_deps[@]/#/lua-}")
	_package_helper 5.4
}

package_lua53-tl() {
	depends+=(lua53 "${_lua_deps[@]/#/lua53-}")
	_package_helper 5.3
}

package_lua52-tl() {
	_lua_deps+=(compat53)
	depends+=(lua52 "${_lua_deps[@]/#/lua52-}")
	_package_helper 5.2
}

package_lua51-tl() {
	_lua_deps+=(compat53)
	depends+=(lua51 "${_lua_deps[@]/#/lua51-}")
	_package_helper 5.1
}
