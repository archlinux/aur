# Maintainer: loshdk <kovaleksd@gmail.com>

pkgname=omen-hub
pkgver=1.0.0
pkgrel=3
pkgdesc="Modern GUI for HP OMEN gaming laptops on Linux — GPU switching, fans, RGB, thermals"
arch=('x86_64' 'aarch64')
url="https://github.com/NoFilterA1/omen-hub"
license=('GPL3')
depends=('python' 'python-pyqt6' 'python-tomlkit')
optdepends=('supergfxctl: GPU mode switching (Hybrid/Integrated)')
makedepends=('git')
source=("${pkgname}::git+https://github.com/NoFilterA1/${pkgname}.git#branch=main")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}"

  # Install main app to /opt
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -r . "${pkgdir}/opt/${pkgname}/"

  # Remove git files from package
  rm -rf "${pkgdir}/opt/${pkgname}/.git"
  rm -rf "${pkgdir}/opt/${pkgname}/.gitignore"

  # Create symlink for easy execution
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${pkgname}" << 'EOF'
#!/bin/sh
exec /usr/bin/python /opt/omen-hub/gui/app.py "$@"
EOF
  chmod +x "${pkgdir}/usr/bin/${pkgname}"

  # Install setup helper
  install -Dm755 "${srcdir}/${pkgname}/setup.sh" "${pkgdir}/usr/bin/${pkgname}-setup"

  # Install icon
  install -Dm644 "${srcdir}/${pkgname}/images/logo.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  # Install .desktop file for app menu
  install -Dm644 "${srcdir}/${pkgname}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

post_install() {
  cat << 'EOF'

=== OMEN Hub installed ===

To enable GPU switching, run ONE of:

Option 1 (recommended for tiling WMs):
  sudo visudo
  # Add line:  %wheel ALL=(ALL) NOPASSWD: /usr/bin/supergfxctl

Option 2 (standard, requires polkit auth agent):
  sudo pacman -S polkit-qt5 polkit-kde-agent-1
  # Then add to your WM config: exec polkit-kde-agent-1

To enable fan control:
  sudo pacman -S omenctl-git
  sudo systemctl enable --now omenctl

For more details: omen-hub --help (after running once)
                or see: https://github.com/NoFilterA1/omen-hub

EOF
}

