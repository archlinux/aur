# Maintainer: jtaw5649
pkgname=hyprspaces-tools
pkgver=2.1.0
pkgrel=1
pkgdesc="Helper CLI and config automation for the hyprspaces HyprPM plugin"
arch=('any')
url='https://github.com/jtaw5649/hyprspaces'
license=('MIT')
depends=('bash' 'python' 'hyprland')
conflicts=('hyprspaces<2.0.0')
optdepends=(
  'waybar-hyprspaces-fork-bin: automated hyprspaces Waybar fork'
  'waybar: stock Waybar restore and restart helpers'
  'socat: stock Waybar custom module helper'
  'sunshine: optional Sunshine headless helper'
)
install=hyprspaces-tools.install
_commit='48692ce58dd733da711bfa7cbcc3b64c8ec69c7c'
source=("hyprspaces-${pkgver}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('2077f52d6aa022bc30842da6b0f125da057f289247551a3ea539f46b3702972a')

package() {
  cd "${srcdir}/hyprspaces-${_commit}"

  local script
  for script in \
    hyprspaces \
    hyprspaces-waybar-custom \
    hyprspaces-install \
    hyprspaces-uninstall \
    hyprspaces-doctor \
    hyprspaces-sunshine-headless \
    hyprspaces-waybar-refresh \
    hyprspaces-waybar-shim \
    hyprspaces-waybar-restart \
    hyprspaces-waybar-use-fork \
    hyprspaces-waybar-use-stock \
    hyprspaces_doctor.py \
    hyprspaces_sunshine_headless.py \
    waybar_jsonc.py; do
    install -Dm755 "scripts/${script}" "${pkgdir}/usr/lib/hyprspaces/scripts/${script}"
  done

  install -Dm644 scripts/hyprspaces-lib "${pkgdir}/usr/lib/hyprspaces/scripts/hyprspaces-lib"

  local wrapper
  for wrapper in hyprspaces hyprspaces-waybar-custom; do
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${wrapper}" <<EOF
#!/usr/bin/env bash
set -euo pipefail
exec /usr/lib/hyprspaces/scripts/${wrapper} "\$@"
EOF
  done

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

  local template
  for template in \
    hyprspaces-plugin-wiring.conf.in \
    sunshine-headless.conf.in \
    sunshine.conf.in \
    sunshine-apps.json \
    sunshine-state.json.in \
    sunshine-headless.service.in \
    sunshine-autoswitch.service.in; do
    install -Dm644 "templates/${template}" "${pkgdir}/usr/share/hyprspaces/templates/${template}"
  done
}
