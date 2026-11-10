# Maintainer: Idigo Luwum luwum@pm.me
# Contributor: Matthew Lam

pkgname=pi-gui-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Codex-style desktop shell for pi - prebuilt binary"
arch=('x86_64')
url='https://github.com/minghinmatthewlam/pi-gui'
license=('MIT')
depends=('gtk3' 'libxss' 'nss' 'libnotify' 'alsa-lib' 'libcups')
makedepends=('7zip')
provides=('pi-gui')
conflicts=('pi-gui')
source=("https://github.com/minghinmatthewlam/pi-gui/releases/download/v1.0.1/pi-gui-1.0.1-x86_64.AppImage"
        "https://github.com/minghinmatthewlam/pi-gui/raw/v1.0.1/LICENSE")
sha256sums=('581c965d96a3c2f0db3f1e88e91a3c3d11f1353dd3158a57cbe5cb989d537681'
            '887989ae1d3323becad917f0cdc9ca67f6c185416304b65f85c471fdbfbf798c')

package() {
  cd "$srcdir"

  # The embedded AppImage runtime's own --appimage-extract fails to locate
  # the squashfs offset for this build (it mis-detects the ELF size because
  # of the extra update/signature sections electron-builder appends), and
  # it also requires FUSE access that clean build chroots don't grant.
  # Extract the appended squashfs filesystem directly instead.
  7z x pi-gui-*.AppImage -osquashfs-root -y

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
