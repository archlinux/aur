# Maintainer: Thomas Quillan <tjquillan@gmail.com>

pkgname=nodejs-neovim
_npmname=neovim
pkgver=4.8.0
pkgrel=1
pkgdesc="Nvim Node.js client and plugin host"
arch=("any")
url="https://github.com/neovim/node-client"
license=("MIT")
depends=("nodejs")
makedepends=("npm" "jq")
optdepends=()
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('a1d4f4a569c55e43467fe952269100b5d3eebdf6f4ba30d4db5fea604218fe36')

package() {
	npm install -g --user root --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	find "${pkgdir}"/usr -type d -exec chmod 755 {} +

	# Remove references to $pkgdir
	find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"
}
