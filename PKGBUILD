# Maintainer: Michael Tews <michael at tews dot dev>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint
pkgver=17.14.0
pkgrel=1
pkgdesc='Mighty, modern CSS linter'
arch=(any)
url=https://stylelint.io
license=(MIT)
depends=(nodejs)
makedepends=(
	git
	npm
	rsync
)
optdepends=('stylelint-config-standard: for the standard shareable config')
options=(!emptydirs)
source=("git+https://github.com/stylelint/stylelint.git#tag=$pkgver")
b2sums=('b0a5efde0bbb646c6b456dd178058dab8bfa2353ae6a2dfd6e0c5c2d8f34b743c1f8eda990e844e616eb947c709fbf44d56fb776e61e68b4af879b01479608c2')

prepare() {
	cd $pkgname
	npm ci --cache "$srcdir/npm-cache"
}

check() {
	cd $pkgname
	npm test --ignore-scripts
}

package() {
	local mod_dir="/usr/lib/node_modules/$pkgname"

	install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/doc/$pkgname" "$pkgdir$mod_dir"
	ln -s "$mod_dir/bin/$pkgname.mjs" "$pkgdir/usr/bin/$pkgname"

	cd "$pkgname"
	npm prune --omit=dev --cache "$srcdir/npm-cache"

	rsync -r --exclude=__tests__ --exclude=lib/testUtils lib "$pkgdir$mod_dir"
	cp -r bin node_modules package.json "$pkgdir$mod_dir"

	# Remove unused bundled files flagged by namcap
	rm -rf "$pkgdir$mod_dir/node_modules/cssesc/man"
	rm -rf "$pkgdir$mod_dir/node_modules/flatted/python"

	cp -r {CHANGELOG,CONTRIBUTING,README}.md docs "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
