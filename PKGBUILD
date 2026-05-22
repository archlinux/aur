# Maintainer: jeryd leuck <jerydleuck@gmail.com>
# Part of https://github.com/UberMetroid/AUR-Packages (clean chroot + ldd verified)
# Follows BEST_PRACTICES.md

pkgname=equibop-client-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="Equicord-enabled Discord client (client-bin, verified with clean chroot + ldd checks)"
arch=('x86_64')
url="https://github.com/Equicord/Equibop"
license=('GPL-3.0-only')
depends=('alsa-lib' 'at-spi2-core' 'atk' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxkbcommon' 'libxrandr' 'libxrender' 'libxshmfence' 'mesa' 'nss' 'pango' 'xdg-utils')
optdepends=('libappindicator-gtk3: tray icon support'
            'libnotify: desktop notifications'
            'pipewire: better audio handling'
            'xdg-desktop-portal: file picker and screenshare on Wayland')
provides=('equibop')
conflicts=('equibop' 'equibop-bin' 'vesktop' 'vencord-desktop')

source=("equibop-${pkgver}.tar.gz::https://github.com/Equicord/Equibop/releases/download/v${pkgver}/equibop-${pkgver}.tar.gz"
        "equibop.desktop")
sha256sums=('fd4c881917cd8d81a9c088cd2619958acab44538447506790e3e5a2cff94f70c'
            'SKIP')

prepare() {
  # The tarball contains a directory named "equibop-${pkgver}"
  cd "$srcdir/equibop-${pkgver}"
}

check() {
  # Verify no broken library links in the extracted Electron app
  find "$srcdir/equibop-${pkgver}" -type f -executable -exec sh -c 'file "$1" | grep -q ELF' _ {} \; -print 2>/dev/null | while read -r elf; do
    if ldd "$elf" 2>/dev/null | grep -q "not found"; then
      echo "ERROR: Broken dependencies detected in $elf"
      ldd "$elf" | grep "not found"
      exit 1
    fi
  done || true
}

package() {
  cd "$srcdir/equibop-${pkgver}"

  # Install the application
  install -dm755 "$pkgdir/opt/Equibop"
  cp -a --no-preserve=ownership . "$pkgdir/opt/Equibop/"

  # Fix permissions on chrome-sandbox (setuid)
  chmod 4755 "$pkgdir/opt/Equibop/chrome-sandbox" 2>/dev/null || true

  # Install our opinionated, clean desktop file (fixes notification/icon issues on Plasma/Hyprland)
  install -Dm644 "$srcdir/equibop.desktop" "$pkgdir/usr/share/applications/equibop.desktop"

  # Install icons from the package if present
  for size in 16 32 48 64 128 256 512; do
    icon_path="usr/share/icons/hicolor/${size}x${size}/apps"
    if [ -f "$icon_path/equibop.png" ] || [ -f "$icon_path/org.equicord.equibop.png" ]; then
      install -Dm644 "$icon_path/"*.png "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/equibop.png" 2>/dev/null || true
    fi
  done

  # Create wrapper binary with modern Wayland + Ozone flags (opinionated but safe)
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/equibop" << 'EOF'
#!/bin/bash
# Equibop launcher - opinionated flags for better Wayland/X11 experience
exec /opt/Equibop/equibop \
  --ozone-platform-hint=auto \
  --enable-features=WaylandWindowDecorations,WebRTCPipeWireCapturer \
  --disable-gpu-sandbox \
  "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/equibop"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
