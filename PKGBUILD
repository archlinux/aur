# Maintainer: Matthew McGinn <mamcgi@gmail.com>

pkgname=ci-node-modules
pkgdesc='Clean install node_modules using the appropriate installation command'
pkgver=1.1.0
pkgrel=1
arch=('any')
url='https://balena.io/'
_github_url="https://github.com/balena-io-modules/ci-node-modules"
license=('APACHE')
depends=('bash')
makedepends=('npm' 'jq')
source=("https://github.com/balena-io-modules/${pkgname}/archive/v${pkgver}.tar.gz")
noextract=("v${pkgver}.tar.gz")
options=(!strip)
sha256sums=('d8b2926c39a2c55349457e5f35ffec3eb19796fe346aeeb6eac0bebc41e8a374')

package() {
  npm install --global --production --user root --prefix "${pkgdir}/usr" "${srcdir}/v${pkgver}.tar.gz"

  find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  local tmppackage="$(mktemp)"
  local pkgjson="${pkgdir}/usr/lib/node_modules/${pkgname}/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "${pkgjson}" > "${tmppackage}"
  mv "${tmppackage}" "${pkgjson}"
  chmod 644 "${pkgjson}"
}
