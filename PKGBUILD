# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=codex-security
pkgver=0.1.31
pkgrel=1
pkgdesc="SDK and CLI for finding, validating, and fixing security vulnerabilities in code"
arch=('x86_64' 'aarch64')
url="https://github.com/openai/codex-security"
license=('Apache-2.0')
depends=('nodejs>=22' 'git')
makedepends=('npm' 'pnpm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/npm-v${pkgver}.tar.gz"
        "https://registry.npmjs.org/@openai/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('3eb2fa26543464e0d6ab0e4c499aaf36ee9d4354b940073c0333daf879396796'
            'e330e2e8f8882b781c4010e7e01c7f313c31483089d5aac2e7af94bf0550a002')

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
