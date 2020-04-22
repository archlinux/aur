# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>

pkgname=sile
pkgdesc='Modern typesetting system inspired by TeX'
pkgver=0.10.4
pkgrel=2
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
         'freetype2'
         'harfbuzz'
         'gentium-plus-font'
         'icu'
         'libpng' # this goes with libtexpdf if ever split out to a library package
         'lua'
         "${_lua_deps[@]/#/lua-}")
checkdepends=('lua-busted')
provides=('libtexpdf.so')
source=("https://github.com/sile-typesetter/sile/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('d136fbe9bc86c3e235d34db170d48af14779c36e8b0b03f542ffdbabcdde4222')

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
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md documentation/sile.pdf
	cp -ar examples "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
