# Maintainer: Cornelius Hoffmann <coding@volucra.de>
pkgname=prometheus-opnsense-exporter
pkgver=0.0.11
pkgrel=1

pkgdesc="OPNsense Exporter for Prometheus"
url="https://github.com/AthennaMind/opnsense-exporter"
arch=('x86_64')
license=('Apache-2.0')

backup=('etc/conf.d/prometheus-opnsense-exporter.opnsense')

depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AthennaMind/opnsense-exporter/archive/refs/tags/v$pkgver.tar.gz"
        "prometheus-opnsense-exporter.conf"
        "prometheus-opnsense-exporter@.service")
sha256sums=('72a5a0bf2ceca308b5a587b68cf16964f6e01d2dea5d829cefa29fa14424b26b'
            'c5b527fe6a6a8c9aec49a4a84093fa29c978cbce8378dd9dd16cf4223adb8683'
            '20b4e2f14955549f29f53eff5b58a3d8d5613b93cce27ee1e6ef7354d6da06d1')

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
  install -Dm644 prometheus-opnsense-exporter.conf "$pkgdir"/etc/conf.d/prometheus-opnsense-exporter.opnsense
  install -Dm644 prometheus-opnsense-exporter@.service "$pkgdir"/usr/lib/systemd/system/prometheus-opnsense-exporter@.service

  cd "opnsense-exporter-$pkgver"
  install -Dm755 opnsense-exporter "$pkgdir/usr/bin/prometheus-opnsense-exporter"
}
