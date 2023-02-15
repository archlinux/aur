# Maintainer: kraftwerk28 <kefirchik3@gmail.com>

_pkgname=lua-i3ipc
pkgname="${_pkgname}-git"
pkgver=r43.49455db
pkgrel=1
pkgdesc="A lua library for controlling i3wm & Sway"
arch=('any')
url="https://github.com/kraftwerk28/${_pkgname}.git"
license=('MIT')
depends=('luajit' 'lua51-luv' 'lua51-cjson')
makedepends=('git')
source=(
	"${_pkgname}::git+https://github.com/kraftwerk28/${_pkgname}.git"
	"git+https://github.com/openresty/lua-cjson.git"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "lua-cjson"
	export LUA_INCLUDE_DIR=/usr/include/lua5.1
	export LUA_CMODULE_DIR=/usr/lib/lua/5.1
	export LUA_MODULE_DIR=/usr/share/lua/5.1
	export LUA_BIN_DIR=/usr/bin/
	make
}

package() {
	local lua_version=5.1
	local module_name=i3ipc
	local module_dir="/usr/share/lua/$lua_version"
	local cmodule_dir="/usr/lib/lua/$lua_version"

	mkdir -p "$pkgdir/$module_dir/$module_name"
	mkdir -p "$pkgdir/$cmodule_dir/$module_name"

	cd "$srcdir/$_pkgname"
	cp -R "$module_name" "$pkgdir/$module_dir/$module_name"

	cd "$srcdir/lua-cjson"
	cp "cjson.so" "$pkgdir/$cmodule_dir/$module_name/cjson.so"
}
