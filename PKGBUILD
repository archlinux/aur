# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=prometheus-php-fpm-exporter
_commit=c75d2df4037741c1cb146216d7156273d13ff91f
pkgver=2.2.0
pkgrel=1
pkgdesc="Prometheus exporter for PHP-FPM"
arch=('x86_64')
url="https://github.com/hipages/php-fpm_exporter"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("php-fpm_exporter-${pkgver}.tar.gz::https://github.com/hipages/php-fpm_exporter/archive/v${pkgver}.tar.gz"
        "prometheus-php-fpm-exporter.service")
sha512sums=('f2b1dcc3ad9157bc0e7160bb2b96a3e6b93af1b56bc5a04f3eab3fba78975701f7110d7633ed31b4e60a0a3c87c42e3ab9969980f29820c69cbb514134c4c809'
            '1b7a4128c08ffa5f2b1c4a20225c97a238e221fd9f77c454eaa093fecdede9e493d2db2dd4948f0b071995b4db2eea2e69ec254aa2d5ed35e722200dc75b2b37')

build() {
  cd "${srcdir}/php-fpm_exporter-${pkgver}"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external
      -extldflags \"${LDFLAGS}\"
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
