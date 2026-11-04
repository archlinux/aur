# Maintainer: Michael Tews <michael at tews dot dev>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint
pkgver=18.0.0
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
b2sums=('b02f0ad94ba88b05883d85aa90f433cac5225c8c5bc08fe018dc58da9e6ec596e02815e3204e5a3af7f526718696e68511a4d12abaf6774c099c5f2d414f6d80')

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
