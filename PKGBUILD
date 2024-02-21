# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=oauth2-proxy
pkgver=7.6.0
pkgrel=1
pkgdesc='A reverse proxy and static file server that provides authentication using Providers (Google, Keycloak, GitHub and others) to validate accounts by email, domain or group.'
arch=(arm64 armv6 armv7 ppc64le x86_64)
url='https://github.com/oauth2-proxy/oauth2-proxy/'
makedepends=(go sed)
license=('MIT')
source=("https://github.com/oauth2-proxy/oauth2-proxy/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('de7574ae6ecf0da0b9962e4601fdc5b7f742fa0d4a55a0e5844256a2aa10170973c324b1041c490b2be0023b954a53d9b78ed488dcd238a2a047e25ab5ba7667')
backup=(etc/oauth2-proxy.cfg)
prepare() {
  sed -i -e 's|/usr/local/bin/oauth2-proxy|/usr/bin/oauth2-proxy|' -e 's/www-data/http/' -e '/^#/d' "${srcdir}/${pkgname}-${pkgver}/contrib/${pkgname}.service.example"
}
build() {
  cd "${pkgname}-${pkgver}"
  make build
}
package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/contrib/${pkgname}.cfg.example" "${pkgdir}/etc/oauth2-proxy.cfg"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/contrib/${pkgname}.service.example" "${pkgdir}/usr/lib/systemd/system/oauth2-proxy.service"
}
