_pkgname=luagcrypt
pkgname=(lua-$_pkgname-git lua51-$_pkgname-git lua52-$_pkgname-git lua53-$_pkgname-git)
pkgver=r46.5763e94
pkgrel=2
pkgdesc='A Lua interface to the libgcrypt library, written in C'
arch=(any)
url='https://github.com/Lekensteyn/luagcrypt'
license=('MIT')
makedepends=('git' 'lua' 'lua51' 'lua52' 'lua53' 'libgcrypt')
depends=('libgcrypt')
source=("$_pkgname::git+https://github.com/Lekensteyn/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  for lua_ver in 5.1 5.2 5.3; do
    cp -a $_pkgname $_pkgname-$pkgver-${lua_ver//./}
    make -C $_pkgname-$pkgver-${lua_ver//./} LUA_DIR=/usr LUA_VER=$lua_ver
  done

  cp -a $_pkgname $_pkgname-$pkgver-54
  make -C $_pkgname-$pkgver-54 LUA_DIR=/usr LUA_INCDIR=/usr/include LUA_LIBDIR=/usr/lib LUA_VER=5.4
}

_package_for_lua_ver() {
  cd $_pkgname-$pkgver-${1//./}
  make DESTDIR="$pkgdir" LUA_DIR=/usr LUA_VER=$1 install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_lua51-luagcrypt-git() {
  _package_for_lua_ver 5.1
}

package_lua52-luagcrypt-git() {
  _package_for_lua_ver 5.2
}

package_lua53-luagcrypt-git() {
  _package_for_lua_ver 5.3
}

package_lua-luagcrypt-git() {
  _package_for_lua_ver 5.4
}
