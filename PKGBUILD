pkgname=digestif
pkgver=0.6
pkgrel=1
arch=(any)
license=(MIT)
url="https://github.com/astoff/$pkgname"
pkgdesc='A code analyzer and Language Server Protocol implementation for [La|Con|Bib]TeX[t] documents.'
depends=(lua lua-lpeg lua-dkjson)
makedepends=(luarocks lua-luarocks semver)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7d957ddc83c621045c5f24d19244ecc72ce0ecd16518e7e13384d014300e3060')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	sed "s/version = \"dev-1\"/version = \"$pkgver-1\"/" "$pkgname-dev-1.rockspec" > "$pkgname-$pkgver-1.rockspec"
	luarocks build --pack-binary-rock --deps-mode=none "$pkgname-$pkgver-1.rockspec"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	local luaver=$(lua -e 'print(_VERSION)' | cut -d' ' -f2)
	luarocks install --tree="$pkgdir/usr/" --deps-mode=none "$pkgname-$pkgver-1.rockspec"
	cat >"$pkgdir/usr/bin/digestif" <<EOF
#!/bin/bash
lua /usr/lib/luarocks/rocks-$luaver/digestif/$pkgver-1/bin/digestif "\$@"
EOF
	chmod +x "$pkgdir/usr/bin/digestif"
	# remove luarocks-created root manifest
	rm "$pkgdir/usr/lib/luarocks/rocks-$luaver/manifest"
}
