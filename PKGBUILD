pkgbase=lua-cjson
pkgname=(lua-cjson lua53-cjson lua52-cjson lua51-cjson)
pkgver=2.1.0.14
pkgrel=3
pkgdesc='A fast JSON parsing and encoding support for Lua.'
arch=('x86_64')
url='https://github.com/openresty/lua-cjson'
license=('MIT')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("https://github.com/openresty/$pkgbase/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('14cac5c7a4520b33449a1fc961344556b8b6a2a2c6b739b0e46e3002e6e605bc')

_build() {
	mkdir -p $1
	luarocks make \
		--lua-version=$1 \
		--deps-mode=none \
		--pack-binary-rock \
		*.rockspec
	mv *.rock $1
}
build() {
	cd $pkgbase-$pkgver

	_build 5.4
	_build 5.3
	_build 5.2
	_build 5.1
}

_package() {
	cd $pkgbase-$pkgver

	LUAPKG=${pkgname%%-*}
	depends+=($LUAPKG)

	luarocks install \
		--lua-version=$1 \
		--deps-mode=none \
		--tree="$pkgdir/usr/" \
		--no-manifest \
		$1/*.rock

	find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##g" {} \;
	[ $LUAPKG != lua ] && for f in "$pkgdir/usr/bin"/*; do
		mv "$f" "$f-$1"
	done

	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
package_lua-cjson()   { _package 5.4; }
package_lua53-cjson() { _package 5.3; }
package_lua52-cjson() { _package 5.2; }
package_lua51-cjson() { _package 5.1; }
