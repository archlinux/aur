# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
pkgname=nodejs-ripencli
_pkgname=${pkgname#nodejs-}
pkgver=1.0.1
pkgrel=1
pkgdesc="Update npm, pnpm, yarn, and bun dependencies interactively from your terminal. Version picker, changelog viewer, and smart grouping."
arch=('any')
url="https://ripencli.vercel.app/"
license=('MIT')
depends=(nodejs)
makedepends=(npm jq)
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
#noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('c0709912d40d52ade10fbbe40ec919ebb5d8431f3370d0cb2fcafe538b6f94c0')

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

	# remove references to $pkgdir
	find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

	# remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$_pkgname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"

	install -Dm644 "$srcdir/package/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
