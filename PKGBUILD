# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-luasodium' 'lua51-luasodium' 'lua52-luasodium' 'lua53-luasodium' 'lua54-luasodium')
_pkgbase='luasodium'
pkgver=2.4.1
pkgrel=3
arch=('x86_64' 'i686' 'aarch64')
url='https://buffering.party/software/luasodium/'
license=('MIT')
depends=('libsodium')
_lua_current=5.5
_lua_next=5.6
makedepends=('cmake' "lua>=${_lua_current}" "lua<${_lua_next}" 'lua51' 'lua52' 'lua53' 'lua54')
source=("${url}luasodium-${pkgver}.tar.gz")


_build() {
    LUA_VERSION="$1"
    echo "$LUA_VERSION"
    cmake -B build-lua${LUA_VERSION//./}-${pkgver}-${pkgrel} -DLUA_VERSION=$LUA_VERSION -DCMAKE_BUILD_TYPE=None -DCMAKE_SKIP_INSTALL_RPATH=YES -DCMAKE_INSTALL_PREFIX=/usr -S "${_pkgbase}-${pkgver}"
    make -C build-lua${LUA_VERSION//./}-${pkgver}-${pkgrel}
}

build() {
    for v in 5.1 5.2 5.3 5.4 5.5 ; do
        _build "$v"
    done
}

_package() {
    LUA_VERSION="$1"

    make -C build-lua${LUA_VERSION//./}-${pkgver}-${pkgrel} DESTDIR="$pkgdir" install
    install -Dm644 "${_pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-luasodium() {
    pkgdesc="Lua bindings for libsodium"
    depends+=('lua')
    _package $_lua_current
}

package_lua51-luasodium() {
    pkgdesc="Lua bindings for libsodium for Lua 5.1"
    depends+=('lua51')

    _package 5.1
}

package_lua52-luasodium() {
    pkgdesc="Lua bindings for libsodium for Lua 5.2"
    depends+=('lua52')

    _package 5.2
}

package_lua53-luasodium() {
    pkgdesc="Lua bindings for libsodium for Lua 5.3"
    depends+=('lua53')

    _package 5.3
}

package_lua54-luasodium() {
    pkgdesc="Lua bindings for libsodium for Lua 5.4"
    depends+=('lua54')

    _package 5.4
}

sha512sums=(
'1f3bcb1d9d91300ba3cd45915edc565667770662a5c4fd6b064b42458ae52551bf8c28fa3c9df4834058d734d765482116323ec028c91e48746dd529bc168892'
)
