# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgname=renovate
pkgname=${_pkgname}-git
pkgver=35.24.3.r1.g39493b7
pkgrel=1
pkgdesc="Renovate - Dependency update tool (git-latest)"
arch=(any)
depends=('nodejs>=18.12.0')
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

  # 'yarn install --prod' will prune dev packages
  yarn install --prod --frozen-lockfile
}

package() {
  cd "${pkgname}"

  install -dm755 "${pkgdir}/usr/lib/node_modules/${_pkgname}"
  cp -r "dist" "${pkgdir}/usr/lib/node_modules/${_pkgname}"
  cp -r "node_modules" "${pkgdir}/usr/lib/node_modules/${_pkgname}"
  cp "package.json" "${pkgdir}/usr/lib/node_modules/${_pkgname}"
  cp "renovate-schema.json" "${pkgdir}/usr/lib/node_modules/${_pkgname}"

  chmod 775 "${pkgdir}/usr/lib/node_modules/${_pkgname}/dist/renovate.js"
  chmod 775 "${pkgdir}/usr/lib/node_modules/${_pkgname}/dist/config-validator.js"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/node_modules/${_pkgname}/dist/renovate.js" "${pkgdir}/usr/bin/${_pkgname}"
}

pkgver() {
  cd "${pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
