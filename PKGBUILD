# Maintainer: Valentin Elovskiy <evvsoft@gmail.com>

pkgname=prometheus-redis-exporter
pkgver=0.25.0
pkgrel=1
pkgdesc="Prometheus exporter for machine metrics"
arch=('x86_64' 'i686')
url="https://github.com/prometheus/node_exporter"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("https://github.com/oliver006/redis_exporter/archive/v${pkgver}.tar.gz"
        "prometheus-redis-exporter.service")
sha256sums=('2567e1f2a2ba1d4222f0c4dc4e2ba1e773427208f98e32ed33d067f38dd93ac6'
            'f48565cf25f3ca8b120b5ad0cef9689d96d1fec22a7dd82e8de78ec23de3dad1')

prepare() {
  cd "${srcdir}/redis_exporter-${pkgver}"

  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/github.com/oliver006"
  ln -snf "${srcdir}/redis_exporter-${pkgver}" "${GOPATH}/src/github.com/oliver006/redis_exporter"
}

build() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/oliver006/redis_exporter"

  go build
}

package() {
  cd "${srcdir}/redis_exporter-${pkgver}"

  install -Dm755 "redis_exporter" "${pkgdir}/usr/bin/prometheus_redis_exporter"
  install -Dm644 "${srcdir}/prometheus-redis-exporter.service" \
    "${pkgdir}/usr/lib/systemd/system/prometheus-redis-exporter.service"
}
