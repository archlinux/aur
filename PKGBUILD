# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=teal
_rockname=tl
pkgname=(teal "lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.13.2
pkgrel=1
pkgdesc="The compiler for Teal, a typed dialect of Lua"
arch=(any)
url=https://github.com/teal-language/tl
license=(MIT)
_lua_deps=(argparse
           compat53
           filesystem)
makedepends=(lua lua53 lua52 lua51 luarocks)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a42c8dd1719933de027f8954b3edd4b255785d933f6ff183ae32bbf8adc7c6ae')

_package_helper() {
	cd "$_rockname-$pkgver"
	luarocks --lua-version=$1 --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-dev-1.rockspec"
	if [[ -n $2 ]]; then
		find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##" {} \;
		rm -rf "$pkgdir/usr/"{lib,share}
	else
		rm -rf "$pkgdir/usr/bin"
	fi
}

package_teal() {
	depends+=(lua lua-tl)
	provides+=(tl)
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
	depends+=(lua52 "${_lua_deps[@]/#/lua52-}")
	_package_helper 5.2
}

package_lua51-tl() {
	depends+=(lua51 "${_lua_deps[@]/#/lua51-}")
	_package_helper 5.1
}
