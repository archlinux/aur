# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=loreai
pkgver=0.30.0
pkgrel=1
pkgdesc="Memory and context management for AI coding agents"
arch=('any')
url="https://github.com/BYK/loreai"
license=('custom:FSL-1.1-Apache-2.0')
depends=('nodejs>=22')
makedepends=('pnpm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('debc4f118b43fe2b1c920e2d305c44249be12ddbaa061f710db26e95765ecf60')

build() {
  cd "${pkgname}-${pkgver}"

  pnpm install --frozen-lockfile --ignore-scripts --config.store-dir="${srcdir}/pnpm-store"

  pnpm --filter @loreai/gateway run bundle
}

package() {
  cd "${pkgname}-${pkgver}"

  local mod_dir="/usr/lib/node_modules/${pkgname}"

  install -dm755 "${pkgdir}${mod_dir}/dist" \
                 "${pkgdir}/usr/bin" \
                 "${pkgdir}/usr/share/doc/${pkgname}"

  cp -a packages/gateway/dist/. "${pkgdir}${mod_dir}/dist/"
  rm -f "${pkgdir}${mod_dir}"/dist/*.map
  install -m644 packages/gateway/package.json "${pkgdir}${mod_dir}/package.json"
  chmod 755 "${pkgdir}${mod_dir}/dist/bin.cjs"

  ln -s "${mod_dir}/dist/bin.cjs" "${pkgdir}/usr/bin/lore"
  ln -s "${mod_dir}/dist/bin.cjs" "${pkgdir}/usr/bin/lore-gateway"

  install -m644 README.md CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
