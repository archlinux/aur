# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=iconv
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=7
pkgrel=4
pkgdesc='Lua bindings for the iconv API'
arch=('i686' 'x86_64')
url="https://ittner.github.com/$pkgname"
license=('custom')
# depends=('iconv')
makedepends=('lua' 'lua53' 'lua52' 'lua51')
source=("https://github.com/downloads/ittner/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('c1db1915c754b5cfe7e45af61467bc6dfa4f0037d281ccbce6b53c974e2faf09')
noextract=("${source[@]##*/}")
# NOTE: GPG key expried for 2 years, tried contaacting op via email
# "https://github.com/downloads/ittner/$pkgname/$pkgname-$pkgver.tar.gz.sig"
# validpgpkeys=('9B49FCE2E6B9D1AD610129AD4F6DF1140041A1FB') # Alexandre Erwin Ittner <FIRST_NAME@LAST_NAME.com.br>

prepare() {
    for dir in lua{,53,52,51}-"$_rockname-$pkgver"; do
        mkdir -p "$dir"
        pushd "$dir"
        bsdtar --strip-components 1 -xf "$srcdir/${source[@]##*/}"
        sed -i -e '/^LUA/s/ = / ?= /;/	make test/d' Makefile
        popd
    done
}

check() {
	cd "$pkgname-$pkgver"
    make LUABIN=lua LUAPKG=lua test
}

build() {
    set -x
    for dir in lua{,53,52,51}-"$_rockname-$pkgver"; do
        local lv=${dir/-*}
        pushd "$dir"
        make LUABIN="$lv" LUAPKG="$lv"
        popd
    done
}

_package_helper() {
	cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" LUABIN=lua$1 install
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}

package_lua-iconv() {
  depends+=('lua')
  _package_helper
}

package_lua53-iconv() {
  depends+=('lua53')
  _package_helper 5.3
}

package_lua52-iconv() {
  depends+=('lua52')
  _package_helper 5.2
}

package_lua51-iconv() {
  depends+=('lua51')
  _package_helper 5.1
}

