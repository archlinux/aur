# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
pkgname=solve3-cli
pkgver=1.7.4
pkgrel=1
pkgdesc="CLI for solving problems at https://solve.edu.pl/"
arch=('any')
url="https://github.com/kamack38/solve3-cli"
license=('MIT')
depends=('nodejs' 'jre-openjdk-headless')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('b9cbf342e9634c07a79299874cac8d649352e944d9a9b3e2f51c67eecf2f6317')

pkgver() {
	curl --silent -L "https://registry.npmjs.org/solve3-cli/latest" |
		grep -oP '"version":\K".*?"' |
		sed -e 's/"//g'
}

package() {
	npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

	# Remove references to $pkgdir
	find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" >"$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"

	find "$pkgdir" -type f -name package.json | while read pkgjson; do
		local tmppackage="$(mktemp)"
		jq 'del(.man)' "$pkgjson" >"$tmppackage"
		mv "$tmppackage" "$pkgjson"
		chmod 644 "$pkgjson"
	done
}
