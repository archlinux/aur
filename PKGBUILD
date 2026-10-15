# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-web-access
pkgver=0.41.0
pkgrel=1
pkgdesc='Web search, URL fetching, and content extraction extension for pi coding agent'
arch=('any')
makedepends=('npm')
url='https://github.com/nicobailon/pi-web-access'
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/nicobailon/pi-web-access/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('d781145af65d7939f9b07c0c070f2e4de7ef035469e39c3a2288b3eab674b9f7')
install=pi-ext.install
optdepends=('pi-coding-agent' 'pi-coding-agent-git')
options=('!strip' '!debug')

build() {
  cd "${srcdir}/pi-web-access-${pkgver}"
  npm install --omit=dev --no-audit --no-fund
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
