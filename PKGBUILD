# Maintainer: Bryan Rafael <brthy467@gmail.com>

pkgname=synca-bin
pkgver=0.3.1
pkgrel=2
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
sha256sums=('4490bf12ecfe01b7367763ee674cc69cf16c4cff2db6bf6692468669312eff70')

package() {
  cd "$srcdir"

  # Instala AppImage em /usr/lib (padrão para blobs)
  install -Dm755 "$_appimage" \
    "$pkgdir/usr/lib/synca/synca.AppImage"

  # Wrapper binário
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/synca" << 'EOF'
#!/bin/bash
exec /usr/lib/synca/synca.AppImage "$@"
EOF

  # Desktop entry básico (fallback)
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
}
