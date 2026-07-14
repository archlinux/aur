# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=mqtt-alive-daemon
pkgver=0.4.1
pkgrel=1
pkgdesc="Reports machine aliveness and custom command checks to Home Assistant via MQTT"
arch=('x86_64' 'aarch64')
url="https://github.com/crmne/mqtt-alive-daemon"
license=('MIT')
install="${pkgname}.install"
depends=('bash')
makedepends=('go')
optdepends=('systemd: run as a system service')
conflicts=('mqtt-alive-daemon-git')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('468bc2ab301f5e132deb65d4d02090f232272af68507be7c0fdeb0cb6f707f69')

build() {
  cd "${pkgname}-${pkgver}"

  # cgo so .local (mDNS) broker names resolve through glibc NSS
  CGO_ENABLED=1 go build -trimpath \
    -ldflags "-s -w -X github.com/crmne/mqtt-alive-daemon/pkg/mqttalive.Version=${pkgver}" \
    -o mqtt-alive-daemon .
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "mqtt-alive-daemon" "${pkgdir}/usr/bin/mqtt-alive-daemon"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "config.yaml.example" "${pkgdir}/etc/mqtt-alive-daemon/config.yaml.example"
  install -Dm644 "packaging/systemd/mqtt-alive-daemon.service" "${pkgdir}/usr/lib/systemd/system/mqtt-alive-daemon.service"
}
