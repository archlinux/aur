# Maintainer: jprjr <john@jrjrtech.com>

pkgname=(lua-readline lua51-readline lua52-readline lua53-readline)
_pkgname=readline
pkgbase=lua-readline
pkgdesc="Lua bindings to readline"
pkgver=3.1
pkgrel=2
arch=('x86_64' 'i686')
url='https://pjb.com.au/comp/lua/readline.html'
license=('MIT')
depends=('readline')
makedepends=('lua<5.5' 'lua51' 'lua52' 'lua53')
_archive="${_pkgname}-${pkgver}"
source=("https://pjb.com.au/comp/lua/${_archive}.tar.gz")


prepare() {
    head -n8 "${_archive}/readline.lua" > LICENSE
}

build() {
    cd "$_archive"

    for LUAVER in 5.1 5.2 5.3 5.4; do
        cc $CFLAGS -fPIC -shared $(pkg-config --cflags "lua${LUAVER}") -o C-readline.so C-readline.c -lreadline -lhistory
        install -Dm0644 -t "lua$LUAVER/" "C-readline.so"
    done
}

_package() {
    depends+=("${pkgname%-*}" "${pkgname%-*}-posix")
    pkgdesc+=" for Lua $1"

    install -Dm755 "${_archive}/lua${1}/C-readline.so" "$pkgdir/usr/lib/lua/$1/C-readline.so"
    install -Dm644 "${_archive}/readline.lua" "$pkgdir/usr/share/lua/$1/readline.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-readline() {
    _package 5.4
}

package_lua53-readline() {
    _package 5.3
}

package_lua52-readline() {
    _package 5.2
}


package_lua51-readline() {
    _package 5.1
}


sha256sums=('826736fbc0a631480aa464f4fb7bf9298ef25f17e45c1f3925ab26c9bd960244')
