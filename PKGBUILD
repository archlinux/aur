# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
pkgname=nodejs-ramadan-cli
_pkgname=${pkgname#nodejs-}
pkgver=6.1.0
pkgrel=2
pkgdesc="CLI to check Sehar and Iftar times in Ramadan"
arch=('any')
url="https://github.com/ahmadawais/ramadan-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
#noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('08902ca02663d65151df86f910f5e83d59cb2b8a16d9579c1d5cf7dce8ae9051')

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"

	# remove references to $pkgdir
	find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

	# remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$_pkgname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"

	install -Dm644 "$srcdir/package/license" "$pkgdir/usr/share/licenses/$pkgname/license"
}
