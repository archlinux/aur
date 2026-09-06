# Maintainer: jtaw5649
pkgname=hyprspaces-tools
pkgver=2.3.1
pkgrel=2
pkgdesc="Helper CLI and config automation for the hyprspaces HyprPM plugin"
arch=('any')
url='https://gitlab.com/jtaw5649/Hyprspaces'
license=('BSD-3-Clause')
depends=('bash' 'python' 'hyprland')
conflicts=('hyprspaces<2.0.0')
optdepends=(
  'quickshell: Quickshell workspace indicator assets'
  'sunshine: optional Sunshine virtual display helper'
)
install=hyprspaces-tools.install
source=("${url}/-/releases/v${pkgver}/downloads/hyprspaces-${pkgver}.tar.gz")
sha256sums=('33c76b8010ff855c77553449ce75da4425c4d01b8a64928377329ebe46f3979c')

package() {
  cd "${srcdir}/hyprspaces"

  local scriptdir="${pkgdir}/usr/lib/hyprspaces/scripts"
  local sharedir="${pkgdir}/usr/share/hyprspaces"

  local script
  for script in \
    hyprspaces \
    hyprspaces-install \
    hyprspaces-uninstall \
    hyprspaces-doctor \
    hyprspaces-sunshine \
    hyprspaces-quickshell-install \
    hyprspaces-quickshell-restore \
    hyprspaces-quickshell-refresh \
    hyprspaces-omarchy-install \
    hyprspaces-omarchy-restore \
    hyprspaces-omarchy-refresh \
    hyprspaces_doctor.py \
    omarchy_shell_json.py; do
    install -Dm755 "scripts/${script}" "${scriptdir}/${script}"
  done

  install -Dm644 scripts/hyprspaces-lib "${scriptdir}/hyprspaces-lib"
  install -Dm644 scripts/hyprspaces_doctor_omarchy.py "${scriptdir}/hyprspaces_doctor_omarchy.py"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/hyprspaces" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
exec /usr/lib/hyprspaces/scripts/hyprspaces "$@"
EOF

  local config
  for config in \
    hyprspaces-plugin.lua \
    hyprspaces-plugin-settings.lua \
    hyprspaces-bindings.lua; do
    install -Dm644 "config/${config}" "${sharedir}/config/${config}"
  done

  install -Dm644 templates/sunshine-watch.service.in "${sharedir}/templates/sunshine-watch.service.in"

  install -Dm644 quickshell/hyprspaces/HyprspacesService.qml "${sharedir}/quickshell/hyprspaces/HyprspacesService.qml"
  install -Dm644 quickshell/hyprspaces/Workspaces.qml "${sharedir}/quickshell/hyprspaces/Workspaces.qml"

  install -Dm644 quickshell/hyprspaces/HyprspacesService.qml "${sharedir}/omarchy-shell/hyprspaces/HyprspacesService.qml"
  install -Dm644 omarchy-shell/hyprspaces/Workspaces.qml "${sharedir}/omarchy-shell/hyprspaces/Workspaces.qml"
  install -Dm644 omarchy-shell/hyprspaces/manifest.json "${sharedir}/omarchy-shell/hyprspaces/manifest.json"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
