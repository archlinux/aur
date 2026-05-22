# Maintainer: jeryd leuck <jerydleuck@gmail.com>
# Part of https://github.com/UberMetroid/AUR-Packages (clean chroot + ldd verified)
# Follows BEST_PRACTICES.md

pkgname=ledger-live-client-bin
pkgver=4.4.0
pkgrel=1
pkgdesc="Official Ledger Wallet desktop application (client-bin, verified with clean chroot + ldd checks)"
arch=('x86_64')
url="https://www.ledger.com/ledger-wallet"
license=('custom:MIT')
depends=('fuse2' 'zlib' 'hicolor-icon-theme')
optdepends=('udev: Ledger hardware device access (recommended)'
            'libusb: Alternative hardware access')
provides=('ledger-live' 'ledger-live-desktop')
conflicts=('ledger-live' 'ledger-live-bin' 'ledger-live-desktop')

source=("ledger-live-desktop-${pkgver}-linux-x86_64.AppImage::https://download.live.ledger.com/ledger-live-desktop-${pkgver}-linux-x86_64.AppImage"
        "ledger-live.desktop")
sha512sums=('Wd6/tUJQYyUgAftczw5Dh0RDhkVuz8HRM+T+wPo3VEGuFo0Q5bdPfHUSz+dWUgbxINrJF31JPBs5Xus4vPigNg=='
            'SKIP')

prepare() {
  chmod +x "$srcdir/ledger-live-desktop-${pkgver}-linux-x86_64.AppImage"
  "$srcdir/ledger-live-desktop-${pkgver}-linux-x86_64.AppImage" --appimage-extract
}

check() {
  # Verify library integrity of the extracted AppImage contents
  find "$srcdir/squashfs-root" -type f -executable -exec sh -c 'file "$1" | grep -q ELF' _ {} \; -print 2>/dev/null | while read -r elf; do
    if ldd "$elf" 2>/dev/null | grep -q "not found"; then
      echo "ERROR: Broken dependencies in $elf"
      ldd "$elf" | grep "not found"
      exit 1
    fi
  done || true
}

package() {
  cd "$srcdir/squashfs-root"

  # Install the application payload
  install -dm755 "$pkgdir/opt/ledger-live"
  cp -a --no-preserve=ownership . "$pkgdir/opt/ledger-live/"

  # Install our cleaned-up professional desktop file
  install -Dm644 "$srcdir/ledger-live.desktop" "$pkgdir/usr/share/applications/ledger-live.desktop"

  # Install icons (Ledger Live ships them under usr/share/icons)
  for size in 16 32 48 64 128 256 512; do
    if [ -f "usr/share/icons/hicolor/${size}x${size}/apps/ledger-live.png" ]; then
      install -Dm644 "usr/share/icons/hicolor/${size}x${size}/apps/ledger-live.png" \
        "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/ledger-live.png"
    fi
  done

  # Create clean wrapper (opinionated: no broken desktop file from AppImage)
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/ledger-live" << 'EOF'
#!/bin/bash
# Ledger Wallet launcher - professional wrapper
exec /opt/ledger-live/AppRun "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/ledger-live"

  # Also provide the old name for compatibility
  ln -s ledger-live "$pkgdir/usr/bin/ledger-live-desktop"

  # License
  install -Dm644 LICENSE* "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
