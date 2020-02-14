# Maintainer: Matthew McGinn <mamcgi@gmail.com>

pkgname=balena-deploy-request
pkgdesc='A simple script for generating deploy requests along with release notes'
pkgver=0.7.0
pkgrel=1
arch=('any')
url='https://balena.io/'
_github_url="https://github.com/balena-io-modules/balena-deploy-request"
license=('APACHE')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://github.com/balena-io-modules/${pkgname}/archive/v${pkgver}.tar.gz")
noextract=("v${pkgver}.tar.gz")
options=(!strip)
sha256sums=('3d065aa3818c946b239cc61e9e126b2bf442d3f0981987c58f184a7e3a0a3338')

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
