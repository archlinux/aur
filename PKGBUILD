# Maintainer: Vade <72322348+MetanoicArmor@users.noreply.github.com>
# Builds MetanoicArmor/I2PChat TUI from git (not the Qt5 AUR package i2pchat-git).
pkgname=i2pchat-ng-tui-git
pkgver=1.7.1.r0.g0000000
pkgrel=1
pkgdesc="P2P (peer-to-peer) chat client over I2P network (TUI version)"
arch=('any')
url="https://github.com/MetanoicArmor/I2PChat"
license=('AGPL-3.0-or-later')
depends=(
  'python'
  'python-cryptography'
  'python-keyring'
  'python-pillow'
  'python-pynacl'
  'python-pyperclip'
  'python-rich'
  'python-textual'
  'hicolor-icon-theme'
)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
provides=('i2pchat-tui')
conflicts=('i2pchat-tui' 'i2pchat-tui-bin' 'i2pchat-ng-git')
source=("git+${url}.git#branch=python")
sha256sums=('SKIP')

pkgver() {
  cd I2PChat
  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf '0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd I2PChat
  python -m build --wheel --no-isolation
}

package() {
  cd I2PChat
  python -m installer --destdir="${pkgdir}" dist/*.whl
  # Wheel also installs the GUI entrypoint; drop it for the TUI-only package.
  rm -f "${pkgdir}/usr/bin/i2pchat"
  install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/i2pchat-tui.png"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/i2pchat-tui.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=I2P Chat (TUI)
Comment=P2P chat over I2P
Exec=i2pchat-tui
Icon=i2pchat-tui
Terminal=true
Categories=Network;Chat;
EOF
}
