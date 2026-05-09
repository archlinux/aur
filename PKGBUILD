# Maintainer: Jakob Hellermann <jakob.hellermann@protonmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

_rockname=lsqlite3
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.9.7
_fossilver=v${pkgver//./}
_rockrel=1
pkgrel=1
pkgdesc='A binding for Lua to the SQLite3 database library'
arch=(x86_64 i686)
url='http://lua.sqlite.org'
license=(MIT)
depends=(sqlite)
makedepends=(lua
             lua51
             lua52
             lua53
             luarocks)
source=("archive.zip::http://lua.sqlite.org/home/zip/archive.zip?uuid=v$pkgver")
sha256sums=('981851c3b831439ad8341a48e00a46bfd1413e469e62cfe39452a1bd7e9acae9')

_package_helper() {
	cd archive
	luarocks --lua-version "$1" --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"

	# Upstream ships the MIT license inline in lsqlite3.c; extract it into /usr/share/licenses/.
	awk 'NR==1{next} /^\*+\/$/{exit} {sub(/^\* ?/, ""); sub(/ *\*+$/, ""); print}' lsqlite3.c |
		install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-lsqlite3() {
	depends+=(lua)
	_package_helper 5.4
}

package_lua53-lsqlite3() {
	depends+=(lua53)
	_package_helper 5.3
}

package_lua52-lsqlite3() {
	depends+=(lua52)
	_package_helper 5.2
}

package_lua51-lsqlite3() {
	depends+=(lua51)
	_package_helper 5.1
}
