# Maintainer: Brad Erhart <brae.04+aur@gmail.com>

pkgname=zapier-platform-cli
pkgver=8.2.0
pkgrel=1
pkgdesc="This CLI is your gateway to creating custom applications on the Zapier platform"
arch=('x86_64')
url="https://zapier.github.io/zapier-platform-cli/cli"
license=('UNLICENSED')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('2b08d92bdb173824ec6240ec5eb51f21014597b69282c12c76ab7328f62d18d7')
noextract=("$pkgname-$pkgver.tgz")
options=('!strip')

package() {
	npm install --cache "${srcdir}/npm-cache" -g --user root --prefix "$pkgdir"/usr "$srcdir"/$noextract

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	find "${pkgdir}"/usr -type d -exec chmod 755 {} +

	# Remove references to $pkgdir
	find "$pkgdir" -name package.json -print0 | xargs -0 sed -i '/_where/d'

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"
}
