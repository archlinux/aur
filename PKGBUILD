# Maintainer: Lucas Mindello <lucas at mindello dot com dot br>

pkgname=homeassistant-osagent
pkgver=1.4.0
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
_tag=cedd66e610a5e84a6d8bb99d8aefc50df74862a1 # git rev-parse "$pkgver"
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