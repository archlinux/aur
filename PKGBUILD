# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_npmname=cloudcmd
pkgname=$_npmname
pkgver=19.0.10
pkgrel=1

pkgdesc="Cloud Commander file manager for the web with console and editor."
arch=("x86_64")
url="https://github.com/coderaiser/cloudcmd"
_urlraw="https://raw.githubusercontent.com/coderaiser/cloudcmd/v${pkgver}"
license=("MIT")
replaces=("nodejs-${_npmname}")
depends=("glibc" "nodejs" "python")
makedepends=("npm" "jq")
provides=("$_npmname")

options=(!strip emptydirs staticlibs zipman)
noextract=("${_npmname}-${pkgver}.tgz")
changelog="changelog.md"

source=("${_npmname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
b2sums=('6a64467b724b57f3ba228f4bcc764cd9be450c65d7a3776fed35d8f863dba61392cdbef9c4be48e8f29c6b67759ec3ea2ea7ba80654868dab65caf006f939b03'
        'bf0117ca16c7ecd50af3f3ac5c15ed1c2e02adc43231f6500e5658982e684bdfa87f40144bb17c3a5beff9fb112209a07580fdda031aff70520420d7f25557e0'
        'f925bfc0d0ce5b6542af8c5ba101117da11d4b760c65e8907cc6bf8d5ab443c996090f3ffe207d79e97f6f762e657f49522d5a83e81ad5f41cbcae063e27fe04')

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
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	# Install LICENSE file
	install -Dm 644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
