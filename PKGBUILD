# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=patchy
pkgdesc='A CLI for generating and applying patches to git repositories'
pkgver=0.0.27
pkgrel=1
url="https://github.com/richardgill/patchy"
arch=('x86_64')
license=('MIT')
makedepends=('npm' 'jq')
depends=('glibc' 'nodejs')
noextract=("${pkgname}-${pkgver}.tgz")
source=("patchy-cli-${pkgver}.tgz::https://registry.npmjs.org/patchy-cli/-/patchy-cli-${pkgver}.tgz")
b2sums=('12584256270a5ec5229537b2f3a5f5f52961ac57f4b82ee27530b3a1287ccf86bf151c3f31b6b679d2bb4e22a38f8eddd14239ae3fb5f9dc1a97f20029cb1e6d')

# Document: https://wiki.archlinux.org/title/Node.js_package_guidelines
package() {
	msg2 "Install using Using npm"
	npm install -s -g \
		--cache "${srcdir}/npm-cache" \
		--prefix "${pkgdir}/usr" \
		"${srcdir}/patchy-cli-${pkgver}.tgz"

	msg2 "Fix ownership of ALL FILES"
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +
	chown -R root:root "${pkgdir}"

	msg2 "Remove references to ${pkgdir}"
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

	local tmppackage="$(mktemp)"
	local pkgjson="${pkgdir}/usr/lib/node_modules/patchy-cli/package.json"
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
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
	ln -sf "/usr/lib/node_modules/patchy-cli/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	msg2 "Install LICENSE file"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	ln -sf "/usr/lib/node_modules/patchy-cli/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
