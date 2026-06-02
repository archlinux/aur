# Maintainer: Daniel Vigh <vighd@digital.co.hu>

pkgname=river-bar
pkgver=1.0.0
pkgrel=1
pkgdesc='A small status bar for the River Wayland compositor'
arch=('x86_64')
url='https://github.com/vighd/river-bar'
license=('MIT')
depends=('fontconfig' 'freetype2' 'river')
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
sha256sums=('5b5cd738c667483ed8303147eb2d22c92accee26504554519a0665f2b0afde05')

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
