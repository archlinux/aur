# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=nanocoder
pkgauthor=Mote-Software
pkgver=1.22.5
pkgrel=1

_npmname=nanocoder
_npmauthor=@nanocollective

pkgdesc="A beautiful local-first coding agent running in your terminal"
arch=("x86_64")
url="https://github.com/${pkgauthor}/${pkgname}"
_urlraw="https://raw.githubusercontent.com/${pkgauthor}/${pkgname}/v${pkgver}"
license=("MIT")

replaces=("nodejs-${pkgname}")
depends=("bash" "nodejs")
makedepends=("npm" "jq")
provides=("${pkgname}")

options=(!strip emptydirs staticlibs zipman)
changelog="changelog.md"

source=("https://registry.npmjs.org/${_npmauthor}/${_npmname}/-/${pkgname}-${pkgver}.tgz"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE.md")
noextract=("${pkgname}-${pkgver}.tgz")

b2sums=('7e547c57c028ead14eee88e0c7efd23dafbbedbd25b60a589a8e323fe251b1946e1b1308fbd7b5cecd58f35f22f8761486c057b71874edd646ef292ac6254e5e'
        '402ede54ee8fa8cd0dc7d6c8f835c3d28967321901bcb41b00c593dd82941fc4171c0e9f632ebc5ce64dae5e1d46aa92830a89e28ccd04702f77ebd003749311'
        'ddb35bf22d7acd420eb45dc704bbf052eae7776d85910c3634d63cd031b92be4fa87ead8230692896175f63064baaf68b122cdd48f7d6e49c3b9a8c2ad29b858')

# Document: https://wiki.archlinux.org/title/Node.js_package_guidelines
package() {
	msg2 "Install using NPM"
	npm install -s -g \
		--cache "${srcdir}/npm-cache" \
		--prefix "${pkgdir}/usr" \
		"${srcdir}/${pkgname}-${pkgver}.tgz"

	msg2 "Fix ownership of ALL FILES"
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +
	chown -R root:root "${pkgdir}"

	msg2 "Remove references to ${pkgdir}"
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

	local tmppackage="$(mktemp)"
	local pkgjson="${pkgdir}/usr/lib/node_modules/${_npmauthor}/${_npmname}/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "${pkgjson}" > "${tmppackage}"
	mv "${tmppackage}" "${pkgjson}"
	chmod 644 "${pkgjson}"

	find "${pkgdir}" -type f -name package.json | while read pkgjson; do
		local tmppackage="$(mktemp)"
		jq 'del(.man)' "${pkgjson}" > "${tmppackage}"
		mv "${tmppackage}" "${pkgjson}"
		chmod 644 "${pkgjson}"
	done

	msg2 "Install README file"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	msg2 "Install LICENSE file"
	install -Dm 644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
