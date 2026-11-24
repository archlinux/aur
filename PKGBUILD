# Maintainer: Serge <arch@phnx47.net>

# Auto Upgrade: https://github.com/phnx47/pkgbuilds

pkgname=renovate
pkgver=44.259.1
pkgrel=1
pkgdesc="Automated dependency update tool"
arch=('any')
depends=('nodejs>=24.11.0' 'nodejs<27')
makedepends=('git' 'pnpm' 'semver')
url="https://github.com/renovatebot/renovate"
license=('AGPL-3.0-only')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('c76015ad4361ea33ef2cd42d99986520f4c91fbe0db613500614eb25795f6715')

_check_node() {
  current_node="$(node -v)"
  expected_node="$(pnpm pkg get engines.node --loglevel=error)"
  if ! semver -r "${expected_node}" "${current_node}" > /dev/null; then
    echo -e "Using the wrong version of Node.js! Expected '\e[32m${expected_node}\e[0m' but using '\e[31m${current_node}\e[0m'."
    exit 1
  fi
}

prepare() {
  cd "${pkgname}-${pkgver}"

  _check_node
  sed -i "s/\"version\": \"[^\"]*\"/\"version\": \"${pkgver}\"/" package.json
}

build() {
  cd "${pkgname}-${pkgver}"

  pnpm install --frozen-lockfile
  pnpm build
}

package() {
  cd "${pkgname}-${pkgver}"

  install -dm 755 "${pkgdir}/usr/lib/node_modules/${pkgname}"
  cp -r "dist" "${pkgdir}/usr/lib/node_modules/${pkgname}"
  cp -r "node_modules" "${pkgdir}/usr/lib/node_modules/${pkgname}"
  cp "package.json" "${pkgdir}/usr/lib/node_modules/${pkgname}"
  cp "renovate-schema.json" "${pkgdir}/usr/lib/node_modules/${pkgname}"

  chmod 775 "${pkgdir}/usr/lib/node_modules/${pkgname}/dist/renovate.js"
  chmod 775 "${pkgdir}/usr/lib/node_modules/${pkgname}/dist/config-validator.js"

  install -dm 755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/node_modules/${pkgname}/dist/renovate.js" "${pkgdir}/usr/bin/${pkgname}"
  ln -s "/usr/lib/node_modules/${pkgname}/dist/config-validator.js" "${pkgdir}/usr/bin/${pkgname}-config-validator"
}
