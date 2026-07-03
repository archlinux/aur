# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=loreai-pi
pkgver=0.35.0
pkgrel=1
pkgdesc="Lore memory engine extension for Pi"
arch=('any')
url="https://github.com/BYK/loreai"
license=('custom:FSL-1.1-Apache-2.0')
depends=('pi' 'loreai')
makedepends=('pnpm')
source=("loreai-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1463048f7509aad6a4996fe556b4d3e0a6f7e71812745854e4290cac62ce82f5')

build() {
  cd "loreai-${pkgver}"

  pnpm install --frozen-lockfile --ignore-scripts --config.store-dir="${srcdir}/pnpm-store"

  pnpm --filter @loreai/core run build
  pnpm --filter @loreai/pi run build
}

package() {
  cd "loreai-${pkgver}"

  local mod_dir="/usr/lib/node_modules/@loreai/pi"

  install -dm755 "${pkgdir}${mod_dir}/dist" \
                 "${pkgdir}${mod_dir}/node_modules/@loreai" \
                 "${pkgdir}/usr/share/doc/${pkgname}"

  cp -a packages/pi/dist/. "${pkgdir}${mod_dir}/dist/"
  rm -f "${pkgdir}${mod_dir}"/dist/*.map
  install -m644 packages/pi/package.json "${pkgdir}${mod_dir}/package.json"

  ln -s /usr/lib/node_modules/loreai "${pkgdir}${mod_dir}/node_modules/@loreai/gateway"

  install -m644 packages/pi/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 packages/pi/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
