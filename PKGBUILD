# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=prometheus-php-fpm-exporter
_commit=17599df3d12dc522fee97f85fcf37be70295637a
pkgver=2.0.3
pkgrel=1
pkgdesc="Prometheus exporter for PHP-FPM"
arch=('x86_64')
url="https://github.com/hipages/php-fpm_exporter"
license=('Apache')
depends=('glibc')
makedepends=('go-pie')
source=("php-fpm_exporter-${pkgver}.tar.gz::https://github.com/hipages/php-fpm_exporter/archive/v${pkgver}.tar.gz"
        "prometheus-php-fpm-exporter.service")
sha512sums=('45ef89e8dd96abab14e10cfad4c6ed49a3b585fb96be48ae4853c13d62b6a26ad96252f4b41d6dcfba8b3902064eae0c0a6685d4a7d1abccb8e76ee0d4d62f0e'
            '1b7a4128c08ffa5f2b1c4a20225c97a238e221fd9f77c454eaa093fecdede9e493d2db2dd4948f0b071995b4db2eea2e69ec254aa2d5ed35e722200dc75b2b37')

prepare() {
  cd "${srcdir}/php-fpm_exporter-${pkgver}"

  go mod vendor
}

build() {
  cd "${srcdir}/php-fpm_exporter-${pkgver}"

  go build \
    -mod=vendor \
    -trimpath \
    -ldflags "-extldflags ${LDFLAGS}
      -X main.version=${pkgver}
      -X main.commit=${_commit}
      -X main.date=$(date -d@"${SOURCE_DATE_EPOCH}" -u +%FT%TZ)" \
    .
}

package() {
  cd "${srcdir}/php-fpm_exporter-${pkgver}"

  install -Dm755 "php-fpm_exporter" "${pkgdir}/usr/bin/prometheus-php-fpm-exporter"
  install -Dm644 "${srcdir}/prometheus-php-fpm-exporter.service" \
    "${pkgdir}/usr/lib/systemd/system/prometheus-php-fpm-exporter.service"
}
