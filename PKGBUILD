# Maintainer: Abdulkadir Furkan Şanlı <me at abdulocra dot cy>

pkgname=newman
pkgver=6.1.3
pkgrel=1
pkgdesc="Newman is a command-line collection runner for Postman"
arch=('any')
url="https://github.com/postmanlabs/${pkgname}"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
b2sums=('190c34f2b412b733dc1c18ceb793b24be411dafa3c87b09be99036e9980133e62bbd732fa4c0470af1cb086404f79395e9c64c44cc55d0d2f8f01ff7657b3240')
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
