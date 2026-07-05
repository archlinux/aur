# Maintainer: jtaw5649
pkgname=hyprspaces-tools
pkgver=2.2.0
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
_commit='8b7c25bb24caecacbb71324186d019e00dd69f20'
source=("hyprspaces-${pkgver}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('34be64bcf6601f7275d6af69bc91b631f89c4fc9027d26a968e3f2e9fb301a4b')

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
