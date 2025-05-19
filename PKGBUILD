# Maintainer: Serge K <arch@phnx47.net>

_pkgname=renovate
pkgname="${_pkgname}-git"
pkgver=40.17.0.r0.g4e12e52
pkgrel=1
pkgdesc="Automated dependency updates (git-latest)"
arch=('any')
depends=('nodejs>=22.13.0')
makedepends=('git' 'nvm')
provides=("${_pkgname}")
url="https://github.com/renovatebot/renovate"
license=('AGPL-3.0-only')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

_nvm_install() {
  export NVM_DIR="${srcdir}/.nvm"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install
}

build() {
  cd "${pkgname}"

  _nvm_install

  corepack pnpm version --no-git-tag-version "$(git describe --abbrev=0 --tags)"
  corepack pnpm install --frozen-lockfile
  corepack pnpm build
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
