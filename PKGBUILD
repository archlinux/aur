# Maintainer: Sean Fournier <sean@wattfource.com>
pkgname=wizado
pkgver=1.0.1
pkgrel=1
pkgdesc="Steam gaming mode launcher for Hyprland with gamescope integration"
arch=('x86_64')
url="https://github.com/wattfource/wizado-omarchy"
license=('MIT')
makedepends=('go>=1.21')
depends=('glibc')
optdepends=(
  'steam: Steam client (required for gaming)'
  'gamescope: Gaming compositor (required for gaming)'
  'gamemode: CPU/GPU performance optimizations'
  'mangohud: Performance overlay'
  'hyprland: Hyprland compositor'
  'gum: Interactive TUI menu scripts'
  'jq: JSON parsing for menu scripts'
)
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wattfource/wizado-omarchy/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e032d56ea9b639de15d33bcc11ea3e6e8270a7171f98e4594a49d052dd1c8d74')

build() {
  cd "wizado-omarchy-${pkgver}"
  
  # Set Go build flags for smaller, stripped binary
  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath"
  
  go build -ldflags="-s -w -X main.Version=${pkgver}" \
    -o wizado ./cmd/wizado
}

package() {
  cd "wizado-omarchy-${pkgver}"
  
  # Install the main binary
  install -Dm755 wizado "${pkgdir}/usr/bin/wizado"
  
  # Install helper scripts
  install -Dm755 scripts/bin/wizado-menu "${pkgdir}/usr/bin/wizado-menu"
  install -Dm755 scripts/bin/wizado-menu-float "${pkgdir}/usr/bin/wizado-menu-float"
  
  # Install default config
  install -Dm644 scripts/config/default.conf "${pkgdir}/usr/share/${pkgname}/default.conf"
  
  # Install waybar assets
  install -Dm644 scripts/config/waybar-module.jsonc "${pkgdir}/usr/share/${pkgname}/waybar-module.jsonc"
  install -Dm644 scripts/config/waybar-style.css "${pkgdir}/usr/share/${pkgname}/waybar-style.css"
}
