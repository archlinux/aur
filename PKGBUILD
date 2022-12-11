# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgname=renovate
pkgname=${_pkgname}-git
pkgver=34.54.2.r0.gaab5fc38db
pkgrel=1
pkgdesc="Renovate - Dependency update tool (git-latest)"
arch=(any)
depends=('nodejs>=14')
makedepends=('git' 'yarn' 'npm' 'node-gyp')
provides=("${_pkgname}")
url="https://github.com/renovatebot/renovate"
license=('AGPL3')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  yarn version --no-git-tag-version --new-version "$(git describe --abbrev=0 --tags)"
  yarn install --frozen-lockfile
  yarn build
}

package() {
  cd "${pkgname}"

  install -dm755 "${pkgdir}/usr/lib/node_modules/${_pkgname}"
  cp -r "dist" "${pkgdir}/usr/lib/node_modules/${_pkgname}/dist"
  cp -r "package.json" "${pkgdir}/usr/lib/node_modules/${_pkgname}"
  cp -r "renovate-schema.json" "${pkgdir}/usr/lib/node_modules/${_pkgname}"

  chmod 775 "${pkgdir}/usr/lib/node_modules/${_pkgname}/dist/renovate.js"
  chmod 775 "${pkgdir}/usr/lib/node_modules/${_pkgname}/dist/config-validator.js"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/node_modules/${_pkgname}/dist/renovate.js" "${pkgdir}/usr/bin/$_pkgname"

  cd "${pkgdir}/usr/lib/node_modules/${_pkgname}"
  yarn install --prod
  find "node_modules" -type d -exec chmod 755 {} +
}

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
