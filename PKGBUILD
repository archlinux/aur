# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=mqtt-alive-daemon-git
pkgver=r20.f324ed8
pkgrel=1
pkgdesc="Reports machine aliveness and custom command checks to Home Assistant via MQTT"
arch=('x86_64' 'aarch64')
url="https://github.com/crmne/mqtt-alive-daemon"
license=('MIT')
install="${pkgname}.install"
depends=('bash')
makedepends=('git' 'go')
optdepends=('systemd: run as a system service')
provides=('mqtt-alive-daemon')
conflicts=('mqtt-alive-daemon')
options=('!debug')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"

  CGO_ENABLED=0 go build -trimpath \
    -ldflags "-s -w -X github.com/crmne/mqtt-alive-daemon/pkg/mqttalive.Version=${pkgver}" \
    -o mqtt-alive-daemon .
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm755 "mqtt-alive-daemon" "${pkgdir}/usr/bin/mqtt-alive-daemon"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "config.yaml.example" "${pkgdir}/etc/mqtt-alive-daemon/config.yaml.example"
  install -Dm644 "packaging/systemd/mqtt-alive-daemon.service" "${pkgdir}/usr/lib/systemd/system/mqtt-alive-daemon.service"
}
