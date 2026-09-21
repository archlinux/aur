# Maintainer: Michael Tews <michael at tews dot dev>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint
pkgver=17.15.0
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
b2sums=('724c5721fdf7c7763d2029f198020e879fb62a1fbafc9a8b152c32a079bb59a86641ca92586317ceec0566069f396dd8e913b9ba73643f9e5a02d5b51faf76c4')

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
