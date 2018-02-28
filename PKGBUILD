# $Id$
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Dwayne Bent <dbb.1@liqd.org>
# Contributor: Paul-Sebastian Manole <brokenthorn@gmail.com>

pkgbase=luasec-git
pkgname=(lua-sec-git lua51-sec-git lua52-sec-git)
pkgver=0.7alpha.r9.gfbbaa86
pkgrel=1
pkgdesc='Lua bindings for OpenSSL library to provide TLS/SSL communication.'
arch=('i686' 'x86_64')
url='https://github.com/brunoos/luasec/wiki'
license=('MIT')
makedepends=('openssl' 'lua' 'lua-socket' 'lua51' 'lua51-socket' 'lua52' 'lua52-socket')
options=('!buildflags' 'debug')
source=("git+https://github.com/brunoos/luasec")
md5sums=('SKIP')

pkgver() {
  cd luasec
  git describe --long --tags | sed 's/luasec-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cp -a luasec luasec-51
  cp -a luasec luasec-52
}

build() {
  msg2 'Building with lua 5.3'
  cd "$srcdir"/luasec
  make linux DEFS="-DWITH_LUASOCKET -DOPENSSL_NO_SSL3"

  msg2 'Building with lua 5.1'
  cd "$srcdir"/luasec-51
  find . -type f -name \*.[ch] -exec sed -i \
    -e 's|include .lua.h.|include "lua5.1/lua.h"|g' \
    -e 's|include .lualib.h.|include "lua5.1/lualib.h"|g' \
    -e 's|include .luaconf.h.|include "lua5.1/luaconf.h"|g' \
    -e 's|include .lauxlib.h.|include "lua5.1/lauxlib.h"|g' \
    {} \;
  make linux DEFS="-DWITH_LUASOCKET -DOPENSSL_NO_SSL3"

  msg2 'Building with lua 5.2'
  cd "$srcdir"/luasec-52
  find . -type f -name \*.[ch] -exec sed -i \
    -e 's|include .lua.h.|include "lua5.2/lua.h"|g' \
    -e 's|include .lualib.h.|include "lua5.2/lualib.h"|g' \
    -e 's|include .luaconf.h.|include "lua5.2/luaconf.h"|g' \
    -e 's|include .lauxlib.h.|include "lua5.2/lauxlib.h"|g' \
    {} \;
  make linux DEFS="-DWITH_LUASOCKET -DOPENSSL_NO_SSL3"
}

package_lua-sec-git() {
  depends=('openssl' 'lua' 'lua-socket')
  provides=('lua-sec=0.7')
  conflicts=('lua-sec')

  install -dm755 "$pkgdir/usr/lib/lua/5.3"
  cd luasec
  make LUACPATH="$pkgdir/usr/lib/lua/5.3" LUAPATH="$pkgdir/usr/share/lua/5.3" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua51-sec-git() {
  depends=('openssl' 'lua51' 'lua51-socket')
  provides=('lua51-sec=0.7')
  conflicts=('luasec' 'lua51-sec')
  replaces=('luasec')

  install -dm755 "$pkgdir/usr/lib/lua/5.1"
  cd luasec-51
  make LUACPATH="$pkgdir/usr/lib/lua/5.1" LUAPATH="$pkgdir/usr/share/lua/5.1" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-sec-git() {
  depends=('openssl' 'lua52' 'lua52-socket')
  provides=('lua52-sec=0.7')
  conflicts=('lua52-sec')

  install -dm755 "$pkgdir/usr/lib/lua/5.2"
  cd luasec-52
  make LUACPATH="$pkgdir/usr/lib/lua/5.2" LUAPATH="$pkgdir/usr/share/lua/5.2" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
