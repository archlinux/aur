# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=qbit-race-git
pkgver=2.0.0alpha8.r17.g3ab6d4f
pkgrel=1
pkgdesc='Qbittorrent utilities for racing'
arch=(x86_64)
url=https://github.com/ckcr4lyf/qbit-race
license=(unknown)
depends=(nodejs)
makedepends=(npm jq git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	git -C ${pkgname%-git} describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-alpha./alpha/g;s/-/./g'
}

package() {
	npm install -g --prefix "$pkgdir/usr" "${pkgname%-git}"

	# Remove references to $pkgdir
	find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/${pkgname%-git}/package.json"
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
