# Maintainer: Abdulkadir Furkan Şanlı <me at abdulocra dot cy>

pkgname=newman
pkgver=6.1.0
pkgrel=1
pkgdesc="Newman is a command-line collection runner for Postman"
arch=('any')
url="https://github.com/postmanlabs/${pkgname}"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/${pkgname}-${pkgver}.tgz")
sha512sums=('d00fdd4959c6be69cdbfa45ab4234c2189d27ccaa452304b31a73f2efa3e0b466bf0141bc1e06e130fb3351d6480f881c14426615911bc6589c08fdc137376a8')
noextract=("${pkgname}-${pkgver}.tgz")

package ()
{
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

	# Remove references to $pkgdir
	find "${pkgdir}" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

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
