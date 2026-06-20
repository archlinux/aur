# Maintainer: jtaw5649
pkgname=hyprspaces-tools
pkgver=2.0.0
pkgrel=1
pkgdesc="Helper CLI and config automation for the hyprspaces HyprPM plugin"
arch=('any')
url='https://github.com/jtaw5649/hyprspaces'
license=('MIT')
depends=('bash' 'python' 'hyprland')
conflicts=('hyprspaces')
optdepends=(
  'waybar-hyprspaces-fork-bin: automated hyprspaces Waybar fork'
  'waybar: stock Waybar restore and restart helpers'
  'sunshine: optional Sunshine headless helper'
)
install=hyprspaces-tools.install
source=("hyprspaces-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('24ed3424f1e08ff879b632e09776eb3ccbeb19d7515e4a93d1e6015419697eaf')

package() {
  cd "${srcdir}/hyprspaces-${pkgver}"

  local script
  for script in \
    hyprspaces \
    hyprspaces-install \
    hyprspaces-uninstall \
    hyprspaces-doctor \
    hyprspaces-sunshine-headless \
    hyprspaces-waybar-restart \
    hyprspaces-waybar-use-fork \
    hyprspaces-waybar-use-stock \
    waybar_jsonc.py; do
    install -Dm755 "scripts/${script}" "${pkgdir}/usr/lib/hyprspaces/scripts/${script}"
  done

  install -Dm644 scripts/hyprspaces-lib "${pkgdir}/usr/lib/hyprspaces/scripts/hyprspaces-lib"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/hyprspaces" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
exec /usr/lib/hyprspaces/scripts/hyprspaces "$@"
EOF

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  local config
  for config in \
    hyprspaces-plugin.conf \
    hyprspaces-bindings.conf \
    hyprspaces-plugin.lua \
    hyprspaces-plugin-settings.lua \
    hyprspaces-bindings.lua; do
    install -Dm644 "config/${config}" "${pkgdir}/usr/share/hyprspaces/config/${config}"
  done
}
