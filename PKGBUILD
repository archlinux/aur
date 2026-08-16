# Maintainer: Serge <arch@phnx47.net>

# Auto Upgrade: https://github.com/phnx47/pkgbuilds

pkgname=renovate
pkgver=44.30.4
pkgrel=1
pkgdesc="Automated dependency update tool"
arch=('any')
depends=('nodejs-lts-krypton')
makedepends=('git' 'pnpm')
url="https://github.com/renovatebot/renovate"
license=('AGPL-3.0-only')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('2c5ad930aa8d9195fe3928ee8f08859d6f7aa8e9fd53073037dae02f365494eb')

prepare() {
  cd "${pkgname}-${pkgver}"

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
