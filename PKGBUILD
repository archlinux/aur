# Maintainer: Cornelius Hoffmann <coding@volucra.de>
pkgname=prometheus-opnsense-exporter
pkgver=0.0.7
pkgrel=2

pkgdesc="OPNsense Exporter for Prometheus"
url="https://github.com/AthennaMind/opnsense-exporter"
arch=('x86_64')
license=('Apache-2.0')

backup=('etc/conf.d/prometheus-opnsense-exporter')

depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AthennaMind/opnsense-exporter/archive/refs/tags/v$pkgver.tar.gz"
        "prometheus-opnsense-exporter.conf"
        "prometheus-opnsense-exporter.service")
sha256sums=('268ef6feef2b7566e4266e3de412205c3e2ca57205e42babc704d59cbb67463a'
            '712ea5d15f1ef93d374c83b6c844482b896bb644cff82af4ba06c67935345a9a'
            'd3047db322a9cb22e0b031a31096ad256006de606e67ff4e96b8f3063f229607')

build() {
  cd "opnsense-exporter-$pkgver"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    .
}

check() {
  cd "opnsense-exporter-$pkgver"
  go test ./opnsense
  go test ./internal/collector
  go test ./internal/options
}

package() {
  install -Dm644 prometheus-opnsense-exporter.conf "$pkgdir"/etc/conf.d/prometheus-opnsense-exporter
  install -Dm644 prometheus-opnsense-exporter.service "$pkgdir"/usr/lib/systemd/system/prometheus-opnsense-exporter.service

  cd "opnsense-exporter-$pkgver"
  install -Dm755 opnsense-exporter "$pkgdir/usr/bin/prometheus-opnsense-exporter"
}
