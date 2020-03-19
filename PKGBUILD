# Maintainer: Kevin Rauwolf <sweetpea-aur@tentacle.net>
pkgname=prometheus-statsd-exporter
pkgver=0.15.0
pkgrel=2
pkgdesc="StatsD to Prometheus metrics exporter"
arch=('x86_64')
url="https://github.com/prometheus/statsd_exporter"
license=('Apache')
depends=(glibc)
makedepends=(go-pie git)
source=($pkgname-$pkgver.tar.gz::https://github.com/prometheus/statsd_exporter/archive/v${pkgver}.tar.gz prometheus-statsd-exporter.service)
sha512sums=('09d76a9329f9b8c208cfb30f43303542c98bc64cdae04fb7db11d766c24ea64a2370a63f82b00db5b23f2f7e737b95a3dfdd2bdf186a6b18d0fb1a6f7585513f'
            'a4ceb1291b358140082ac044c5c5f38dc24bdcb60e94fb2c3a41c5c01a7d8e4d40cac01b653e7f8c146b91db0348b2d350a7523144090a3e6c92c5f56975c171')

check() {
  cd statsd_exporter-$pkgver
  go test ./...
}

build() {
  cd statsd_exporter-$pkgver
  go build \
    -mod=vendor \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS} \
      -X github.com/prometheus/common/version.Version=$pkgver \
      -X github.com/prometheus/common/version.Revision=$pkgver \
      -X github.com/prometheus/common/version.Branch=tarball \
      -X github.com/prometheus/common/version.BuildUser=someone@builder \
      -X github.com/prometheus/common/version.BuildDate=$(date -d@"$SOURCE_DATE_EPOCH" +%Y%m%d-%H:%M:%S)" \
    .
}

package() {
  install -Dm644 prometheus-statsd-exporter.service "$pkgdir"/usr/lib/systemd/system/prometheus-statsd-exporter.service
  cd statsd_exporter-$pkgver
  install -Dm755 statsd_exporter "$pkgdir"/usr/bin/prometheus-statsd-exporter
}
