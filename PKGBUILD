# Maintainer: <INSERT NAME> <INSERT EMAIL>
# Contributor: Matthew Lam

pkgname=pi-gui-bin
pkgver=0.1.0.beta28
pkgrel=1
pkgdesc="Codex-style desktop shell for pi - prebuilt binary"
arch=('x86_64')
url='https://github.com/minghinmatthewlam/pi-gui'
license=('MIT')
depends=('gtk3' 'libxss' 'nss' 'libnotify' 'alsa-lib' 'libcups')
provides=('pi-gui')
conflicts=('pi-gui')
source=("https://github.com/minghinmatthewlam/pi-gui/releases/download/v0.1.0-beta.28/pi-gui-0.1.0-beta.28-x86_64.AppImage"
        "https://github.com/minghinmatthewlam/pi-gui/raw/v0.1.0-beta.28/LICENSE")
sha256sums=('57f30da25653ed23bd1d96b00d4690da4df335c3a4f860d62562fe23c7049cc0'
            '887989ae1d3323becad917f0cdc9ca67f6c185416304b65f85c471fdbfbf798c')

package() {
  cd "$srcdir"

  chmod +x pi-gui-*.AppImage
  ./pi-gui-*.AppImage --appimage-extract

  cd squashfs-root

  install -dm755 "$pkgdir/opt/pi-gui"
  cp -a . "$pkgdir/opt/pi-gui/"

  install -dm755 "$pkgdir/usr/bin"
  ln -sf /opt/pi-gui/AppRun "$pkgdir/usr/bin/pi-gui"

  if [ -f pi-gui.png ]; then
    install -Dm644 pi-gui.png "$pkgdir/usr/share/pixmaps/pi-gui.png"
  fi

  if [ -f pi-gui.desktop ]; then
    install -Dm644 pi-gui.desktop "$pkgdir/usr/share/applications/pi-gui.desktop"
  else
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/pi-gui.desktop" << 'DESKTOP'
[Desktop Entry]
Name=pi-gui
Comment=Desktop shell for pi
Exec=pi-gui %U
Icon=pi-gui
Terminal=false
Type=Application
Categories=Development;
StartupWMClass=pi-gui
DESKTOP
  fi

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  chmod 4755 "$pkgdir/opt/pi-gui/chrome-sandbox" 2>/dev/null || true
}
