# Maintainer: Gergely Imreh <imrehg@gmail.com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>

pkgname=balena-cli
pkgdesc='balena.io command line interface'
pkgver=11.33.0
pkgrel=1
arch=('x86_64')
url='https://balena.io/'
_github_url="https://github.com/balena-io/balena-cli"
license=('APACHE')
depends=('nodejs>=8.0.0' 'gawk' 'sed' 'make')
makedepends=('npm' 'python2' 'jq' 'coffeescript' 'git' 'node-gyp')
optdepends=('python2: balena preload'
    'openssh: balena ssh'
    'linux-aufs: balena preload/build/deploy --build'
    'avahi: balena scan')
optdepends_x86_64=('lib32-glibc: emulated builds')
source=("${_github_url}/archive/v${pkgver}.tar.gz")
noextract=("v${pkgver}.tar.gz")
options=(!strip)
replaces=('resin-cli')
sha256sums=('d19637372595b120036341d29f35a202ada1f27fc5788814636d2df06c7a50b4')

package() {
  npm install --global --production --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/v${pkgver}.tar.gz"

  find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  local tmppackage="$(mktemp)"
  local pkgjson="${pkgdir}/usr/lib/node_modules/${pkgname}/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "${pkgjson}" > "${tmppackage}"
  mv "${tmppackage}" "${pkgjson}"
  chmod 644 "${pkgjson}"
  chown -R root:root "${pkgdir}"
}
