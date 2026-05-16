# Maintainer: David <Davidfolgner@pm.me>

pkgname=ios-cert-checker
pkgver=0.1.0
pkgrel=1
pkgdesc='Privacy-first local CLI for inspecting iOS signing certificates and provisioning profiles'
arch=('any')
url='https://github.com/david-x3d/ios-cert-checker'
license=('MIT')
depends=('nodejs' 'openssl')
makedepends=('git' 'npm')
_commit='72655d5edcf95e1f7e4df27a43d6b0f98d50fa06'
source=("${pkgname}::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"

  export npm_config_audit=false
  export npm_config_fund=false
  export npm_config_update_notifier=false
  export npm_config_cache="${srcdir}/npm-cache"

  npm ci
  npm run build
  npm prune --omit=dev
}

package() {
  cd "${pkgname}"

  install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgname}"
  cp -a dist node_modules package.json "${pkgdir}/usr/lib/${pkgname}/"
  rm -f "${pkgdir}/usr/lib/${pkgname}/node_modules/.package-lock.json"
  rmdir "${pkgdir}/usr/lib/${pkgname}/node_modules/@types" 2>/dev/null || true
  chmod 755 "${pkgdir}/usr/lib/${pkgname}/dist/index.js"
  ln -s "../lib/${pkgname}/dist/index.js" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
