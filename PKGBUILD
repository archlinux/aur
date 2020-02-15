# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=sile
pkgdesc='Modern typesetting system inspired by TeX'
pkgver=0.10.3
pkgrel=3
arch=('x86_64')
url='https://www.sile-typesetter.org'
license=('MIT')
_lua_deps=('cassowary'
           'cosmo'
           'cliargs'
           'expat'
           'filesystem'
           'linenoise'
           'lpeg'
           'luaepnf'
           'penlight'
           'repl'
           'sec'
           'socket'
           'stdlib'
           'vstruct'
           'zlib')
depends=('fontconfig'
         'harfbuzz'
         'gentium-plus-font'
         'icu'
         'lua'
         "${_lua_deps[@]/#/lua-}")
checkdepends=('lua-busted')
source=("https://github.com/sile-typesetter/sile/releases/download/v$pkgver/sile-$pkgver.tar.bz2")
sha256sums=('d89d5ce7d2bf46fb062e5299ffd8b5d821dc3cb3462a0e7c1109edeee111d856')

build () {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --with-system-luarocks
	make all
}

check () {
	cd "$pkgname-$pkgver"
	make busted
}

package () {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md documentation/sile.pdf
	cp -ar examples "$pkgdir/usr/share/doc/$pkgname"
}
