# Maintainer: David <Davidfolgner@pm.me>

pkgname=terminal-shot
pkgver=0.1.0
pkgrel=1
pkgdesc='Turn terminal output into shareable PNG, SVG, or HTML snapshots'
arch=('any')
url='https://github.com/david-x3d/terminal-shot'
license=('MIT')
depends=('nodejs')
makedepends=('git' 'pnpm')
optdepends=('chromium: browser engine for PNG rendering through Playwright')
_commit='3267c6490423f18955cf7a726bf91fd9a8ca5542'
source=("${pkgname}::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"

  export PNPM_HOME="${srcdir}/pnpm-home"
  export npm_config_audit=false
  export npm_config_fund=false
  export npm_config_update_notifier=false

  pnpm install --frozen-lockfile --config.node-linker=hoisted
  pnpm run build
  rm -rf node_modules
  pnpm install --prod --frozen-lockfile --config.node-linker=hoisted
}

package() {
  cd "${pkgname}"

  install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgname}"
  cp -a dist node_modules package.json "${pkgdir}/usr/lib/${pkgname}/"
  rm -f "${pkgdir}/usr/lib/${pkgname}/node_modules/.modules.yaml"
  chmod 755 "${pkgdir}/usr/lib/${pkgname}/dist/index.js"
  ln -s "../lib/${pkgname}/dist/index.js" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  cp -a examples "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
