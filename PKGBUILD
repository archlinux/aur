# Maintainer: yurisuki <30354739+yurisuki@users.noreply.github.com>
pkgname=ic-sync-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Native iCloud Drive sync client with a system tray GUI (binary release)'
arch=('x86_64' 'aarch64')
url='https://github.com/yurisuki/ic-sync'
license=('MIT')
depends=('glibc' 'gcc-libs' 'dbus' 'hicolor-icon-theme')
optdepends=('gnome-keyring: Secret Service provider for credential storage'
            'kwallet: Secret Service provider for KDE Plasma')
# Checksums are not hard-coded: the release archives are verified in prepare()
# against the SHA256SUMS file published with the GitHub release, so a new
# version only needs a pkgver bump in this file.
# Versioned local filenames force makepkg to re-download on pkgver bumps:
# upstream archive names are identical across releases.
source_x86_64=("ic-sync-linux-x86_64-$pkgver.tar.gz::https://github.com/yurisuki/ic-sync/releases/download/v$pkgver/ic-sync-linux-x86_64.tar.gz"
               "SHA256SUMS-$pkgver::https://github.com/yurisuki/ic-sync/releases/download/v$pkgver/SHA256SUMS")
sha256sums_x86_64=('SKIP' 'SKIP')
source_aarch64=("ic-sync-linux-aarch64-$pkgver.tar.gz::https://github.com/yurisuki/ic-sync/releases/download/v$pkgver/ic-sync-linux-aarch64.tar.gz"
                "SHA256SUMS-$pkgver::https://github.com/yurisuki/ic-sync/releases/download/v$pkgver/SHA256SUMS")
sha256sums_aarch64=('SKIP' 'SKIP')
options=(!strip)

prepare() {
  cd "$srcdir"

  local upstream="ic-sync-linux-$CARCH.tar.gz"
  local local_file="ic-sync-linux-$CARCH-$pkgver.tar.gz"
  local expected
  expected=$(awk -v name="$upstream" '$2 == name { print $1 }' "SHA256SUMS-$pkgver")
  if [[ -z "$expected" ]]; then
    error "No checksum for $upstream in the GitHub SHA256SUMS"
  fi
  printf '%s  %s\n' "$expected" "$local_file" | sha256sum --check --strict
}

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
Type=Application
Name=IC-SYNC
GenericName=iCloud Drive Sync
Comment=Native iCloud Drive sync client
Exec=ic-sync
Icon=ic-sync
Terminal=false
Categories=Network;FileTransfer;
StartupNotify=true
EOF
}
