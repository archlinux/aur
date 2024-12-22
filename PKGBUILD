# Maintainer: Abdulkadir Furkan Şanlı <me at abdulocra dot cy>

pkgname=newman
pkgver=6.2.1
pkgrel=1
pkgdesc="Newman is a command-line collection runner for Postman"
arch=('any')
url="https://github.com/postmanlabs/${pkgname}"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
b2sums=('5264199495f6c194a38f63f6e09dd1cd11f7ad33f879daeb61fdae46437ab7de2b5a0b487ada49c04cb7504fc4028177a781a39567c8d803fc97167a52214968')
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
