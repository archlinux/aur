# Maintainer: jprjr <john@jrjrtech.com>

pkgname=(lua-readline lua51-readline lua52-readline lua53-readline)
_pkgname=readline
pkgbase=lua-readline
pkgdesc="Lua bindings to readline"
pkgver=3.3
pkgrel=2
arch=('x86_64' 'i686')
url='https://peterbillam.gitlab.io/pjb_lua/lua/readline.html'
license=('MIT')
depends=('readline')
makedepends=('lua<5.5' 'lua51' 'lua52' 'lua53')
_archive="${_pkgname}-${pkgver}"
source=("${_archive}.tar.gz"
'fix-version.patch')


prepare() {
    head -n8 "${_archive}/readline.lua" > LICENSE

    cd "$_archive"
    patch --forward --strip=1 --input="${srcdir}/fix-version.patch"
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


sha256sums=('1a3bd8e2229bbaada9b27d23cc3ac4cdf19418a3fc83dd7f4f176588d7520088'
'0929d18ea10d9523e96eee2ef16cad84e6997898f864bf894e52a6ce9db96967')
