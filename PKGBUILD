# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_npmname=cloudcmd
_npmver=19.0.13

pkgname=${_npmname}
pkgdesc="Cloud Commander file manager for the web with console and editor."
pkgver=$_npmver
pkgrel=1
arch=("x86_64")
url="https://github.com/coderaiser/cloudcmd"
_urlraw="https://raw.githubusercontent.com/coderaiser/cloudcmd/v${pkgver}"
license=("MIT")
replaces=("nodejs-${_npmname}")
depends=("glibc" "nodejs" "python")
makedepends=("npm" "jq")
provides=("${_npmname}")

options=(!strip emptydirs staticlibs zipman)
noextract=("${pkgname}-${pkgver}.tgz")
changelog="changelog.md"

source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz"
		"MAN-${pkgver}.1::${_urlraw}/man/${_npmname}.1"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
b2sums=('f7c206d980219b481393a0a79d78d9cf89f5e79b5d6dc55db8eab81be8db01783a0c188e3188fe2c1a38746582563b31d8406b833e9311494fb19533f5883659'
        '13a9ac73acae2bb4bb87c67bfd4ff4f26192780f7f5b7303d146e5e642e9232af0f8b0859135b30626010144d913f7c7dfae142fd8f1d66089da7a659b412bc9'
        '440d97e75c9032dc5a6d56c67344136cd4428bd50680c87f7edbc5159ca2b12b06a3f9abc3853c3c75a80db0c179e111379dbf878fc891104cc8282423398381'
        'f925bfc0d0ce5b6542af8c5ba101117da11d4b760c65e8907cc6bf8d5ab443c996090f3ffe207d79e97f6f762e657f49522d5a83e81ad5f41cbcae063e27fe04')

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
	install -Dm644 "MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"

	# Install README file
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	# Install LICENSE file
	install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
