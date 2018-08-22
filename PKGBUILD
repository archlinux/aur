# Maintainer: Valentin Elovskiy <evvsoft@gmail.com>

pkgname=prometheus-redis-exporter
pkgver=0.21.1
pkgrel=1
pkgdesc="Prometheus exporter for machine metrics"
arch=('x86_64' 'i686')
url="https://github.com/prometheus/node_exporter"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("https://github.com/oliver006/redis_exporter/archive/v${pkgver}.tar.gz"
        "prometheus-redis-exporter.service")
sha256sums=('ad1e0ba91617e15233c22e016369014d6f0c9bdd26d555d8a74eee756d0cad1c'
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
