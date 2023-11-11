# Maintainer: zoorat <zoorat [at] protonmail [dot] com>

_npmname=ezshare
pkgname=$_npmname
pkgver=1.9.0
pkgrel=4

pkgdesc="Easily share files, folders and clipboard over LAN - Like Google Drive but without internet"
arch=("x86_64")
url="https://github.com/mifi/ezshare"
license=("MIT")

depends=("glibc" "nodejs")
makedepends=("npm" "jq")
# provides=("$_npmname")
# conflicts=("$_npmname")
options=(strip emptydirs zipman)
changelog="changelog.md"

source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz"
	"https://raw.githubusercontent.com/mifi/ezshare/master/LICENSE")
noextract=("${_npmname}-${pkgver}.tgz")
b2sums=('a46df8031c223da4158bb0b88003675c87644ccddd0e1725b8e8455da99dab607b1d8c4ddc3cc56efc667d66a9822734bc6c50f3ff5e5fc5d34749fe53a5c6ab'
	'd4c7472ae3e92a22ca856eb72895a0862af5c283f21cc978ceef69af25f14dcc8e708a26154f697e9e22e4051e7bfa91e958e62aa3b4f6bf8c45f75f02cb6d13')

# Document: https://wiki.archlinux.org/title/Node.js_package_guidelines
package() {
	# Install using Using npm
	npm install -s -g \
		--cache "${srcdir}/npm-cache" \
		--prefix "${pkgdir}/usr" \
		"${srcdir}/${_npmname}-${pkgver}.tgz"

	# Fix ownership of ALL FILES
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +
	chown -R root:root "${pkgdir}"

	# Remove references to $pkgdir
	find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" >"$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"

	find "$pkgdir" -type f -name package.json | while read pkgjson; do
		local tmppackage="$(mktemp)"
		jq 'del(.man)' "$pkgjson" >"$tmppackage"
		mv "$tmppackage" "$pkgjson"
		chmod 644 "$pkgjson"
	done

	# Install LICENSE file
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
