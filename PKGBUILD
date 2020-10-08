# Maintainer: Lennart Eichhorn <lennart@madmanfred.com>
# Contributor: zopieux <web+oss at zopieux dot com>

_lua_version=5.3

pkgname=lua53-cjson
pkgver=2.1.0
pkgrel=1
pkgdesc="A fast JSON parsing and encoding support for Lua 5.3"
arch=(i686 x86_64)
url="https://www.kyne.com.au/~mark/software/lua-cjson.php"
license=('custom:MIT')
depends=("lua53")
optdepends=('perl: UTF8 implementation test')
source=(
  "https://www.kyne.com.au/~mark/software/download/lua-cjson-$pkgver.tar.gz"
  "no-tests.patch")
md5sums=('24f270663e9f6ca8ba2a02cef19f7963'
         '39475544badeb963f0bf95acd69dce71')

prepare() {
  cd "$srcdir/lua-cjson-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/no-tests.patch"
}

build() {
  cd "$srcdir/lua-cjson-$pkgver"
  make PREFIX=/usr LUA_INCLUDE_DIR=/usr/include/lua${_lua_version} LUA_VERSION=${_lua_version}
}

package() {
  cd "$srcdir/lua-cjson-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir/" LUA_INCLUDE_DIR=/usr/include/lua${_lua_version} LUA_VERSION=${_lua_version} install{,-extra}

  # license
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # use lua5.3
  sed -i "1s|env lua|&${_lua_version}|" $(grep -rl "env lua" "$pkgdir")

  # do not conflict with lua-cjson
  cd "$pkgdir/usr/bin"
  mv lua2json lua${_lua_version/[.]}2json
  mv json2lua json2lua${_lua_version/[.]}
}
