# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_npmname=cline
_npmver=1.0.10

pkgname=${_npmname}-cli
pkgdesc="Autonomous coding agent CLI - capable of creating/editing files, running commands, using the browser, and more."
pkgver=$_npmver
pkgrel=1
arch=("x86_64")
url="https://www.npmjs.com/package/cline"
license=("Apache-2.0")
replaces=("nodejs-${_npmname}")
depends=("glibc" "gcc-libs" "bash" "nodejs")
makedepends=("npm" "jq")
provides=("${_npmname}")

options=(!strip emptydirs staticlibs zipman)
noextract=("${pkgname}-${pkgver}.tgz")

source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
b2sums=('7d791de03fb8f1c478dcc389a882b868dca49151f743282c82489a45574eedd83bedefb52f252916f07f46b09fbbbe4d32cdd1c823de7b5cdc3b201d8f81304c')

# Document: https://wiki.archlinux.org/title/Node.js_package_guidelines
package() {
	# Install using Using npm
	npm install -s -g \
		--cache "${srcdir}/npm-cache" \
		--prefix "${pkgdir}/usr" \
		"${srcdir}/${pkgname}-${pkgver}.tgz"

	# Fix ownership of ALL FILES
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +
	chown -R root:root "${pkgdir}"

	# Remove references to $pkgdir
	find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"

	find "$pkgdir" -type f -name package.json | while read pkgjson; do
		local tmppackage="$(mktemp)"
		jq 'del(.man)' "$pkgjson" >"$tmppackage"
		mv "$tmppackage" "$pkgjson"
		chmod 644 "$pkgjson"
	done

	# Install man page
	install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/man/${_npmname}.1" "${pkgdir}/usr/share/man/man1/${_npmname}.1"

	# Install README file
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_npmname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
