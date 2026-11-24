# Maintainer: yurisuki <30354739+yurisuki@users.noreply.github.com>
pkgname=ic-sync
pkgver=0.1.0
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/yurisuki/ic-sync/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1104552d3c62df79d0a1076c204b57e9d9a94255ed7e9663b001168dacfa467c')

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
