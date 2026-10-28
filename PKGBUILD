# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=codex-security
pkgver=0.8.0
pkgrel=1
pkgdesc="SDK and CLI for finding, validating, and fixing security vulnerabilities in code"
arch=('x86_64' 'aarch64')
url="https://github.com/openai/codex-security"
license=('Apache-2.0')
depends=('nodejs>=22' 'git')
makedepends=('npm' 'pnpm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/npm-v${pkgver}.tar.gz"
        "https://registry.npmjs.org/@openai/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('2a346973718f3fb3575cdc6c4a88699e699b221faaaa01a0a4d3797c49df626d'
            '4465bcc2efb12dc749e85b42325f6df071f2c0db0652077a22cd77f6e920ac78')

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
