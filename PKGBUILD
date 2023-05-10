# Maintainer: Lucas Mindello <lucas at mindello dot com dot br>

pkgname=homeassistant-osagent
pkgver=1.5.1
pkgrel=1
pkgdesc="Home Assistant OS Agent"
arch=('x86_64')
url="https://github.com/home-assistant/os-agent"
license=('APACHE')
depends=('udisks2')
makedepends=(
    'go'
    'git'
)
install=INSTALL
_tag=2d773f5a9509513305432982c9e9928e68350f14 # git rev-parse "$pkgver"
source=("git+https://github.com/home-assistant/os-agent.git#tag=${_tag}")
md5sums=('SKIP')

build() {
    cd "${srcdir}/os-agent"
    go build -buildmode=pie -ldflags "-linkmode=external -extldflags=$LDFLAGS -X main.version=${pkgver}"
}

package() {
    install -Dm755 "${srcdir}/os-agent/os-agent" "${pkgdir}/usr/bin/os-agent"
    install -Dm644 "${srcdir}/os-agent/contrib/haos-agent.service" "${pkgdir}/usr/lib/systemd/system/haos-agent.service"
    install -Dm644 "${srcdir}/os-agent/contrib/io.hass.conf" "${pkgdir}/etc/dbus-1/system.d/io.hass.conf"
}