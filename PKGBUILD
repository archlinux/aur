pkgname=feishin-bin
pkgver=1.13.0
pkgrel=3
pkgdesc="Modern web-based music player (prebuilt binary)"
arch=('x86_64')
url="https://github.com/jeffvli/feishin"
license=('GPL3')

depends=('libnotify' 'nss' 'gtk3' 'alsa-lib')

provides=('feishin')
conflicts=('feishin')

source=(
  "feishin.tar.xz::https://github.com/jeffvli/feishin/releases/download/v${pkgver}/Feishin-linux-x64.tar.xz"
  "feishin.desktop"
)

noextract=("feishin.tar.xz")
sha256sums=('SKIP' 'SKIP')

package() {
  mkdir -p "$pkgdir/opt/feishin"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"

  # Extract full Electron app as-is (IMPORTANT)
  bsdtar -xf feishin.tar.xz -C "$pkgdir/opt/feishin"

  # Launcher
  cat > "$pkgdir/usr/bin/feishin" << 'EOF'
#!/bin/bash
exec /opt/feishin/Feishin-linux-x64/feishin "$@"
EOF

  chmod +x "$pkgdir/usr/bin/feishin"

  # Desktop entry
  install -Dm644 feishin.desktop \
    "$pkgdir/usr/share/applications/feishin.desktop"

  # Icon
  install -Dm644 \
    "$pkgdir/opt/feishin/Feishin-linux-x64/resources/assets/icons/512x512.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/feishin.png"

  # cleanup
  find "$pkgdir" -name ".PKGINFO" -delete
  find "$pkgdir" -name ".BUILDINFO" -delete
  find "$pkgdir" -name ".MTREE" -delete

  gtk-update-icon-cache -q "$pkgdir/usr/share/icons/hicolor" || true
}
