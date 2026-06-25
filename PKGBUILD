# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-web-access
pkgver=0.12.0
pkgrel=1
pkgdesc='Web search, URL fetching, and content extraction extension for pi coding agent'
arch=('any')
makedepends=('npm')
url='https://github.com/nicobailon/pi-web-access'
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/nicobailon/pi-web-access/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('6e7e0f099d35fd04a6ace8b994431eb4d64d8d9ba43e3044ca3d53a82edee8f3')
install=pi-ext.install
optdepends=('pi-coding-agent' 'pi-coding-agent-git')

build() {
  cd "${srcdir}/pi-web-access-${pkgver}"
  npm ci --omit=dev --no-audit --no-fund
  # Strip npm metadata and test directories from vendored deps
  rm -f node_modules/.package-lock.json
  find node_modules -name test -type d -prune -exec rm -rf {} + 2>/dev/null || true
}

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/web-access"
  cp -a "${srcdir}/pi-web-access-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/web-access/"
  rm -rf "${pkgdir}/usr/share/pi/extensions/web-access/test"

  install -Dm644 "${srcdir}/pi-web-access-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
