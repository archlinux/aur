# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_npmname=cline
_npmver=1.0.6

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
b2sums=('df444e5032da74f2968aaf498a4573252609c81918f3cd7795f4c3499e6a1f7789dfbecbc089061a332bdf12bf80be1a06473b9f487180cf33e442b5df72f811')

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
