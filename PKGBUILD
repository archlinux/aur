# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=go-hass-agent
pkgver=14.14.0
pkgrel=1
_commit=c1b3e5b
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
b2sums=('c264f813335a33f6a437c233edc4e021f03ae86a111b598de7f5e26dc9f31af4bd2473a8c3c83fa2f3fcfe7da07962408a9b31bcef8454acf781626d706c95d3')

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
