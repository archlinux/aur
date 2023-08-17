# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgname=renovate
pkgname="${_pkgname}-git"
pkgver=36.49.0.r5.g5e15496
pkgrel=1
pkgdesc="Automated dependency updates (git-latest)"
arch=('any')
depends=('nodejs>=18.12.0')
makedepends=('git' 'pnpm' 'node-gyp' 'fnm')
provides=("${_pkgname}")
url="https://github.com/renovatebot/renovate"
license=('AGPL3')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

# Cannot build with node v20
# https://github.com/TypeStrong/ts-node/issues/1997
_fnm_use() {
  export FNM_DIR="${srcdir}/.fnm"
  eval "$(fnm env --shell bash)"
  fnm use --install-if-missing
}

build() {
  cd "${pkgname}"

  _fnm_use

  pnpm version --no-git-tag-version "$(git describe --abbrev=0 --tags)"
  pnpm install
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
