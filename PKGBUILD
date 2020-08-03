# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>

_pkgname=sile
pkgname=$_pkgname-luajit-git
pkgdesc='Modern typesetting system inspired by TeX'
pkgver=0.10.9.r100.g5f6d689
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
         'luajit'
         "${_lua_deps[@]/#/lua51-}"
         'zlib')
# Note find via find-deps; needs rebuilding any time versions of these change;
# currently missing several because parent packages are missing the provides=()
depends+=('libfreetype.so'
          'libharfbuzz.so'
          'libicudata.so'
          'libicui18n.so'
          'libicuio.so'
          'libicuuc.so')
makedepends=('git')
checkdepends=('poppler')
provides=('libtexpdf.so'
          "$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://github.com/sile-typesetter/$_pkgname.git"
        "git://github.com/sile-typesetter/libtexpdf.git")
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 --match="v*" HEAD |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare () {
    cd "$_pkgname"
    git submodule init
    git config submodule.libtexpdf.url "$srcdir/libtexpdf"
    git submodule update
    ./bootstrap.sh
}

build () {
    cd "$_pkgname"
    ./configure \
        --prefix /usr \
        --docdir /usr/share/doc/$pkgname \
        --with-luajit \
        --with-system-luarocks
    make all
}

check () {
    cd "$_pkgname"
    make check
}

package () {
    cd "$_pkgname"
    make install DESTDIR="$pkgdir"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
