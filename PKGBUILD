# Maintainer: Daniel Vigh <vigh_dani@protonmail.ch>

pkgname=wlbar
pkgver=1.5.1
pkgrel=1
pkgdesc='A small status bar for the River and niri Wayland compositors'
arch=('x86_64')
url='https://codeberg.org/vighd/wlbar'
license=('MIT')
# No compositor package is required to build or run: the bar renders nothing
# until it finds a supported compositor's interface at runtime, so River and
# niri support are optdepends rather than hard depends.
depends=('fontconfig' 'freetype2')
makedepends=('go')
optdepends=(
  'river-classic: River compositor support — rivertags/title modules (zriver_status_manager_v1; NOT the incompatible river 0.4+)'
  'niri: niri compositor support — niriworkspaces/nirititle modules'
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6f7b4af7908f14139937e1eda26f760ec28902027c646c343ae62910ba12ac2d')

build() {
  cd "${pkgname}"

  export CGO_ENABLED=1
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build -o "${pkgname}" \
    -ldflags "-linkmode=external -compressdwarf=false -X main.version=v${pkgver}" \
    ./cmd/wlbar
}

package() {
  cd "${pkgname}"

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
