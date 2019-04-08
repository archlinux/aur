# Maintainer: Cameron Banta <cbanta@gmail.com>
# Contributor: Francesco Colista <fcolista@alpinelinux.org>
pkgname=lua-stringy
pkgver=0.5.1
_pkgver=0.5-1
pkgrel=0
pkgdesc="Lua string utility library"
license=('MIT')
arch=("i686" "x86_64")
url="https://github.com/brentp/lua-projects/"
depends=('lua')
source=("https://github.com/brentp/$pkgname/archive/v${_pkgver}.tar.gz")
build() {
	local i
	cd $pkgname-$_pkgver/stringy
	for i in $source; do
		case $i in
		*.patch) msg $i; patch -p1 -i "$srcdir"/$i || return 1;;
		esac
	done
	${CC:-gcc} ${CFLAGS}  -fPIC -shared ${LDFLAGS} -llua -o stringy.so stringy.c || return 1
	lua stringy_test.lua
}

package() {
	local _lualibdir=/usr/lib/lua/5.2
	cd $pkgname-$_pkgver/stringy
	mkdir -p "$pkgdir"/$_lualibdir
	cp stringy.so "$pkgdir"/$_lualibdir/
}
md5sums=('6b66ca5f644775673a0035ef89322288')
