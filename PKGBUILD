# Maintainer: Michael Tews <michael at tews dot dev>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint
pkgver=17.13.0
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
b2sums=('bc5104d981823fd98b3bae1c8c2b3d1bae8fe26f8beefdc0510b6388623d86bc73de41ab732fba334ac38c7fcea1773b0be7219cb2515eec682858842ee7888b')

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
