# Maintainer: yurisuki <30354739+yurisuki@users.noreply.github.com>
pkgname=ic-sync-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Native iCloud Drive sync client with a system tray GUI (binary release)'
arch=('x86_64' 'aarch64')
url='https://github.com/yurisuki/ic-sync'
license=('MIT')
depends=('glibc' 'gcc-libs' 'dbus' 'hicolor-icon-theme')
optdepends=('gnome-keyring: Secret Service provider for credential storage'
            'kwallet: Secret Service provider for KDE Plasma')
source_x86_64=("ic-sync-linux-x86_64.tar.gz::https://github.com/yurisuki/ic-sync/releases/download/v$pkgver/ic-sync-linux-x86_64.tar.gz")
sha256sums_x86_64=('706553e6dbb39b0234ee63b546b3b797bfe3b4de8f42efce276ef107d355dcd0')
source_aarch64=("ic-sync-linux-aarch64.tar.gz::https://github.com/yurisuki/ic-sync/releases/download/v$pkgver/ic-sync-linux-aarch64.tar.gz")
sha256sums_aarch64=('5c45991c34b86c65ef15df9727c44256b7cc750fd4da21efca062785ffa582d7')
options=(!strip)

package() {
  cd "$srcdir/ic-sync-linux-$CARCH"

  install -Dm755 ic-sync "$pkgdir/usr/bin/ic-sync"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  for doc in docs/*.md; do
    install -Dm644 "$doc" "$pkgdir/usr/share/doc/$pkgname/$(basename "$doc")"
  done

  for icon in 32 64 128 256; do
    install -Dm644 "assets/ic-sync-$icon.png" \
      "$pkgdir/usr/share/icons/hicolor/${icon}x${icon}/apps/ic-sync.png"
  done

  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/ic-sync.desktop" <<'EOF'
[Desktop Entry]
Name=IC-SYNC
GenericName=iCloud Drive Sync
Comment=Native iCloud Drive sync client
Exec=ic-sync
Icon=ic-sync
Type=Application
Terminal=false
Categories=Network;FileTransfer;
StartupNotify=true
EOF
}
