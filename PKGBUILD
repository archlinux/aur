pkgbase=lua-cjson
pkgname=(lua-cjson lua53-cjson lua52-cjson lua51-cjson)
pkgver=2.1.0.16
pkgrel=1
pkgdesc='A fast JSON parsing and encoding support for Lua.'
arch=('x86_64')
url='https://github.com/openresty/lua-cjson'
license=('MIT')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("https://github.com/openresty/$pkgbase/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4b7e96801ee9596216d52d09cc4d21657cfd575971b6bbe9e317a698ae376a8a')

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

	local LUAPKG=${pkgname%%-*}
	depends+=($LUAPKG)

	luarocks install \
		--lua-version=$1 \
		--deps-mode=none \
		--tree="$pkgdir/usr/" \
		--no-manifest \
		$1/*.rock

	find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##g" {} \;

	for f in "$pkgdir/usr/bin"/*; do
		mv "$f" "$f-$1"
	done
	if [ $LUAPKG = lua ]; then
		for f in json2lua lua2json; do
			ln -s "$f-$1" "$pkgdir/usr/bin/$f"
		done
	fi

	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
package_lua-cjson()   { _package 5.4; }
package_lua53-cjson() { _package 5.3; }
package_lua52-cjson() { _package 5.2; }
package_lua51-cjson() { _package 5.1; }
