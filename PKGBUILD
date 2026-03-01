# Maintainer: Locutus <locutus@locutus.xyz>
# Contributor: Tobias Brunner <tobias@tobru.ch>

_npmname=cloudron
_npmver=7.0.4
pkgname=cloudron-cli
pkgver=$_npmver
pkgrel=1
pkgdesc="Cloudron Commandline Tool"
arch=('any')
url="https://git.cloudron.io/platform/cloudron-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
optdepends=()
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")
noextract=("$_npmname-$_npmver.tgz")
sha256sums=('f2af22c85f6ed1f53edcb98b56b808145a251da93dd4eb9c302b1e5a29d5efc6')

package() {
	npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

	# Install license
	local _npmdir="$pkgdir/usr/lib/node_modules/$_npmname"
	install -Dm644 "$_npmdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Remove references to $pkgdir
	find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"
}
