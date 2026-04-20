# Maintainer: Bryan Rafael <brthy467@gmail.com>

pkgname=synca-bin
pkgver=0.3.2
pkgrel=4
pkgdesc="Simple, lightweight, open source file synchronization client (prebuilt AppImage)"
arch=('x86_64')
url="https://github.com/bryanrafaelbueno/Synca"
license=('MIT')
depends=('glibc' 'zlib')
optdepends=('fuse2: for running AppImage directly')
provides=('synca')
conflicts=('synca')
options=(!strip)

_appimage="Synca-x86_64.AppImage"

source=(
  "$_appimage::https://github.com/bryanrafaelbueno/Synca/releases/download/$pkgver/$_appimage"
)
sha256sums=('4baddd4171e040717abaef4d1658cc3cd7796f1a2079bca45f820d1948ac094f')

prepare() {
  cd "$srcdir"

  chmod +x "$_appimage"

  # Extrai apenas para acessar ícones e desktop file
  "./$_appimage" --appimage-extract >/dev/null
}

package() {
  cd "$srcdir"

  # Instala AppImage
  install -Dm755 "$_appimage" \
    "$pkgdir/usr/lib/synca/synca.AppImage"

  # Wrapper
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/synca" << 'EOF'
#!/bin/bash
exec /usr/lib/synca/synca.AppImage "$@"
EOF

  # Desktop entry (usa o original se existir)
  if [ -f "squashfs-root/*.desktop" ]; then
    desktop_file=$(ls squashfs-root/*.desktop | head -n1)
    sed -i 's|Exec=.*|Exec=synca|' "$desktop_file"
    install -Dm644 "$desktop_file" \
      "$pkgdir/usr/share/applications/synca.desktop"
  else
    install -Dm644 /dev/stdin \
      "$pkgdir/usr/share/applications/synca.desktop" << 'EOF'
[Desktop Entry]
Name=Synca
Comment=Lightweight file sync client
Exec=synca
Icon=synca
Terminal=false
Type=Application
Categories=Utility;Network;
EOF
  fi

  # Ícones
  for size in 32 64 128 256 512; do
    icon_path="$srcdir/squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/synca.png"
    if [ -f "$icon_path" ]; then
      install -Dm644 "$icon_path" \
        "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/synca.png"
    fi
  done

  # Licença
  if [ -f "$srcdir/squashfs-root/usr/share/licenses/synca/LICENSE" ]; then
    install -Dm644 "$srcdir/squashfs-root/usr/share/licenses/synca/LICENSE" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  elif [ -f "$srcdir/squashfs-root/LICENSE" ]; then
    install -Dm644 "$srcdir/squashfs-root/LICENSE" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
