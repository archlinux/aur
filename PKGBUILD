# Maintainer: pakrohk <pakrohk@gmail.com>
pkgname=9router-webui-bin
pkgver=0.5.40
pkgrel=1
pkgdesc="9Router - WebUI AI Router with 40+ providers, auto-fallback, RTK token optimization"
arch=('x86_64' 'aarch64')
url="https://github.com/decolua/9router"
license=('MIT')
depends=('bun' 'curl' 'libnotify')
makedepends=('bun')
optdepends=('systemd: user service management'
            'xdg-utils: for opening browser')
install="${pkgname}.install"
options=('!strip')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/9router/-/9router-${pkgver}.tgz"
        '9router.sh'
        '9router.service'
        '9router.env')
sha256sums=('437935e7f7514cdd415a310613eaac7815b29ff9453b31d11e8d319a5126db8d'
            'SKIP'
            'SKIP'
            'SKIP')

build() {
  _pkgroot="${srcdir}/package"
  cd "${_pkgroot}"

  export BUN_INSTALL_CACHE_DIR="${srcdir}/bun-cache"
  export JOBS=$(nproc)

  bun install --production --no-save --no-audit --no-fund

  cd "${_pkgroot}/app"
  bun rebuild better-sqlite3 2>/dev/null || true

  # Remove systray (poor Linux compatibility)
  rm -rf "${_pkgroot}/node_modules/systray"

  # Optimize: remove unnecessary files
  find "${_pkgroot}" -type f \( -name "*.md" -o -name "*.markdown" -o -name "*.ts" -o -name "*.map" \) -delete 2>/dev/null || true
  find "${_pkgroot}" -type d -name "__tests__" -exec rm -rf {} + 2>/dev/null || true
  find "${_pkgroot}" -type d -name "test" -exec rm -rf {} + 2>/dev/null || true
}

package() {
  _pkgroot="${srcdir}/package"
  cd "${_pkgroot}"

  install -dm755 "${pkgdir}/usr/lib/node_modules/9router"
  cp -a . "${pkgdir}/usr/lib/node_modules/9router/"

  local _dest="${pkgdir}/usr/lib/node_modules/9router"

  # Clean up build artifacts
  find "${_dest}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  find "${_dest}" -type f \( -name "*.mk" -o -name "Makefile" -o -name "*.d" -o -name "config.gypi" \) -delete
  chmod -R a+rX "${_dest}"

  # Install launcher scripts
  install -Dm755 "${srcdir}/9router.sh" "${pkgdir}/usr/bin/9router"
  install -Dm644 "${srcdir}/9router.service" "${pkgdir}/usr/lib/systemd/user/9router.service"
  install -Dm644 "${srcdir}/9router.env" "${pkgdir}/usr/share/doc/${pkgname}/9router.env"

  # Documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md" 2>/dev/null || true
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
