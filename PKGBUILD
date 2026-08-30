# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="baairon"
pkgname="torlink"
pkgdesc="A sleek, zero-setup torrent finder and downloader that lives right in your terminal"
pkgver=1.8.0
pkgrel=1
arch=("x86_64")
url="https://github.com/${pkgauthor}/${pkgname}"
license=("MIT")

_npmname=torlnk
_npmver=${pkgver}

provides=("${_npmname}")

makedepends=("npm" "jq")
depends=("nodejs" "webtorrent-cli")

options=(!strip emptydirs staticlibs zipman)
noextract=("${pkgname}-${pkgver}.tgz")

source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
b2sums=('bf1461289049d76fc3caf5be9b65ad1b04a6cdd84f58c26319644215b04080a024e6167c056645d2acf4e6b538e57dca98c0e93c153aae32691cbfda36569272')


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

	rm -rf "${pkgdir}/usr/lib/node_modules/torlnk/node_modules/node-datachannel/"
	ln -sf "/usr/lib/webtorrent-cli/node_modules/node-datachannel/" "${pkgdir}/usr/lib/node_modules/torlnk/node_modules/node-datachannel"

	msg2 "Install README file"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_npmname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	msg2 "Install LICENSE file"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_npmname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
