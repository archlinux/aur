# Maintainer: Gergely Imreh <imrehg@gmail.com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>

pkgname=versionist
pkgdesc='Flexible CHANGELOG generation toolkit that adapts to your commit conventions'
pkgver=5.4.3
pkgrel=1
arch=('any')
url='https://github.com/balena-io/versionist'
_github_url="https://github.com/balena-io/versionist"
license=('APACHE')
depends=('nodejs>=4.0.0')
makedepends=('npm' 'jq')
source=(http://registry.npmjs.org/$pkgname/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha256sums=('6f0532befd0a487478096d3498c29830bba15a0d2b12db211cd17c01ebb8cce2')

package() {
  npm install --global --only=production --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  local tmppackage="$(mktemp)"
  local pkgjson="${pkgdir}/usr/lib/node_modules/${pkgname}/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "${pkgjson}" > "${tmppackage}"
  mv "${tmppackage}" "${pkgjson}"
  chmod 644 "${pkgjson}"
}
