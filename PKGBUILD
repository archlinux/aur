# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=cline
pkgname=${_appname}-cli
pkgdesc="Autonomous coding agent CLI - capable of creating/editing files, running commands, using the browser, and more."
pkgver=3.0.63
pkgrel=1

arch=("x86_64")
url="https://www.npmjs.com/package/cline"
license=("Apache-2.0")

makedepends=("npm" "jq")
depends=("glibc" "gcc-libs" "bash" "nodejs")

provides=("${_appname}")
replaces=("nodejs-${_appname}")

options=(!strip emptydirs staticlibs zipman)
noextract=("${pkgname}-${pkgver}.tgz")

source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_appname}/-/${_appname}-${pkgver}.tgz")
b2sums=('3b6bcd88924153b4f8dfec46e9e3389d2af34ff76466bf7d0b0ec8d495af4b3d492c276e68549e6c222deb29d672c7ca3cf8ad7dbdc270fc5b9f271f402baa38')

# Document: https://wiki.archlinux.org/title/Node.js_package_guidelines
package() {
	# Install using Using npm
	export SHARP_IGNORE_GLOBAL_LIBVIPS=1
	npm install -g \
		--cache "${srcdir}/npm-cache" \
		--prefix "${pkgdir}/usr" \
		"${srcdir}/${pkgname}-${pkgver}.tgz"

	# Fix ownership of ALL FILES
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +
	chown -R root:root "${pkgdir}"

	# Remove references to $pkgdir
	find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$_appname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"

	find "$pkgdir" -type f -name package.json | while read pkgjson; do
		local tmppackage="$(mktemp)"
		jq 'del(.man)' "$pkgjson" >"$tmppackage"
		mv "$tmppackage" "$pkgjson"
		chmod 644 "$pkgjson"
	done

	# Install README file
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_appname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
