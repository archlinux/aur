pkgname=digestif
pkgver=0.3
pkgrel=1
arch=(any)
url="https://github.com/astoff/$pkgname"
pkgdesc='A code analyzer and Language Server Protocol implementation for [La|Con|Bib]TeX[t] documents.'
depends=(lua lua-lpeg lua-dkjson)
makedepends=(luarocks)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b9897958a847c78ef8e6cf7c3b180679d8edc87c2ae82aa22ef78aa0f2693c7e')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	sed "s/version = \"dev-1\"/version = \"$pkgver-1\"/" "$pkgname-dev-1.rockspec" > "$pkgname-$pkgver-1.rockspec"
	luarocks build --pack-binary-rock --deps-mode=none "$pkgname-$pkgver-1.rockspec"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	luarocks install --tree="$pkgdir/usr/" --deps-mode=none "$pkgname-$pkgver-1.rockspec"
	sed -i "s|'.*?/bin/$pkgname'|'/usr/lib/luarocks/rocks-5.3/digestif/$pkgdir-1/$pkgname'|" "$pkgdir/usr/bin/digestif"
	# remove luarocks-created root manifest
	rm "$pkgdir/usr/lib/luarocks/rocks-5.3/manifest"
}
