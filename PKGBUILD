# Maintainer: osch <oliver@luced.de>

pkgname=lua-llthreads2
pkgver=0.1.5
pkgrel=2
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

build() {
	_luaver=$($_luacmd -e 'io.write(_VERSION:gsub("^.* (.*)$","%1"),"")')
	cd "$srcdir/$pkgname-$pkgver"
	sed -e "s/lua >= 5.1, < 5\.4/lua >= 5.1, <= 5.4/g" -i "rockspecs/$pkgname-$pkgver-1.rockspec"
	luarocks --lua-version $_luaver make "rockspecs/$pkgname-$pkgver-1.rockspec"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -d                   "$pkgdir`pkg-config --variable=INSTALL_CMOD $_luapkg`"
	install -Dm755 llthreads2.so "$pkgdir`pkg-config --variable=INSTALL_CMOD $_luapkg`/llthreads2.so"

	cd ./src/lua/llthreads2
	
	install -d            "$pkgdir`pkg-config --variable=INSTALL_LMOD $_luapkg`"/llthreads2
	install -Dm644 ex.lua "$pkgdir`pkg-config --variable=INSTALL_LMOD $_luapkg`"/llthreads2/ex.lua

}
