# Maintainer: Serge K <arch@phnx47.net>

_pkgname=renovate
pkgname="${_pkgname}-git"
pkgver=42.7.1.r0.g4a8391e
pkgrel=1
pkgdesc="Automated dependency updates (git-latest)"
arch=('any')
depends=('nodejs-lts-krypton')
makedepends=('git' 'pnpm')
provides=("${_pkgname}")
url="https://github.com/renovatebot/renovate"
license=('AGPL-3.0-only')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"

  pnpm version --no-git-tag-version "$(git describe --abbrev=0 --tags)"
  pnpm install --frozen-lockfile
  pnpm build
}

package() {
  cd "${pkgname}"

  install -dm 755 "${pkgdir}/usr/lib/node_modules/${_pkgname}"
  cp -r "dist" "${pkgdir}/usr/lib/node_modules/${_pkgname}"
  cp -r "node_modules" "${pkgdir}/usr/lib/node_modules/${_pkgname}"
  cp "package.json" "${pkgdir}/usr/lib/node_modules/${_pkgname}"
  cp "renovate-schema.json" "${pkgdir}/usr/lib/node_modules/${_pkgname}"

  chmod 775 "${pkgdir}/usr/lib/node_modules/${_pkgname}/dist/renovate.js"
  chmod 775 "${pkgdir}/usr/lib/node_modules/${_pkgname}/dist/config-validator.js"

  install -dm 755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/node_modules/${_pkgname}/dist/renovate.js" "${pkgdir}/usr/bin/${_pkgname}"
  ln -s "/usr/lib/node_modules/${_pkgname}/dist/config-validator.js" "${pkgdir}/usr/bin/${_pkgname}-config-validator"
}

pkgver() {
  cd "${pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
