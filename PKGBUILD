# Maintainer: Pepe44DEV <pascal.priessnitz@pepe44.dev>

pkgname=pulsegate-gui-git
pkgver=0.r1.gdcafc1e
pkgrel=1
pkgdesc="Graphical desktop SSH manager for PulseGate"
arch=('x86_64')
url="https://git.pepe44.dev/Pepe44DEV/PulseGate-GUI"
license=('custom')
depends=('openssh' 'python' 'python-yaml' 'tk')
makedepends=('git')
optdepends=(
  'kitty: preferred terminal emulator for SSH sessions'
  'alacritty: alternative terminal emulator for SSH sessions'
  'konsole: alternative terminal emulator for SSH sessions'
  'gnome-terminal: alternative terminal emulator for SSH sessions'
  'xfce4-terminal: alternative terminal emulator for SSH sessions'
  'xterm: fallback terminal emulator for SSH sessions'
  'go: run the optional local web UI'
)
provides=('pulsegate-gui')
conflicts=('pulsegate-gui')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "PulseGate-GUI"
  printf "0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "PulseGate-GUI"

  install -Dm755 desktop/pulsegate_desktop.py "${pkgdir}/usr/share/pulsegate-gui/desktop/pulsegate_desktop.py"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/pulsegate-gui/README.md"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/pulsegate-desktop" <<'EOF'
#!/usr/bin/env sh
exec python3 /usr/share/pulsegate-gui/desktop/pulsegate_desktop.py "$@"
EOF

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/pulsegate-desktop.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=PulseGate Desktop
Comment=Graphical SSH manager for PulseGate
Exec=pulsegate-desktop
Terminal=false
Categories=Network;RemoteAccess;
Keywords=ssh;server;terminal;homelab;
EOF
}
