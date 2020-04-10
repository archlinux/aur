# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=prometheus-mysqld-exporter
pkgver=0.12.1
pkgrel=1
pkgdesc="Prometheus exporter for MySQL server metrics"
arch=('x86_64')
url="https://github.com/prometheus/mysqld_exporter"
license=('Apache')
depends=('glibc')
makedepends=('go-pie')
backup=('etc/conf.d/prometheus-mysqld-exporter')
source=("mysql_exporter-${pkgver}.tar.gz::https://github.com/prometheus/mysqld_exporter/archive/v${pkgver}.tar.gz"
        "prometheus-mysqld-exporter.service"
        "prometheus-mysqld-exporter.conf")
sha512sums=('a655a9ad4b5bc6e7840df68bee934d55485d3a04a7dc8186c8f9d224eb33b0e1d98de3db78a0c7d92f9b3d6ca06ead2d609cf2cfa99e584635f0339984e60629'
            '845716ce251bc29d8059f113e7451030ac1fa592e9b8f4f6daa39d2326fe451f66cfa9f5fe8acc7ece6b875ed811ea4818df04d70269ecc76a560dfdfadd1fad'
            'c13a99a42e5a28e2be1287c337aa0f351dc8ffdbafb903e51a360d00aecf1d49d2b28b73e3741cdf681cb18c33546ae2088a8dab8bc4908b5c5ef008500b40fb')

build() {
  cd "${srcdir}/mysqld_exporter-${pkgver}"

  go build \
    -mod=vendor \
    -trimpath \
    -ldflags "-extldflags ${LDFLAGS}
      -X github.com/prometheus/common/version.Version=${pkgver} \
      -X github.com/prometheus/common/version.Revision=non-git \
      -X github.com/prometheus/common/version.Branch=non-git \
      -X github.com/prometheus/common/version.BuildUser=someone@builder \
      -X github.com/prometheus/common/version.BuildDate=$(date -d@"${SOURCE_DATE_EPOCH}" +%Y%m%d-%T)" \
    .
}

package() {
  cd "${srcdir}/mysqld_exporter-${pkgver}"

  install -Dm755 "mysqld_exporter" "${pkgdir}/usr/bin/prometheus-mysqld-exporter"
  install -Dm644 "${srcdir}/prometheus-mysqld-exporter.service" \
    "${pkgdir}/usr/lib/systemd/system/prometheus-mysqld-exporter.service"
  install -Dm644 "${srcdir}/prometheus-mysqld-exporter.conf" \
    "${pkgdir}/etc/conf.d/prometheus-mysqld-exporter"
}
