# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>

pkgname=sile-git
pkgdesc='Modern typesetting system inspired by TeX'
pkgver=0.10.4.r7.g5ceee91
pkgrel=1
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
makedepends=('git'
             'noto-fonts-cjk'
             'poppler'
             'ttf-gentium-basic'
             'ttf-sil-scheherazade')
checkdepends=('lua-busted')
provides=('libtexpdf.so' "${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("git://github.com/sile-typesetter/${pkgname%-git}.git"
        "git://github.com/sile-typesetter/libtexpdf.git")
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --tags --abbrev=7 --match="v*" HEAD | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare () {
    cd "${pkgname%-git}"
    git submodule init
    git config submodule.libtexpdf.url "$srcdir/libtexpdf"
    git submodule update
    ./bootstrap.sh
}

build () {
    cd "${pkgname%-git}"
    ./configure --prefix=/usr --with-system-luarocks
    make all
    make docs
    make examples
}

check () {
    cd "${pkgname%-git}"
    make busted
}

package () {
	cd "${pkgname%-git}"
	make install DESTDIR="$pkgdir"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md documentation/sile.pdf
	cp -ar examples "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
