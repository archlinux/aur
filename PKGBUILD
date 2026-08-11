# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=go-hass-agent
pkgver=14.15.1
pkgrel=1
_commit=55fafa8
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
b2sums=('7376c6a685ef3b746c6aa54085b286e2fe9e06f439ba4950bcdcddcd9a38c98780173a4efa487dc4230e60922fb58a663cf2dcf5af9c1691cb9bba9f3f231492')

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
