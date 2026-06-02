# Maintainer: Daniel Vigh <vighd@digital.co.hu>

pkgname=river-bar
pkgver=1.0.1
pkgrel=1
pkgdesc='A small status bar for the River Wayland compositor'
arch=('x86_64')
url='https://github.com/vighd/river-bar'
license=('MIT')
# river-classic is the legacy River (zriver_status_manager_v1 / zriver_control_v1)
# this bar talks to. The rewritten 'river' 0.4+ drops those protocols and
# conflicts with river-classic, so it is NOT a valid dependency here.
depends=('fontconfig' 'freetype2' 'river-classic')
makedepends=('go')
optdepends=(
  'ttf-nerd-fonts-symbols: Nerd Font icon glyphs for the module icons (clock, battery, ...)'
  'ttf-jetbrains-mono: a monospace text font (or any other TTF/OTF face)'
  'wireplumber: audio module (wpctl)'
  'libpulse: audio module live updates (pactl subscribe)'
  'bluez-utils: bluetooth module (bluetoothctl)'
  'pacman-contrib: pacman module (checkupdates)'
  'iputils: network module connectivity check (ping)'
  'wireless_tools: network module Wi-Fi SSID (iwgetid)'
  'iwd: network module Wi-Fi SSID alternative (iwctl)'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vighd/river-bar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('99ba3436d964bc9e2cd3615646fc1b0c83344a3bfe77f54326142c8a97dd16a8')

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_ENABLED=1
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build -o "${pkgname}" \
    -ldflags "-linkmode=external -compressdwarf=false -X main.version=v${pkgver}" \
    ./cmd/river-bar
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 config.sample.toml \
    "${pkgdir}/usr/share/doc/${pkgname}/config.sample.toml"

  # Ship the showcase example configs and base16 schemes referenced by the
  # README so they're available offline under /usr/share/doc.
  local f
  for f in examples/*.toml; do
    install -Dm644 "$f" "${pkgdir}/usr/share/doc/${pkgname}/$f"
  done
  for f in examples/themes/*.yaml; do
    install -Dm644 "$f" "${pkgdir}/usr/share/doc/${pkgname}/$f"
  done
}
