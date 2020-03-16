# Maintainer: Gergely Imreh <imrehg@gmail.com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>

pkgname=balena-cli
pkgdesc='balena.io command line interface'
pkgver=11.29.4
pkgrel=1
arch=('i686' 'x86_64')
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
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
options=(!strip)
replaces=('resin-cli')
sha256sums=('e206626540ef0718c5fcb6d057d30c8d170daf247a9989d94aef52e275350db2')

package() {
  npm install --global --production --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  local tmppackage="$(mktemp)"
  local pkgjson="${pkgdir}/usr/lib/node_modules/${pkgname}/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "${pkgjson}" > "${tmppackage}"
  mv "${tmppackage}" "${pkgjson}"
  chmod 644 "${pkgjson}"
  chown -R root:root "${pkgdir}"
}
