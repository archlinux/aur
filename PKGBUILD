# Maintainer: Berkcan Ucan <ucanberkcan@gmail.com>

pkgname=tinance
pkgver=0.0.4
pkgrel=1
pkgdesc='Track your favorite cryptocurrency from terminal!'
arch=('any')
url=https://github.com/panlazy/tinance
license=('GPL3')
depends=('nodejs' 'jq')
makedepends=('npm')
source=("https://registry.npmjs.org/tinance/-/tinance-$pkgver.tgz")
noextract=("${source[@]##*/}")
md5sums=('a6abb5638e595f92a3083811ec101d17')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	mkdir -p $pkgdir/usr/share/doc/$pkgname
	mv $pkgdir/usr/lib/node_modules/$pkgname/LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE.md
	mv $pkgdir/usr/lib/node_modules/$pkgname/README.md $pkgdir/usr/share/doc/$pkgname/README.md

	find "$pkgdir/usr" -type d -exec chmod 755 {} +

	find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"

	find "$pkgdir" -type f -name package.json | while read pkgjson; do
		local tmppackage="$(mktemp)"
		jq 'del(.man)' "$pkgjson" > "$tmppackage"
		mv "$tmppackage" "$pkgjson"
		chmod 644 "$pkgjson"
	done
}

