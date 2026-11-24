# Maintainer: yurisuki <30354739+yurisuki@users.noreply.github.com>
pkgname=ic-sync
pkgver=0.1.1
pkgrel=1
pkgdesc='Native iCloud Drive sync client with a system tray GUI'
arch=('x86_64' 'aarch64')
url='https://github.com/yurisuki/ic-sync'
license=('MIT')
depends=('glibc' 'gcc-libs' 'dbus' 'hicolor-icon-theme')
makedepends=('rust' 'cmake' 'pkgconf' 'libxkbcommon' 'wayland' 'libx11' 'libxrandr'
             'libxi' 'libxcursor' 'libxinerama' 'mesa' 'systemd-libs')
optdepends=('gnome-keyring: Secret Service provider for credential storage'
            'kwallet: Secret Service provider for KDE Plasma')
# Checksums are not hard-coded: both downloads are verified in prepare()
# against the SHA256SUMS file published with the GitHub release, so a new
# version only needs a pkgver bump in this file.
source=("$pkgname-$pkgver.tar.gz::https://github.com/yurisuki/ic-sync/archive/refs/tags/v$pkgver.tar.gz"
        "SHA256SUMS-$pkgver::https://github.com/yurisuki/ic-sync/releases/download/v$pkgver/SHA256SUMS")
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "$srcdir"

  local archive="$pkgname-$pkgver.tar.gz"
  local expected
  expected=$(awk -v name="$archive" '$2 == name { print $1 }' "SHA256SUMS-$pkgver")
  if [[ -z "$expected" ]]; then
    error "No checksum for $archive in the GitHub SHA256SUMS"
  fi
  printf '%s  %s\n' "$expected" "$archive" | sha256sum --check --strict
}

build() {
  cd "$srcdir/ic-sync-$pkgver"
  # makepkg's hardening flags interfere with the native link directives of
  # bundled C libraries (aws-lc-sys, libsqlite3-sys) under rustc.
  unset CFLAGS CXXFLAGS LDFLAGS RUSTFLAGS
  cargo build --workspace --release --locked
}

check() {
  cd "$srcdir/ic-sync-$pkgver"
  unset CFLAGS CXXFLAGS LDFLAGS RUSTFLAGS
  cargo test --workspace --locked
}

package() {
  cd "$srcdir/ic-sync-$pkgver"

  install -Dm755 target/release/ic-sync "$pkgdir/usr/bin/ic-sync"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

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
