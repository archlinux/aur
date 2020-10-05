# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Gergely Imreh <imrehg@gmail.com>

pkgname=versionist
pkgdesc='Flexible CHANGELOG generation toolkit that adapts to your commit conventions'
pkgver=6.1.7
pkgrel=1
arch=('any')
url='https://github.com/balena-io/versionist'
_github_url="https://github.com/balena-io/versionist"
license=('APACHE')
depends=('nodejs>=4.0.0')
makedepends=('npm' 'jq')
source=(http://registry.npmjs.org/$pkgname/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha256sums=('06e17a34090900e6098243ec38f2911bb4aab63a3adbd6698281d01c543f2c97')

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
