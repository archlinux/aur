# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=sile
pkgdesc='Modern typesetting system inspired by TeX'
pkgver=0.10.0
pkgrel=1
arch=('i386' 'x86_64')
url='http://www.sile-typesetter.org/'
license=('MIT')
source=("https://github.com/simoncozens/sile/releases/download/v$pkgver/sile-$pkgver.tar.bz2")
_lua_deps=('bit32' 'luaepnf' 'lpeg' 'cassowary' 'linenoise' 'zlib' 'cliargs'
           'luaepnf' 'filesystem' 'repl' 'sec' 'socket' 'penlight' 'stdlib'
           'vstruct')
depends=('fontconfig'
         'harfbuzz>=1.4.2'
         "${_lua_deps[@]/#/lua-}"
         'icu'
         'ttf-gentium-plus')
optdepends=('luajit')
makedepends=('luarocks')
checkdepends=('lua-busted'
              'lua-luacov=0.8')
sha256sums=('f200ef6be390303c6451c1b08c4e0ffd4eb9a3966464706c48a320c4665c30bc')

prepare () {
	cd "$pkgname-$pkgver"
	sed -i -e 's/rm -f core/rm -f/' configure
}

build () {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --with-system-luarocks
	make all
    make docs
}

check () {
	cd "$pkgname-$pkgver"
    make busted
}

package () {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir/"

	for file in README.md documentation/sile.pdf ; do
		install -Dm644 "$file" "$pkgdir/usr/share/doc/$pkgname/$(basename $file)"
	done
	cp -ar examples "$pkgdir/usr/share/doc/$pkgname"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
