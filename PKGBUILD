# Maintainer: osch <oliver@luced.de>

pkgname=lua-llthreads2
pkgver=0.1.5
pkgrel=3
pkgdesc="This is full dropin replacement for llthreads library"
arch=("i686" "x86_64")
url="http://github.com/moteus/lua-llthreads2/"
license=("MIT")
_luacmd="lua"
_luapkg="lua"
depends=($_luapkg)
makedepends=("luarocks")
source=("$pkgname-$pkgver.tar.gz::https://github.com/moteus/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('7399462ea97a22243f4d25d293d4b8b3')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	sed -e "s/lua >= 5.1, < 5\.4/lua >= 5.1, <= 5.4/g" -i "rockspecs/$pkgname-$pkgver-1.rockspec"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	_luaver=$($_luacmd -e 'io.write(_VERSION:gsub("^.* (.*)$","%1"),"")')

	luarocks --lua-version $_luaver --tree="$pkgdir/usr"  make "rockspecs/$pkgname-$pkgver-1.rockspec"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	mkdir -p "$pkgdir/usr/share/doc"
	mv "$pkgdir/usr/lib/luarocks/rocks-"*"/$pkgname/$pkgver-1/doc" "$pkgdir/usr/share/doc/$pkgname"
	chmod -R 0644 "$pkgdir/usr/share/doc/$pkgname"/*
	
	rm -rf "$pkgdir/usr/lib/luarocks"
}
