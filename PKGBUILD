# Maintainer: Firebleudark <fire@firebleudark.xyz>
pkgname=autoinstallpackages
pkgver=5.0.0
pkgrel=1
pkgdesc="Simple Arch post-install tool (CLI + optional Tk GUI)"
arch=('any')
url="https://github.com/Firebleudark/Autoinstallpackages"
license=('GPL3')
depends=('bash')
optdepends=(
  'sudo: required for system changes'
  'python: GUI wrapper runtime'
  'tk: Tkinter for the GUI'
  'pciutils: lspci used in checks'
  'curl: network checks/downloads'
  'git: AUR helper bootstrap'
  'flatpak: optional app source'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Firebleudark/Autoinstallpackages/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('49b3cceb3ab579aaf27502bb04130f444e814008969f89104717fbd06c182bab')

package() {
  local srcdir_name="Autoinstallpackages-$pkgver"

  # Install project sources required by CLI/GUI
  install -Dm755 "$srcdir/$srcdir_name/v5/simple-postinstall.sh" \
    "$pkgdir/usr/share/autoinstallpackages/v5/simple-postinstall.sh"
  install -Dm755 "$srcdir/$srcdir_name/gui/app.py" \
    "$pkgdir/usr/share/autoinstallpackages/gui/app.py"

  # CLI wrapper
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/autoinstallpackages" << 'EOF'
#!/usr/bin/env bash
set -euo pipefail
exec /usr/share/autoinstallpackages/v5/simple-postinstall.sh "$@"
EOF

  # GUI wrapper
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/autoinstallpackages-gui" << 'EOF'
#!/usr/bin/env bash
set -euo pipefail
exec /usr/bin/env python3 /usr/share/autoinstallpackages/gui/app.py "$@"
EOF

  # Desktop entry
  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/applications/autoinstallpackages.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=Autoinstallpackages (Arch Post-Install)
Comment=Run the Arch post-install helper
Exec=autoinstallpackages-gui
Icon=utilities-system-monitor
Terminal=false
Categories=System;Settings;
EOF

  # License
  install -Dm644 "$srcdir/$srcdir_name/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
