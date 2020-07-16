# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>

pkgname=sile
pkgdesc='Modern typesetting system inspired by TeX'
pkgver=0.10.6
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
         "${_lua_deps[@]/#/lua-}"
         'zlib')
# Note find via find-deps; needs rebuilding any time versions of these change;
# currently missing several because parent packages are missing the provides=()
depends+=('libfreetype.so'
          'libharfbuzz.so'
          'libicudata.so'
          'libicui18n.so'
          'libicuio.so'
          'libicuuc.so')
checkdepends=('poppler')
provides=('libtexpdf.so')
source=("https://github.com/sile-typesetter/sile/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('ffe84f498e735727a37601f14aeb1f1be48963796b18b75075cbfa01bac69f7b')

build () {
    cd "$pkgname-$pkgver"
    ./configure \
        --prefix /usr \
        --with-system-luarocks
    make all
}

check () {
    cd "$pkgname-$pkgver"
    make check
}

package () {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
