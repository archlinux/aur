# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=warna
pkgname=(lua{,51,52,53}-"$_pkgname")
pkgver=0.3.5
pkgrel=1
pkgdesc="Terminal text styling library for Lua"
arch=(any)
url=https://github.com/0komo/warna
license=(MIT)
makedepends=(luarocks)
_revision=2
source=("https://luarocks.org/manifests/urnightmaree/$_pkgname-$pkgver-$_revision.src.rock")
sha256sums=('c350fdc77e545c0e659d89de8b0f221da72f16a3748596d38ebf1925c6c0c9b9')
_lua_version=5.4

_package() {
	install -Dm644 ./*.rock -t $1
	luarocks install --no-manifest --lua-version=$1 --tree="$pkgdir/usr/" --deps-mode=none $1/*.rock
	rm "${pkgdir:?}/usr/bin/"*
	local v
	if [[ "$1" != "$_lua_version" ]]; then
		v=$1
	fi
	install -D \
		"${pkgdir:?}/usr/lib/luarocks/rocks-$1/$_pkgname/$pkgver-$_revision/bin/$_pkgname.lua" \
		"${pkgdir:?}/usr/bin/$_pkgname$v.lua"
	sed -i -e"1s_\$_${v}_" "${pkgdir:?}/usr/bin/$_pkgname$v.lua"
	rm -r "${pkgdir:?}/usr/lib/luarocks/rocks-$1/$_pkgname/$pkgver-$_revision/bin/"
}

package_lua51-warna() {
	local version=5.1
	_package $version
}

package_lua52-warna() {
	local version=5.2
	_package $version
}

package_lua53-warna() {
	local version=5.3
	_package $version
}

package_lua-warna() {
	local version=$_lua_version
	_package $version
}
