# Maintainer: Locutus <locutus@locutus.xyz>
# Contributor: Tobias Brunner <tobias@tobru.ch>

_npmname=cloudron
_npmver=4.12.1
pkgname=cloudron-cli
pkgver=$_npmver
pkgrel=2
pkgdesc="Cloudron Commandline Tool"
arch=('any')
url="https://git.cloudron.io/cloudron/cloudron-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
optdepends=()
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")
noextract=("$_npmname-$_npmver.tgz")
sha256sums=('0ac6bfab2a8336763c5a9ca6e5e2220815ee32bedad1959f240e6ee308f3dd0a')

package() {
	npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
	local _npmdir="$pkgdir/usr/lib/node_modules/$_npmname"
	find "$pkgdir/usr" -type d -exec chmod 755 {} +
	chown -R root:root "$pkgdir"
	install -Dm644 "$_npmdir/LICENSE" "$pkgdir/usr/share/licenses/$_npmname/LICENSE"
	rm -rf "$_npmdir/LICENSE"
	
	# Remove references to $pkgdir
	find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"
}
