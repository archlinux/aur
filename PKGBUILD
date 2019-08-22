# Maintainer: Gergely Imreh <imrehg@gmail.com>
# Contributor: Gergely Imreh <imrehg@gmail.com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>

pkgname=balena-cli-git
pkgdesc='balena.io command line interface, development version'
pkgver=11.8.3.r0.g56aabad8
pkgrel=1
arch=('x86_64')
url='https://balena.io/'
license=('APACHE')
depends=('nodejs')
makedepends=('npm' 'git' 'python2')
source=('git+https://github.com/balena-io/balena-cli.git')
options=(!strip)
optdepends=('python: balena-preload')
optdepends_x86_64=('lib32-glibc: emulated builds')
provides=('balena-cli')
conflicts=('balena-cli')
replaces=('resin-cli-git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}" || exit 1
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}" || exit 1

  npm install
  npm publish --dry-run
  local packagefile
  packagefile=$(npm pack)
  mv "${packagefile}" "${srcdir}/${pkgname}.tgz"
}

package() {
  npm install --global --production --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}.tgz"

  find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  local tmppackage
  tmppackage="$(mktemp)"
  local pkgjson="${pkgdir}/usr/lib/node_modules/${pkgname%-git}/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "${pkgjson}" > "${tmppackage}"
  mv "${tmppackage}" "${pkgjson}"
  chmod 644 "${pkgjson}"
}
