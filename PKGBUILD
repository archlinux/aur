# Maintainer: Zaman Huseynli <zamanhuseynli23@gmail.com>
# Backup contact: admin@azccriminal.space

pkgname=audius
pkgver=1.5.156
pkgrel=1
pkgdesc="Audius music streaming client package"
arch=('x86_64')
url="https://audius.co"
license=('Apache')
depends=('fuse2')
provides=('audius')
conflicts=('audius')
options=(!strip)
source=("Audius-${pkgver}.AppImage::https://download.audius.co/Audius-${pkgver}.AppImage")
noextract=("Audius-${pkgver}.AppImage")
sha256sums=('SKIP')

prepare() {
  chmod +x "Audius-${pkgver}.AppImage"
  "./Audius-${pkgver}.AppImage" --appimage-extract
}

package() {
  install -Dm755 "Audius-${pkgver}.AppImage" "$pkgdir/opt/audius/Audius.AppImage"

  install -dm755 "$pkgdir/usr/bin"
  cat << EOF > "$pkgdir/usr/bin/audius"
#!/bin/bash
exec /opt/audius/Audius.AppImage "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/audius"

  install -Dm644 squashfs-root/audius-client.desktop "$pkgdir/usr/share/applications/audius.desktop"
  sed -i 's|Exec=.*|Exec=/opt/audius/Audius.AppImage|' "$pkgdir/usr/share/applications/audius.desktop"
  sed -i 's|Icon=.*|Icon=audius-client|' "$pkgdir/usr/share/applications/audius.desktop"

  for size in 16 32 48 64 128 256 512 1024; do
    icon_path="squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/audius-client.png"
    if [[ -f "$icon_path" ]]; then
      install -Dm644 "$icon_path" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/audius-client.png"
    fi
  done

  install -Dm644 squashfs-root/LICENSE.electron.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
  install -Dm644 squashfs-root/LICENSES.chromium.html "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
