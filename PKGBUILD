# Maintainer: Kr1ss <kr1ss.x@yandex.com>

pkgname=unix-privesc-check2
_pkgname=unix-privesc-check
pkgver=2.0
_pkgver=r2_0
pkgrel=1
pkgdesc='Rewrite of the script for local vulnerability detection on UNIX(-like) systems'
arch=('any')
url='https://github.com/pentestmonkey/unix-privesc-check'
license=('GPL' 'custom')
provides=("$pkgname")
install=${pkgname}.install
changelog='CHANGELOG'
source=("https://github.com/pentestmonkey/unix-privesc-check/archive/${_pkgver}.tar.gz")
sha256sums=('a34c6042119b1e8bfb9543d864f47b8b6ec56ece209811e2506b7c8bc63b3888')

prepare() {
	cd "$_pkgname-$_pkgver"
	sed -i 's|files_cache.tmp|${XDG_CACHE_HOME:-$HOME/.cache}/upc2-files_cache.tmp|' upc.sh
}

package() {
	cd "$_pkgname-$_pkgver"
	install -Dm644 docs/CHANGELOG "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
	install -Dm644 docs/COPYING.UNIX-PRIVESC-CHECK "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -dm755 "$pkgdir"/usr/{bin,share/"$pkgname"/lib/{checks,misc}}
	cp -R lib "$pkgdir/usr/share/$pkgname/"
	install -m755 upc.sh "$pkgdir/usr/share/$pkgname/"
	cat >"$pkgdir/usr/bin/upc" <<-EOF
		#!/bin/sh
		cd "/usr/share/$pkgname"
		./upc.sh
	EOF
	chmod 755 "$pkgdir/usr/bin/upc"
}
