# Maintainer: Cameron Banta <cbanta@gmail.com>
# Contributor: Francesco Colista <fcolista@alpinelinux.org>
# Contributor: Lennart Eichhorn <lennart@madmanfred.com>

pkgname=( lua-stringy lua51-stringy lua52-stringy lua53-stringy )
pkgver=0.5.1
_pkgver=0.5-1
pkgrel=1
pkgdesc="Lua string utility library"
license=('MIT')
arch=("i686" "x86_64")
url="https://github.com/brentp/lua-projects/"
makedepends=('lua' 'lua51' 'lua52' 'lua53')
source=("lua-stringy-$_pkgver.tar.gz::https://github.com/brentp/$pkgname/archive/v${_pkgver}.tar.gz")
md5sums=('6b66ca5f644775673a0035ef89322288')

build() {
	mkdir -p 5.1 5.2 5.3 5.4

	local i
	cd lua-stringy-$_pkgver/stringy
	for i in $source; do
		case $i in
		*.patch) msg $i; patch -p1 -i "$srcdir"/$i || return 1;;
		esac
	done

	${CC:-gcc} ${CFLAGS} -fPIC -shared ${LDFLAGS} -I/usr/include/lua5.1 -llua5.1 -o "$srcdir/5.1/stringy.so" stringy.c || return 1
	${CC:-gcc} ${CFLAGS} -fPIC -shared ${LDFLAGS} -I/usr/include/lua5.2 -llua5.2 -o "$srcdir/5.2/stringy.so" stringy.c || return 1
	${CC:-gcc} ${CFLAGS} -fPIC -shared ${LDFLAGS} -I/usr/include/lua5.3 -llua5.3 -o "$srcdir/5.3/stringy.so" stringy.c || return 1
	${CC:-gcc} ${CFLAGS} -fPIC -shared ${LDFLAGS} -I/usr/include/lua5.4 -llua5.4 -o "$srcdir/5.4/stringy.so" stringy.c || return 1
}

check() {
	cd "$srcdir/5.1" ; lua5.1 "$srcdir/lua-stringy-$_pkgver/stringy/stringy_test.lua"
	cd "$srcdir/5.2" ; lua5.2 "$srcdir/lua-stringy-$_pkgver/stringy/stringy_test.lua"
	cd "$srcdir/5.3" ; lua5.3 "$srcdir/lua-stringy-$_pkgver/stringy/stringy_test.lua"
	cd "$srcdir/5.4" ; lua5.4 "$srcdir/lua-stringy-$_pkgver/stringy/stringy_test.lua"
}

package_lua51-stringy() {
  pkgdesc='Lua string utility library for Lua 5.1'
  depends+=('lua51')

  local _lualibdir=/usr/lib/lua/5.1
  mkdir -p "$pkgdir/$_lualibdir"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp $srcdir/5.1/stringy.so "$pkgdir/$_lualibdir/"
  cp "$srcdir/lua-stringy-$_pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

package_lua52-stringy() {
  pkgdesc='Lua string utility library for Lua 5.2'
  depends+=('lua52')

  local _lualibdir=/usr/lib/lua/5.2
  mkdir -p "$pkgdir/$_lualibdir"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp $srcdir/5.2/stringy.so "$pkgdir/$_lualibdir/"
  cp "$srcdir/lua-stringy-$_pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

package_lua53-stringy() {
  pkgdesc='Lua string utility library for Lua 5.3'
  depends+=('lua53')

  local _lualibdir=/usr/lib/lua/5.3
  mkdir -p "$pkgdir/$_lualibdir"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp $srcdir/5.3/stringy.so "$pkgdir/$_lualibdir/"
  cp "$srcdir/lua-stringy-$_pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

package_lua-stringy() {
  pkgdesc='Lua string utility library for Lua 5.4'
  depends+=('lua')

  local _lualibdir=/usr/lib/lua/5.4
  mkdir -p "$pkgdir/$_lualibdir"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp $srcdir/5.4/stringy.so "$pkgdir/$_lualibdir/"
  cp "$srcdir/lua-stringy-$_pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
