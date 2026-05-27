# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-luawav' 'lua51-luawav' 'lua52-luawav' 'lua53-luawav' 'lua54-luawav')
_pkgbase='luawav'
pkgver=1.3.0
pkgrel=2
arch=('x86_64' 'i686' 'aarch64')
url='https://buffering.party/software/luawav/'
license=('MIT')
_lua_cur=5.5
_lua_next=5.6
makedepends=('cmake' "lua>=${_lua_cur}" "lua<${_lua_next}" 'lua51' 'lua52' 'lua53' 'lua54')
source=("${url}luawav-1.3.0.tar.gz")

_build() {
    LUA_V=$1
    V=${LUA_V//./}
    cmake -B build-lua$V-${pkgver}-${pkgrel} -DLUA_VERSION=$LUA_V -DCMAKE_BUILD_TYPE=None -DCMAKE_SKIP_INSTALL_RPATH=YES -DCMAKE_INSTALL_PREFIX=/usr -S "${_pkgbase}-${pkgver}"
    make -C build-lua$V-${pkgver}-${pkgrel}
}

build() {
    for v in 5.1 5.2 5.3 5.4 5.5 ; do
        _build $v
    done
}

_package() {
    LUA_V=$1
    V=${LUA_V//./}

    make -C build-lua$V-${pkgver}-${pkgrel} DESTDIR="$pkgdir" install
    install -Dm644 "${_pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-luawav() {
    pkgdesc="Lua library for reading and writing WAV files"
    depends+=("lua>=${_lua_cur}" "lua<${_lua_next}")

    _package $_lua_cur
}

package_lua54-luawav() {
    pkgdesc="Lua library for reading and writing WAV files - Lua 5.4"
    depends+=('lua54')

    _package 5.4
}

package_lua53-luawav() {
    pkgdesc="Lua library for reading and writing WAV files - Lua 5.3"
    depends+=('lua53')

    _package 5.3
}

package_lua52-luawav() {
    pkgdesc="Lua library for reading and writing WAV files - Lua 5.2"
    depends+=('lua52')

    _package 5.2
}

package_lua51-luawav() {
    pkgdesc="Lua library for reading and writing WAV files - Lua 5.1"
    depends+=('lua51')

    _package 5.1
}

sha512sums=(
'53553afdbde1f424da570380c58f5f20cb86d45a69f1a2ad6df70bb61bafdd8f0d8ce0678b3a997780f50af62b0d6b4001cdb6e6b422dd90ecbae32444a8ca07'
)
