#!/usr/bin/env bash
# shellcheck disable=2034,2154,2164
#
# Maintainer: Cezary Drożak <czarek@drozak.net>

_pkgname=bawesome
_git_url='https://git.sr.ht/~cdrozak/bawesome'

pkgname=awesome-$_pkgname
pkgver=0.1.1
pkgrel=1
pkgdesc='Theme and widgets for awesome to make it look like Haiku'

arch=('any')
url='https://sr.ht/~cdrozak/bawesome'
license=('Apache')
depends=('awesome')
makedepends=('ldoc')
source=("v$pkgver.tar.gz::${_git_url}/archive/v$pkgver.tar.gz")
md5sums=('d015f4d10c31d78125c2d4e3943b7243')

build() {
	cd "$_pkgname-v$pkgver"
	make all
}

package() {
	cd "$_pkgname-v$pkgver"

	(
		cd assets
		find . \
			-type f \
			\( -iname '*.svg' -or -iname '*.png' \) \
			-exec install -Dm644 {} "$pkgdir/usr/share/awesome/theme/$_pkgname/{}" \;
	)

	(
		cd src/bawesome
		find . \
			-type f \
			\( -iname '*.lua' ! -iname '*_spec.lua' \) \
			-exec install -Dm644 {} "$pkgdir/usr/share/awesome/lib/$_pkgname/{}" \;
	)

	install -Dm644 \
		README.md \
		-t "$pkgdir/usr/share/doc/$pkgname/"

	(
		cd doc
		find . \
			-type f \
			-exec install -Dm644 {} "$pkgdir/usr/share/doc/$pkgname/{}" \;
	)
}
