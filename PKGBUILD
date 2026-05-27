# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-luaflac' 'lua51-luaflac' 'lua52-luaflac' 'lua53-luaflac' 'lua54-luaflac')
_pkgbase='luaflac'
pkgver=3.0.0
pkgrel=2
arch=('x86_64' 'i686' 'aarch64')
url='https://buffering.party/software/luaflac/'
license=('MIT')
depends=('flac')
_lua_current=5.5
_lua_next=5.6
makedepends=('cmake' "lua>=${_lua_current}" "lua<=${_lua_next}" 'lua51' 'lua52' 'lua53' 'lua54')
source=("${url}luaflac-${pkgver}.tar.gz")

_build() {
    LUA_VERSION="${1}"
    LUA_V="${LUA_VERSION//./}"

    cmake -B build-lua${LUA_V}-${pkgver}-${pkgrel} -DLUA_VERSION=${LUA_VERSION} -DCMAKE_BUILD_TYPE=None -DCMAKE_SKIP_INSTALL_RPATH=YES -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -S "${_pkgbase}-${pkgver}"
    make -C build-lua${LUA_V}-${pkgver}-${pkgrel}
}

build() {
    for v in 5.1 5.2 5.3 5.4 5.5 ; do
        _build "$v"
    done
}

_package() {
    LUA_VERSION="${1}"
    LUA_V="${LUA_VERSION//./}"

    make -C build-lua${LUA_V}-${pkgver}-${pkgrel} DESTDIR="$pkgdir" install
    install -Dm644 "${_pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-luaflac() {
    pkgdesc="Lua bindings for libFLAC"
    depends+=("lua>=${_lua_current}" "lua<${_lua_next}")

    _package 5.5
}

package_lua51-luaflac() {
    pkgdesc="Lua bindings for libFLAC for Lua 5.1"
    depends+=('lua51')

    _package 5.1
}

package_lua52-luaflac() {
    pkgdesc="Lua bindings for libFLAC for Lua 5.2"
    depends+=('lua52')

    _package 5.2
}

package_lua53-luaflac() {
    pkgdesc="Lua bindings for libFLAC for Lua 5.3"
    depends+=('lua53')

    _package 5.3
}

package_lua54-luaflac() {
    pkgdesc="Lua bindings for libFLAC for Lua 5.4"
    depends+=('lua54')

    _package 5.4
}

sha512sums=(
'1b85ce3cf76c33c733103a5ec9dd0548a395f5d3c87c88392e5a0d4e6986eebacf04a84e80fc1e79acefa2ae4e705798bafb3dfe8fa1198ea4a0b84ad61c9df7'
)
