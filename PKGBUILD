# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=suricata-exporter
pkgver=0.5.0
pkgrel=1
pkgdesc="A Prometheus Exporter for Suricata using the unix socket"
arch=('x86_64' 'aarch64')
url="https://github.com/corelight/suricata_exporter"
license=('BSD-3-Clause')
# The exporter runs as the 'suricata' user/group created by the suricata package.
depends=('suricata')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/corelight/suricata_exporter/archive/refs/tags/v${pkgver}.tar.gz"
        "suricata_exporter.service")
sha256sums=('acb43e6cc199efd937527b5bfb701e1470bde576ea92c98d7ee203a0b94ca158'
            '8390f2d280b47dcd41e862daa7a83c92416e0e9c22d3a7efee4036cf790b9b54')

build() {
  cd "${srcdir}/suricata_exporter-${pkgver}"
  export CGO_ENABLED=0
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  go build \
    -ldflags "-s -w -X main.version=v${pkgver}" \
    -o suricata_exporter \
    .
}

check() {
  cd "${srcdir}/suricata_exporter-${pkgver}"
  # TestDump800AFPacket fails when run as part of the full suite due to a
  # Prometheus global registry leak between tests (passes in isolation).
  # Skip it; upstream bug, not a packaging issue.
  go test ./... -skip TestDump800AFPacket
}

package() {
  cd "${srcdir}/suricata_exporter-${pkgver}"

  install -Dm755 suricata_exporter \
    "${pkgdir}/usr/bin/suricata_exporter"

  install -Dm644 "${srcdir}/suricata_exporter.service" \
    "${pkgdir}/usr/lib/systemd/system/suricata_exporter.service"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
