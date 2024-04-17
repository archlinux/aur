# Maintainer: Abdulkadir Furkan Şanlı <me at abdulocra dot cy>

pkgname=newman
pkgver=6.1.2
pkgrel=1
pkgdesc="Newman is a command-line collection runner for Postman"
arch=('any')
url="https://github.com/postmanlabs/${pkgname}"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
b2sums=('c2eda8cb0e48637857f6f9dd7ddfaab813544d6ea907839e8cd429aa5f78ca12b7da9b87f0e47bd393d54fea79cff179a524b166195f6c6768bb1c7a8c787cec')
noextract=("${pkgname}-${pkgver}.tgz")

package ()
{
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

	# Remove references to $pkgdir
	find "${pkgdir}" -type f -name package.json -print0 | xargs -0 sed -i '/_where/d'

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="${pkgdir}/usr/lib/node_modules/${pkgname}/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "${pkgjson}" > "${tmppackage}"
	mv "${tmppackage}" "${pkgjson}"
	chmod 644 "${pkgjson}"

	find "${pkgdir}" -type f -name package.json | while read pkgjson; do
		local tmppackage="$(mktemp)"
		jq 'del(.man)' "${pkgjson}" > "${tmppackage}"
		mv "${tmppackage}" "${pkgjson}"
		chmod 644 "${pkgjson}"
	done
}
