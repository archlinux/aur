# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=epsxe-appimage
pkgver=2.0.5
pkgrel=1
pkgdesc="ePSXe PS1 emulator for 64-bit Linux (AppImage)"
arch=('x86_64')
url="https://github.com/amirzaim/epsxe-appimage"
license=('unknown')
depends=('fuse2' 'glibc')
makedepends=('imagemagick')
provides=('epsxe')
conflicts=('epsxe' 'epsxe-git')
options=('!strip' '!debug')

source=("ePSXe_PS1_Emulator-x86_64.AppImage::https://github.com/amirzaim/epsxe-appimage/releases/download/epsxe/ePSXe_PS1_Emulator-x86_64.AppImage")
sha256sums=('222174291b5216920bd58ed4ec41ceec5f6bcab5bbf87a3c524aca5fda7f5b5b')

package() {
  install -Dm755 "$srcdir/ePSXe_PS1_Emulator-x86_64.AppImage" \
    "$pkgdir/opt/epsxe/ePSXe_PS1_Emulator-x86_64.AppImage"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/epsxe" <<'EOF'
#!/bin/sh
exec /opt/epsxe/ePSXe_PS1_Emulator-x86_64.AppImage "$@"
EOF

  # Upstream's desktop entry, with Exec pointed at our wrapper.
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

  # Upstream icon is a 1200x1064 PNG; scale it to a regular 256x256 with
  # transparent padding so it fits the hicolor theme properly.
  cd "$srcdir"
  chmod +x ePSXe_PS1_Emulator-x86_64.AppImage
  ./ePSXe_PS1_Emulator-x86_64.AppImage --appimage-extract >/dev/null 2>&1 || true
  convert squashfs-root/epsxe.png -background none -resize 256x256 \
    -gravity center -extent 256x256 "$srcdir/epsxe-256.png"
  install -Dm644 "$srcdir/epsxe-256.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/epsxe.png"
  install -Dm644 "$srcdir/epsxe-256.png" "$pkgdir/usr/share/pixmaps/epsxe.png"
  rm -rf squashfs-root
}
