# Maintainer: 9M2PJU <https://github.com/9M2PJU>
# Upstream: https://github.com/tulcoturo/clovercut
# AUR package: clovercut-bin (prebuilt AppImage from GitHub releases).
# To update for a new release: bump pkgver, replace both sha256sums with the
# matching lines from the release's SHA256SUMS file, regenerate .SRCINFO with
# `makepkg --printsrcinfo > .SRCINFO`, then push this directory to AUR.
pkgname=clovercut-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Desktop-first, open-source video editor with built-in stock libraries and local AI"
arch=('x86_64' 'aarch64')
url="https://github.com/tulcoturo/clovercut"
license=('AGPL-3.0-or-later')
depends=('hicolor-icon-theme' 'gtk3' 'fontconfig' 'freetype2' 'libxkbcommon' 'libxkbcommon-x11' 'mesa' 'alsa-lib')
options=('!strip' '!debug')
provides=('clovercut')
conflicts=('clovercut')
source_x86_64=("Clovercut-${pkgver}-x86_64.AppImage::https://github.com/tulcoturo/clovercut/releases/download/v${pkgver}/Clovercut-${pkgver}-x86_64.AppImage")
source_aarch64=("Clovercut-${pkgver}-aarch64.AppImage::https://github.com/tulcoturo/clovercut/releases/download/v${pkgver}/Clovercut-${pkgver}-aarch64.AppImage")
sha256sums_x86_64=('bbd35f5f95919bef68794d9f928ba6d39c92f6b090ea356fa3d09460f15a4e98')
sha256sums_aarch64=('7cca6d1cd3c7f7dbee973d9ec40b1e9ea2ccb23a90b0dbc3ed370d84898578e7')

package() {
  local appimage
  if [ "$CARCH" = "aarch64" ]; then
    appimage="Clovercut-${pkgver}-aarch64.AppImage"
  else
    appimage="Clovercut-${pkgver}-x86_64.AppImage"
  fi

  install -Dm755 "$appimage" "$pkgdir/opt/clovercut/Clovercut.AppImage"

  # Launcher on the PATH. The AppImage carries its own libraries; the
  # wrapper only forwards arguments.
  install -d "$pkgdir/usr/bin"
  printf '#!/bin/sh\nexec /opt/clovercut/Clovercut.AppImage "$@"\n' > "$pkgdir/usr/bin/clovercut"
  chmod 755 "$pkgdir/usr/bin/clovercut"

  # Desktop entry and icon, extracted from the AppImage itself so they
  # always match the shipped release. Falls back to a static entry if
  # extraction ever fails on the build host.
  if ./"$appimage" --appimage-extract >/dev/null 2>&1; then
    local desktop
    desktop=$(find squashfs-root -maxdepth 1 -name '*.desktop' | head -1)
    if [ -n "$desktop" ]; then
      install -Dm644 "$desktop" "$pkgdir/usr/share/applications/io.github.tulcoturo.clovercut.desktop"
    fi
    local icon
    icon=$(find squashfs-root -maxdepth 3 \( -name 'clovercut.png' -o -name '.DirIcon' \) | head -1)
    if [ -n "$icon" ]; then
      install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/256x256/apps/clovercut.png"
    fi
    rm -rf squashfs-root
  fi
  if [ ! -f "$pkgdir/usr/share/applications/io.github.tulcoturo.clovercut.desktop" ]; then
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/io.github.tulcoturo.clovercut.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Clovercut
Comment=Edit video and audio locally
Exec=clovercut
Icon=clovercut
Categories=AudioVideo;Video;
Terminal=false
StartupWMClass=io.github.tulcoturo.clovercut
DESKTOP
  fi
}
