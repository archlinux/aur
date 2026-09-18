# Maintainer: NickeyGod <niklass.schaeffer@gmail.com>

pkgname=nodeterm-bin
pkgver=0.3.7
pkgrel=1
pkgdesc="Node-based terminal manager — multiple draggable, zoomable terminals on a single canvas"
arch=('x86_64')
url="https://github.com/eneskirca/nodeterm"
license=('LicenseRef-BUSL-1.1')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gtk3'
  'libnotify'
  'libsecret'
  'libxss'
  'libxtst'
  'nss'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=('libappindicator-gtk3: system tray support')
provides=('nodeterm')
conflicts=('nodeterm')
options=('!strip' '!emptydirs')
source=("node-terminal_${pkgver}_amd64.deb::https://github.com/eneskirca/nodeterm/releases/download/v${pkgver}/node-terminal_${pkgver}_amd64.deb")
sha256sums=('45fa7fa22665f25cd22852e08b56495d030432fc7662875422959e39f60ec819')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir"

  # Fix chrome-sandbox SUID permissions
  chmod 4755 "$pkgdir/opt/nodeterm/chrome-sandbox"

  # Symlink binary to PATH
  install -d "$pkgdir/usr/bin"
  ln -s /opt/nodeterm/node-terminal "$pkgdir/usr/bin/nodeterm"

  # Rename desktop entry and icon to match package name
  mv "$pkgdir/usr/share/applications/node-terminal.desktop" \
     "$pkgdir/usr/share/applications/nodeterm.desktop"
  mv "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/node-terminal.png" \
     "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/nodeterm.png"

  # Update desktop entry to use symlinked binary
  sed -i 's|Exec=/opt/nodeterm/node-terminal|Exec=nodeterm|' \
     "$pkgdir/usr/share/applications/nodeterm.desktop"
  sed -i 's|Icon=node-terminal|Icon=nodeterm|' \
     "$pkgdir/usr/share/applications/nodeterm.desktop"
}
