# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="baairon"
pkgname="soundcli"
pkgdesc="Download your YouTube, SoundCloud, and Spotify libraries to your computer and play them offline, all from your terminal"
pkgver=1.1.1
pkgrel=1
arch=("x86_64")
url="https://github.com/${pkgauthor}/${pkgname}"
license=("MIT")

_npmname=sndcli
_npmver=${pkgver}

provides=("${_npmname}")

makedepends=("npm" "jq")
depends=("nodejs")

options=(!strip emptydirs staticlibs zipman)
noextract=("${pkgname}-${pkgver}.tgz")

source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
b2sums=('ea580cd2c26f3a6f314665a5cb07dfd080c02d00240a2bf29fd9612d22d4264797e19f8c0f0b4f29855f29690d6f8e53cb2615962dd97bc37ab9f2e670e4d41c')


package() {
	msg2 "Install using Using npm"
	npm install -g --ignore-scripts \
		--cache "${srcdir}/npm-cache" \
		--prefix "${pkgdir}/usr" \
		"${srcdir}/${pkgname}-${pkgver}.tgz"

	msg2 "Fix ownership of ALL FILES"
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +
	chown -R root:root "${pkgdir}"

	msg2 "Remove references to ${pkgdir}"
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

	local tmppackage="$(mktemp)"
	local pkgjson="${pkgdir}/usr/lib/node_modules/${_npmname}/package.json"
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
	ln -sf "/usr/lib/node_modules/${_npmname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	msg2 "Install LICENSE file"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_npmname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
