# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=clash-dashboard
pkgver=0.3.0
pkgrel=1
pkgdesc="web port of clash"
arch=('any')
url="https://github.com/Dreamacro/clash-dashboard"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'nodejs')
optdepends=(
  "nginx: web server"
  "apache: web server"
)
options=(!strip)
install=${pkgname}.install
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "${pkgname}.service"
)
sha1sums=('b4a1f9f2d71ce972ab45d4474f6b7a5fd199b8f9'
          '3815fd8b887e8c92e9afece3ce1a223d2c19c57e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  npm install --cache "${srcdir}/npm-cache"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  npm run-script build
}

package() {
  install -dm755 "${pkgdir}/usr/lib"
  cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/lib/${pkgname}"
  find "${pkgdir}/usr/lib/${pkgname}/node_modules" \
    -name "*.a" -exec rm '{}' \; \
    -or -name "*.bat" -exec rm '{}' \; \
    -or -name "*.c" -exec rm '{}' \; \
    -or -name "*.cpp" -exec rm '{}' \; \
    -or -name "*.node" -exec chmod a-x '{}' \; \
    -or -name "benchmark" -prune -exec rm -r '{}' \; \
    -or -name "doc" -prune -exec rm -r '{}' \; \
    -or -name "html" -prune -exec rm -r '{}' \; \
    -or -name "man" -prune -exec rm -r '{}' \; \
    -or -name "scripts" -prune -exec rm -r '{}' \;
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
