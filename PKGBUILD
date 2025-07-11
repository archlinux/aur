# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu, Zhenyu <wuzhenyu@ustc.edu>
_pkgname=luatex
pkgname=texlua
pkgver=1.17.0
pkgrel=1
pkgdesc="The LuaTeX project's main objective is to provide an open and configurable variant of TeX while at the same time offering downward compatibility"
arch=(i686 x86_64 arm aarch64)
url=https://www.luatex.org/
license=(GPL2)
source=("https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/archive/$pkgver/luatex-$pkgver.zip"
	fix-LUA_ROOT.patch)
sha256sums=('93c927256be8f6cd87f5d8745a1f8210513f52b19cfa269736f67626c43865ff' SKIP)

prepare() {
	cd "$_pkgname-$pkgver" || return 1

	patch -Np1 -i ../fix-LUA_ROOT.patch
}

build() {
	cd "$_pkgname-$pkgver" || return 1

	CFLAGS=-std=gnu99 ./build.sh --nolua53 --luahb --parallel
}

package() {
	cd "$_pkgname-$pkgver" || return 1

	install -D build/texk/web2c/luahbtex "$pkgdir/usr/bin/texlua"
	install -Dm644 source/texk/kpathsea/texmf.cnf -t "$pkgdir/etc/texmf/web2c"
}
# ex: nowrap
