# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=codex-security
pkgver=0.1.23
pkgrel=2
pkgdesc="SDK and CLI for finding, validating, and fixing security vulnerabilities in code"
arch=('x86_64' 'aarch64')
url="https://github.com/openai/codex-security"
license=('Apache-2.0')
depends=('nodejs>=22' 'git')
makedepends=('npm' 'pnpm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/npm-v${pkgver}.tar.gz")
sha256sums=('a9935324c45b7c5d010d42d8a2022c6b6d252be0a669db0a912f7be709f66153')

build() {
  cd "${pkgname}-npm-v${pkgver}/sdk/typescript"

  pnpm install --frozen-lockfile --config.store-dir="${srcdir}/pnpm-store"
  npm ci --prefix ../../plugins/codex-security/mcp-app \
    --no-audit --no-fund --cache "${srcdir}/npm-cache"
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
