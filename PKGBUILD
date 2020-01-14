# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=sile
pkgdesc='Modern typesetting system inspired by TeX'
pkgver=0.10.0
pkgrel=2
arch=('x86_64')
url='https://www.sile-typesetter.org/'
license=('MIT')
source=("https://github.com/simoncozens/sile/releases/download/v$pkgver/sile-$pkgver.tar.bz2")
_lua_deps=('bit32' 'luaepnf' 'lpeg' 'cassowary' 'linenoise' 'zlib' 'cliargs'
           'luaepnf' 'filesystem' 'repl' 'sec' 'socket' 'penlight' 'stdlib'
           'vstruct')
depends=('fontconfig'
         'harfbuzz'
         "${_lua_deps[@]/#/lua-}"
         'lua'
         'icu'
         'ttf-gentium-plus')
checkdepends=('lua-busted'
              'lua-luacov=0.8')
sha256sums=('b0353b88793d68bf3e800f87bff51e8161ce39d250e22dff11385712caf332b6')

prepare () {
	cd "$pkgname-$pkgver"
	sed -i -e 's/rm -f core/rm -f/' configure
}

build () {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --with-system-luarocks
	make all
}

check () {
	cd "$pkgname-$pkgver"
    # make busted
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
