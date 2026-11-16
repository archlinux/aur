# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=epsxe-appimage
pkgver=2.0.5
pkgrel=3
pkgdesc="ePSXe PS1 emulator for 64-bit Linux (self-built AppImage)"
arch=('x86_64')
url="https://github.com/Twilight0/epsxe-appimage"
license=('unknown')
depends=('fuse2' 'glibc')
makedepends=('imagemagick')
provides=('epsxe')
conflicts=('epsxe' 'epsxe-git')
options=('!strip' '!debug')

# Our own AppImage: the upstream one cannot run on a current distro (its
# ncurses 5 libraries lack the symbol version node ePSXe needs, and it never
# bundled libssl.so.1.1 / libunistring.so.2). This one carries a working
# runtime and 64-bit plugins built from PCSX-Reloaded 1.9.95.
source=("ePSXe-2.0.5-x86_64.AppImage::https://github.com/Twilight0/epsxe-appimage/releases/download/v$pkgver/ePSXe-$pkgver-x86_64.AppImage")
sha256sums=('9891b27d0f31b25735cf73b15483ec83e572646f6a8fec325b23d8d1ddf71724')

package() {
  install -Dm755 "$srcdir/ePSXe-$pkgver-x86_64.AppImage" \
    "$pkgdir/opt/epsxe/ePSXe-$pkgver-x86_64.AppImage"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/epsxe" <<'EOF'
#!/bin/sh
exec /opt/epsxe/ePSXe-2.0.5-x86_64.AppImage "$@"
EOF

  # Desktop entry, Exec pointed at our wrapper.
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/epsxe.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=ePSXe PS1 Emulator
Comment=A PlayStation 1 emulator for 64-bit Linux
Icon=epsxe
Exec=epsxe %U
Terminal=false
Categories=Game;Emulator;
Keywords=PS1;PSX;ePSXe;PlayStation 1;
EOF

  # Icon from the AppImage itself, scaled to a regular 256x256.
  cd "$srcdir"
  chmod +x "ePSXe-$pkgver-x86_64.AppImage"
  "./ePSXe-$pkgver-x86_64.AppImage" --appimage-extract >/dev/null 2>&1 || true
  if [ -f squashfs-root/epsxe.png ]; then
    convert squashfs-root/epsxe.png -background none -resize 256x256 \
      -gravity center -extent 256x256 "$srcdir/epsxe-256.png"
    install -Dm644 "$srcdir/epsxe-256.png" \
      "$pkgdir/usr/share/icons/hicolor/256x256/apps/epsxe.png"
    install -Dm644 "$srcdir/epsxe-256.png" "$pkgdir/usr/share/pixmaps/epsxe.png"
  fi
  rm -rf squashfs-root
}
