# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=codex-security
pkgver=0.7.0
pkgrel=1
pkgdesc="SDK and CLI for finding, validating, and fixing security vulnerabilities in code"
arch=('x86_64' 'aarch64')
url="https://github.com/openai/codex-security"
license=('Apache-2.0')
depends=('nodejs>=22' 'git')
makedepends=('npm' 'pnpm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/npm-v${pkgver}.tar.gz"
        "https://registry.npmjs.org/@openai/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('26f410e01caf8b9aad660d4dcce3d0ca5239d3646dd03d2e2cfe0be9e86bd17b'
            '1c24e3b19c7632108f1658a44dd46ef2416ce8e2bfc6e952ef83e1c2ee433e28')

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
