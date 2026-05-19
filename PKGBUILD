# Maintainer: Serge K <arch@phnx47.net>

pkgname=renovate
pkgver=43.185.1
pkgrel=1
pkgdesc="Automated dependency updates"
arch=('any')
depends=('nodejs-lts-krypton')
makedepends=('git' 'pnpm')
provides=("${pkgname}")
url="https://github.com/renovatebot/renovate"
license=('AGPL-3.0-only')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('5480464f85a731ea77370b3fdab8a02db405ca8561489844cc39c1cbb59f7d14')

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
