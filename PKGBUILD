# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-readline' 'lua51-readline' 'lua52-readline' 'lua53-readline' 'lua54-readline')
_pkgname=readline
pkgbase=lua-readline
pkgdesc="Lua bindings to readline"
pkgver=3.3
pkgrel=3
arch=('x86_64' 'i686' 'aarch64')
url='https://peterbillam.gitlab.io/pjb_lua/lua/readline.html'
license=('MIT')
depends=('readline')
_lua_current=5.5
_lua_next=5.6
makedepends=("lua<${_lua_next}" "lua>=${_lua_current}" 'lua51' 'lua52' 'lua53' 'lua54')
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

    for LUAVER in 5.1 5.2 5.3 5.4 5.5; do
        cc $CFLAGS -fPIC -shared $(pkg-config --cflags "lua${LUAVER}") -o C-readline.so C-readline.c -lreadline -lhistory
        install -Dm0644 -t "lua$LUAVER/" "C-readline.so"
    done
}

_package() {
    install -Dm755 "${_archive}/lua${1}/C-readline.so" "$pkgdir/usr/lib/lua/$1/C-readline.so"
    install -Dm644 "${_archive}/readline.lua" "$pkgdir/usr/share/lua/$1/readline.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-readline() {
    depends+=("${pkgname%-*}<${_lua_next}" "${pkgname%-*}>=${_lua_current}")
    optdepends=("${pkgname%-*}-posix: fallback methods for finding HOME")
    pkgdesc+=" for Lua 5.5"

    _package ${_lua_current}
}

package_lua54-readline() {
    depends+=("${pkgname%-*}")
    optdepends=("${pkgname%-*}-posix: fallback methods for finding HOME")
    pkgdesc+=" for Lua 5.4"

    _package 5.4
}

package_lua53-readline() {
    depends+=("${pkgname%-*}")
    optdepends=("${pkgname%-*}-posix: fallback methods for finding HOME")
    pkgdesc+=" for Lua 5.3"

    _package 5.3
}

package_lua52-readline() {
    depends+=("${pkgname%-*}")
    optdepends=("${pkgname%-*}-posix: fallback methods for finding HOME")
    pkgdesc+=" for Lua 5.2"

    _package 5.2
}


package_lua51-readline() {
    depends+=("${pkgname%-*}")
    optdepends=("${pkgname%-*}-posix: fallback methods for finding HOME")
    pkgdesc+=" for Lua 5.1"

    _package 5.1
}

sha512sums=(
'a64fb71302c18a8733ac3548da53616532834e07d557bdcd6926d9793ba615b074b74890b18626ac7f5fd75a90f4ad4155e0788daffd9f8f1bb3e5d3931347ce'
'1221a5911e17cf428829068d20e42274f84b265cbc35d181c858c571543f917f5f375b5290e0f97e46285185593eda2238caf7bab638625f173fb6c1f6092e3d'
)
