# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=codex-security
pkgver=0.1.16
pkgrel=1
pkgdesc="SDK and CLI for finding, validating, and fixing security vulnerabilities in code"
arch=('x86_64' 'aarch64')
url="https://github.com/openai/codex-security"
license=('Apache-2.0')
depends=('nodejs>=22' 'git')
makedepends=('npm' 'pnpm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/npm-v${pkgver}.tar.gz")
sha256sums=('321737c698311422cbabd6565e12fe69b7e44d1993dc2ec047ed5b87d0b6c57c')

build() {
  cd "${pkgname}-npm-v${pkgver}/sdk/typescript"

  pnpm install --frozen-lockfile --config.store-dir="${srcdir}/pnpm-store"
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
