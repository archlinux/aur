# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=codex-security
pkgver=0.8.2
pkgrel=1
pkgdesc="SDK and CLI for finding, validating, and fixing security vulnerabilities in code"
arch=('x86_64' 'aarch64')
url="https://github.com/openai/codex-security"
license=('Apache-2.0')
depends=('nodejs>=22' 'git')
makedepends=('npm' 'pnpm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/npm-v${pkgver}.tar.gz"
        "https://registry.npmjs.org/@openai/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('948e81195e0c51b0ffd51834210533479e0b54127353c28c8247a02ee1f0fecb'
            'f2b788db5edae4caabe277e1b87ce9fc232e24fe39b9f7f09821351391591052')

build() {
  cd "${pkgname}-npm-v${pkgver}/sdk/typescript"

  mkdir -p ../../plugins/codex-security/native/prebuilt
  cp -a "${srcdir}/package/_bundled_plugin/mcp/native/." \
    ../../plugins/codex-security/native/prebuilt/

  pnpm install --frozen-lockfile --config.store-dir="${srcdir}/pnpm-store"
  pnpm --dir ../../plugins/codex-security/mcp-app install \
    --frozen-lockfile --config.store-dir="${srcdir}/pnpm-store"
  pnpm run types
  pnpm run build
  pnpm pack --pack-destination "${srcdir}"
}

package() {
  cd "${pkgname}-npm-v${pkgver}"

  npm install --global --prefix "${pkgdir}/usr" \
    --include=optional --no-audit --no-fund \
    --cache "${srcdir}/npm-cache" \
    "${srcdir}/openai-codex-security-${pkgver}.tgz"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
