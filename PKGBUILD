#!/usr/bin/env bash
# shellcheck disable=2034,2154,2164
#
# Maintainer: Cezary Drożak <czarek@drozak.net>

_pkgname=bling
pkgname=awesome-$_pkgname-git
pkgver=r238.92dabc8
pkgrel=1
pkgdesc='Utilities for the awesome window manager'

arch=('any')
url='https://blingcorp.github.io/bling'
license=('MIT')
depends=('awesome')
makedepends=('git')
source=('git+https://github.com/BlingCorp/bling.git')
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname"

	install -Dm644 \
		LICENSE AUTHORS.md CODEOWNERS theme-var-template.lua \
		-t "$pkgdir/usr/share/doc/$pkgname/"

	find . \
		-type f \
		\( -iname '*.lua' -or -path './icons/*' ! -iname theme-var-template \) \
		-exec install -Dm644 {} "$pkgdir/usr/share/awesome/lib/$_pkgname/{}" \;

	(
		cd docs
		find . \
			-type f \
			\( ! -iname .nojekyll ! -iname _sidebar.md \) \
			-exec install -Dm644 {} "$pkgdir/usr/share/doc/$pkgname/{}" \;
	)
}
