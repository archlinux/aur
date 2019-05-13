# Maintainer: Brad Erhart <brae.04+aur@gmail.com>

pkgname=zapier-platform-cli
pkgver=8.1.0
pkgrel=2
pkgdesc="This CLI is your gateway to creating custom applications on the Zapier platform"
arch=('x86_64')
url="https://zapier.github.io/zapier-platform-cli/cli"
license=('UNLICENSED')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('0c0d34b43b8937879ff7f9bdcd17a6b89243375f30b8d04ae3858824a80e53d5')
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
