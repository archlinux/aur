# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-miniflac' 'lua51-miniflac' 'lua52-miniflac' 'lua53-miniflac' 'lua54-miniflac')
_pkgbase='luaminiflac'
pkgdesc="Lua library for decoding FLAC files"
pkgver=1.1.1
pkgrel=3
arch=('x86_64' 'i686' 'aarch64')
url='https://buffering.party/software/luaminiflac/'
license=('MIT')
_lua_cur=5.5
_lua_next=5.6
makedepends=('cmake' "lua>=${_lua_cur}" "lua<${_lua_next}" 'lua51' 'lua52' 'lua53' 'lua54')
source=("${url}luaminiflac-${pkgver}.tar.gz")

_build() {
    LUA_V=$1
    V=${LUA_V//./}

    cmake -B build-lua$V-${pkgver}-${pkgrel} -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DLUA_VERSION=$LUA_V -DCMAKE_BUILD_TYPE=None -DCMAKE_SKIP_INSTALL_RPATH=YES -DCMAKE_INSTALL_PREFIX=/usr -S "${_pkgbase}-${pkgver}"
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

package_lua-miniflac() {
    depends+=("lua>=${_lua_cur}" "lua<${_lua_next}")

    _package $_lua_cur

}

package_lua54-miniflac() {
    pkgdesc+=" - for Lua 5.4"
    depends+=('lua54')

    _package 5.4
}

package_lua53-miniflac() {
    pkgdesc+=" - for Lua 5.3"
    depends+=('lua53')

    _package 5.3
}

package_lua52-miniflac() {
    pkgdesc+=" - for Lua 5.2"
    depends+=('lua52')

    _package 5.2
}

package_lua51-miniflac() {
    pkgdesc+=" - for Lua 5.1"
    depends+=('lua51')

    _package 5.2
}

sha512sums=(
'37dbef1aa45b41e81b5a01ec415c6e2238ad4abf8c1e1137eac679df697cbf0cb978d8b403aec35665c726f69fa0c818f416416e5014fa5c6aa0d7b0ee3878af'
)
