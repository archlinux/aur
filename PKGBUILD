# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-taglib' 'lua51-taglib' 'lua52-taglib' 'lua53-taglib' 'lua54-taglib')
pkgbase='lua-taglib'
pkgdesc="Lua bindings for taglib"
pkgver=1.2.2
pkgrel=2
arch=('x86_64' 'i686' 'aarch64')
url='https://buffering.party/software/lua-taglib/'
license=('MIT')
depends=('taglib' 'gcc-libs' 'glibc')
_lua_cur=5.5
_lua_next=5.6
makedepends=('cmake' "lua>=$_lua_cur" "lua<$_lua_next" 'lua51' 'lua52' 'lua53' 'lua54')
#options=(debug)
source=("https://buffering.party/software/lua-taglib/lua-taglib-$pkgver.tar.gz")

_build() {
  LUA_V=$1
  V=${LUA_V//./}

  local cmake_options=(
    -S "${pkgbase}-${pkgver}"
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )

  cmake "${cmake_options[@]}" -B build-lua$V-${pkgver}-${pkgrel} -DLUA_VERSION=$LUA_V
  cmake --build build-lua$V-${pkgver}-${pkgrel}
}


build() {
    for v in 5.1 5.2 5.3 5.4 5.5 ; do
        _build $v
    done
}

_package() {
  LUA_V=$1
  V=${LUA_V//./}

  DESTDIR="$pkgdir" cmake --install build-lua$V-${pkgver}-${pkgrel}
  install -Dm644 "${pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-taglib() {
    pkgdesc="Lua bindings for taglib"
    depends+=("lua>=${_lua_cur}" "lua<${_lua_next}")

    _package $_lua_cur
}

package_lua54-taglib() {
    pkgdesc="Lua bindings for taglib - Lua 5.4"
    depends+=('lua54')

    _package 5.4
}

package_lua53-taglib() {
    pkgdesc="Lua bindings for taglib - Lua 5.3"
    depends+=('lua53')

    _package 5.3
}

package_lua52-taglib() {
    pkgdesc="Lua bindings for taglib - Lua 5.2"
    depends+=('lua52')

    _package 5.2
}

package_lua51-taglib() {
    pkgdesc="Lua bindings for taglib - Lua 5.1"
    depends+=('lua51')

    _package 5.1
}

sha512sums=(
'154d6106bc7f7b1b536fe2ebc488b011ecbe4de3da5682941a854a49efee99cf825fb27c5493774bb6ff93839075272b03a39c8fc30021120444d67abe5f0e94'
)
