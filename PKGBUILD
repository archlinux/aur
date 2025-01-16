pkgbase=lua-flock
pkgname=(lua-flock lua53-flock lua52-flock lua51-flock)
pkgver="1.0.1_1"
pkgrel=1
pkgdesc='A Lua wrapper for the BSD-ish flock(2) system call.'
arch=('x86_64')
url='https://github.com/SolraBizna/luaflock'
license=('Zlib')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
_pkgbase="${pkgbase/-/}"
_pkgver="${pkgver/_/-}"
source=("https://github.com/SolraBizna/$_pkgbase/archive/refs/tags/v$_pkgver.zip")
sha256sums=('867ad57f1c4d7a2c0302bd9cb1ed7329ce3d010a3e5d424c238e1b73debd02bf')

_build_version() {
	mkdir -p $1
	luarocks make \
		--lua-version=$1 \
		--deps-mode=none \
		--pack-binary-rock \
		*.rockspec
	mv *.rock $1
}

build() {
	cd $_pkgbase-$_pkgver

	_build_version 5.4
	_build_version 5.3
	_build_version 5.2
	_build_version 5.1
}

_package() {
	cd $_pkgbase-$_pkgver

	LUAPKG=${pkgname%%-*}
	depends+=($LUAPKG)

	luarocks install \
		--lua-version=$1 \
		--deps-mode=none \
		--tree="$pkgdir/usr/" \
		--no-manifest \
		$1/*.rock

	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE.md
}

package_lua-flock()   { _package 5.4; }
package_lua53-flock() { _package 5.3; }
package_lua52-flock() { _package 5.2; }
package_lua51-flock() { _package 5.1; }
