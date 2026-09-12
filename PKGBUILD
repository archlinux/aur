# Maintainer: Abdulkadir Furkan Şanlı <me at abdulocra dot cy>

pkgname=newman
pkgver=6.2.2
pkgrel=1
pkgdesc="Newman is a command-line collection runner for Postman"
arch=('any')
url="https://github.com/postmanlabs/${pkgname}"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
b2sums=('59ac1b08cc0c032ec14ddaba949cc381bac26cbb0bf8b7468d396653b55e31972ec890b1d5784f5e96c3dadac84ded05a436cb36f977b7c30ae07f4f3959bd09')
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
