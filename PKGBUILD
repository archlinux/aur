# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=go-hass-agent
pkgver=14.14.1
pkgrel=1
_commit=5cfb543
pkgdesc="A Home Assistant, native app for desktop/laptop devices."
arch=('x86_64')
url="https://github.com/joshuar/go-hass-agent"
license=('MIT')
depends=('dbus' 'libcap')
makedepends=('git' 'go')
optdepends=('fwupd: firmware security probe'
            'geoclue: location tracker'
            'networkmanager: network connections and activity monitoring'
            'pipewire: volume control and cam/mic monitoring'
            'power-profiles-daemon: power state monitoring'
            'upower: battery sensors'
            'xdg-desktop-portal: running apps list and desktop settings')
source=("go-hass-agent::git+${url}.git#commit=${_commit}?signed")
validpgpkeys=('968479A1AFF927E37D1A566BB5690EEEBB952194')
b2sums=('3cfae3c7a82a921d23e4c3a64e09699e839710d7be3d08e660fe8b5cf6aa66714bd80b888a147bb45bde256580558101209dad216a9f9c31fdce8912d32971c5')

build() {
  cd "${pkgname}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  install -D -m755 "${pkgname}"/go-hass-agent "${pkgdir}/usr/bin/go-hass-agent"
  install -D -m644 "${pkgname}"/README.md "${pkgdir}/usr/share/doc/go-hass-agent/README.md"
  install -D -m644 "${pkgname}"/LICENSE "${pkgdir}/usr/share/licenses/go-hass-agent/LICENSE"
  install -D -m644 "${pkgname}"/assets/go-hass-agent.service "${pkgdir}/usr/lib/systemd/user/go-hass-agent.service"
  install -D -m644 "${pkgname}"/assets/start-go-hass-agent.desktop "${pkgdir}/usr/share/applications/start-go-hass-agent.desktop"
}
