# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

pkgname=pi-web
pkgver=0.11.0
pkgrel=1
pkgdesc='Local browser UI for the pi coding agent'
arch=('x86_64')
url='https://github.com/agegr/pi-web'
license=('MIT')

depends=(
  'nodejs>=22.19.0'
)

makedepends=(
  'npm'
)

optdepends=(
  'xdg-utils: automatically open the web interface in a browser'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/agegr/pi-web/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=('cd80ef5cf476923d34e07c03a9b256028dd7b4e0cec1eab93b2f55dd4cda640b')

build() {
  cd "${pkgname}-${pkgver}"

  npm ci \
    --cache "${srcdir}/npm-cache" \
    --no-audit \
    --no-fund

  NEXT_TELEMETRY_DISABLED=1 npm run build
}

package() {
  cd "${pkgname}-${pkgver}"

  # Remove dependencies needed only for building/testing.
  npm prune \
    --omit=dev \
    --cache "${srcdir}/npm-cache" \
    --no-audit \
    --no-fund

  install -d "${pkgdir}/usr/lib/${pkgname}"

  cp -a \
    bin \
    .next \
    node_modules \
    public \
    next.config.ts \
    server.mjs \
    package.json \
    "${pkgdir}/usr/lib/${pkgname}/"

  # Match the contents of the upstream npm release:
  # these build artifacts are not required at runtime.
  rm -rf \
    "${pkgdir}/usr/lib/${pkgname}/.next/cache" \
    "${pkgdir}/usr/lib/${pkgname}/.next/dev"

  find "${pkgdir}/usr/lib/${pkgname}/.next" \
    -type f -name '*.js.map' -delete

  install -d "${pkgdir}/usr/bin"
  ln -s "../lib/${pkgname}/bin/pi-web.js" \
    "${pkgdir}/usr/bin/pi-web"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
