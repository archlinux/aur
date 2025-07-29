# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_npmname=wperf
pkgname=$_npmname
pkgver=1.0.11
pkgrel=1

pkgdesc="A simple HTTP load testing utility with detailed performance metrics."
arch=("x86_64")
url="https://github.com/jhuckaby/wperf"
license=("MIT")

depends=("glibc" "nodejs")
makedepends=("npm")
provides=("$_npmname")
conflicts=("$_npmname")
# options=(strip emptydirs zipman)

source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz"
		"https://raw.githubusercontent.com/jhuckaby/wperf/v${pkgver}/LICENSE.md")
noextract=("${_npmname}-${pkgver}.tgz")
b2sums=('8046df2f9fdb0c95cf6a78e8b2cb7722f7880312cefa451a49aa6edd882a8f0966fd07357057f516d5ec7b3e892539ec996eca9c0ad1e6dd7a65f896c1b811a0'
        'bf727eb2112307cf17d0289aabd22b2adc6181ad0c30339852284bbffe5df7c124f636b8e68c940a6e60a78896185c9bc344139cbeccb9db659153284dd56a79')

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
	install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
