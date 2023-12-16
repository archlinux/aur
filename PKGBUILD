# Maintainer: Lucas Mindello <lucas at mindello dot com dot br>

pkgname=homeassistant-osagent
pkgver=1.6.0
pkgrel=1
pkgdesc="Home Assistant OS Agent"
arch=('any')
url="https://github.com/home-assistant/os-agent"
license=('APACHE')
depends=('udisks2')
makedepends=(
    'go'
    'git'
)
install=INSTALL
_tag=dc9ccd6d848e4de737ea9c579fc6d8846f9c89c8 # git rev-parse "$pkgver"
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