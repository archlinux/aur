# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=suricata-exporter
pkgver=0.6.0
pkgrel=1
pkgdesc="A Prometheus Exporter for Suricata using the unix socket"
arch=('x86_64' 'aarch64')
url="https://github.com/corelight/suricata_exporter"
license=('BSD-3-Clause')
# The exporter runs as the 'suricata' user/group created by the suricata package.
depends=('glibc')
optdepends=('suricata: IDS engine to monitor')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/corelight/suricata_exporter/archive/refs/tags/v${pkgver}.tar.gz"
        "suricata_exporter.service")
sha256sums=('304b43d61051db6f9aa8f58d21ffa65fc78a34ae5f63ff4efc60b2cb71e0f04c'
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
