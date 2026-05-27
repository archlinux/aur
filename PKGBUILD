# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-etf' 'lua51-etf' 'lua52-etf' 'lua53-etf' 'lua54-etf')
_pkgbase='lua-etf'
pkgver=1.0.2
pkgrel=2
arch=('x86_64' 'i686' 'aarch64')
url='https://buffering.party/software/lua-etf/'
license=('MIT')
depends=()
_lua_current=5.5
_lua_next=5.6
makedepends=('cmake' "lua>=${_lua_current}" "lua<${_lua_next}" 'lua51' 'lua52' 'lua53' 'lua54')
source=(
"${url}lua-etf-${pkgver}.tar.gz"
'update-cmake.patch'
)

prepare() {
    cd "${_pkgbase}-${pkgver}"
    patch -p1 -i ../update-cmake.patch
}

_build() {
    LUA_VERSION="$1"
    LUA_V="lua${LUA_VERSION//./}"

    cmake -B build-${LUA_V}-${pkgver}-${pkgrel} -DLUA_VERSION=$LUA_VERSION -DCMAKE_BUILD_TYPE=None -DCMAKE_SKIP_INSTALL_RPATH=YES -DCMAKE_INSTALL_PREFIX=/usr -S "${_pkgbase}-${pkgver}"
    make -C build-${LUA_V}-${pkgver}-${pkgrel}
}


build() {
    for v in 5.1 5.2 5.3 5.4 5.5 ; do
        _build "$v"
    done
}

_package() {
    LUA_VERSION="$1"
    LUA_V="lua${LUA_VERSION//./}"

    make -C build-${LUA_V}-${pkgver}-${pkgrel} DESTDIR="$pkgdir" install
    install -Dm644 "${_pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-etf() {
    pkgdesc="Erlang External Term Format encoder and decoder for Lua"
    depends+=("lua>=${_lua_current}" "lua<${_lua_next}")

    _package $_lua_current
}

package_lua51-etf() {
    pkgdesc="Erlang External Term Format encoder and decoder for Lua 5.1"
    depends+=('lua51')

    _package 5.1
}

package_lua52-etf() {
    pkgdesc="Erlang External Term Format encoder and decoder for Lua 5.2"
    depends+=('lua52')

    _package 5.2
}

package_lua53-etf() {
    pkgdesc="Erlang External Term Format encoder and decoder for Lua 5.3"
    depends+=('lua53')

    _package 5.3
}

package_lua54-etf() {
    pkgdesc="Erlang External Term Format encoder and decoder for Lua 5.4"
    depends+=('lua54')

    _package 5.4
}

sha512sums=(
'994d977320cc11d73815a245d415b001d3ec4fe2b346f94a8eb302d761f1b2a5cbcf76508155b53a63bd2ecdf750ad4e10e2498cc37122ca9bbb4b4c911bbf9a'
'888d58fee2a9d9e1ab1bf74a831785b2f2795f30c49495cdf2158722e37ecf81264bd64d77e601d09c9d7e47a8f3d91f72ed8d050dd5fa93a854b68db4eaceac'
)
