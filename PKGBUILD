# Maintainer: Matthew McGinn <mamcgi@gmail.com>

pkgname=balena-deploy-request
pkgdesc='A simple script for generating deploy requests along with release notes'
pkgver=0.8.2
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
sha256sums=('f8ea34e482934a1ad1cc6cb33af7468d490dc182ac4bf8983d7b8a8bbdc3822b')

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
