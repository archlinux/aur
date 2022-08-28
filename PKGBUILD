# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
pkgname=solve3-cli
pkgver=1.7.8
pkgrel=1
pkgdesc="CLI for solving problems at https://solve.edu.pl/"
arch=('any')
url="https://github.com/kamack38/solve3-cli"
license=('MIT')
depends=('nodejs' 'jre-openjdk-headless')
makedepends=('npm' 'jq' 'grep' 'sed')
sha256sums=('039b2204a1b6d70a3039c6bdb06b761baf073bf5dcf9cf863460d557095e3ba7')
tarball="${pkgname}-${sha256sums[0]}.tgz"
source=("${tarball}::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("${tarball}")

pkgver() {
	curl --silent -L "https://registry.npmjs.org/solve3-cli/latest" |
		grep -oP '"version":\K".*?"' |
		sed -e 's/"//g'
}

package() {
	npm install -g --prefix "$pkgdir/usr" "$srcdir/${tarball}"

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
