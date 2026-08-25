# Maintainer: Joao Costa <arch@joaocosta.dev>
pkgname=stream32-appimage
_pkgname=stream32
pkgver=1.14.0
pkgrel=1
pkgdesc="Desktop app for nn ESP32 powered stream deck"
arch=('x86_64')
url="https://github.com/FadyFaheem/Stream32"
license=('MIT')
options=('!strip' '!debug')
provides=('stream32')
conflicts=()
source=("${_pkgname}-${pkgver}.AppImage::https://github.com/FadyFaheem/Stream32/releases/download/v${pkgver}/Stream32-${pkgver}-x86_64.AppImage")
sha256sums=('9269c487c3af8a9131fb684670dc692500e90f4d0736d0c746a45bebdf941d7f')

package() {
  cd "$srcdir"

  chmod +x "${_pkgname}-${pkgver}.AppImage"
  install -Dm755 "${_pkgname}-${pkgver}.AppImage" "$pkgdir/usr/bin/stream32"

  ./"${_pkgname}-${pkgver}.AppImage" --appimage-extract &>/dev/null

  if [ -f "squashfs-root/stream32-desktop.png" ]; then
    install -Dm644 "squashfs-root/stream32-desktop.png" "$pkgdir/usr/share/pixmaps/stream32-desktop.png"
  else
    msg2 "Warning: Could not automatically find an icon file (stream32-desktop.png) within the AppImage."
    msg2 "         Desktop entry icon might be missing."
  fi

  if [ -f "squashfs-root/stream32-desktop.desktop" ]; then
    sed -i 's|Exec=AppRun|Exec=/usr/bin/stream32|' "squashfs-root/stream32-desktop.desktop"
    install -Dm644 "squashfs-root/stream32-desktop.desktop" "$pkgdir/usr/share/applications/stream32.desktop"
  else
    msg2 "Fail: Could not automatically find desktop file (stream32-desktop.desktop) within the AppImage."
    exit 1
  fi
}
