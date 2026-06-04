# Maintainer: Your Name <your.email@example.com>
pkgname=lzc-client-desktop-bin
pkgver=2.0.11
pkgrel=1
pkgdesc='懒猫微服客户端 Lazy Cat microservice desktop client'
arch=('x86_64')
url='https://lazycat.cloud/'
license=('custom')
depends=(
  'zenity'
  'libcap'
  'glib2'
  'nspr'
  'nss'
  'dbus'
  'at-spi2-core'
  'libcups'
  'cairo'
  'gtk3'
  'pango'
  'libx11'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxrandr'
  'mesa'
  'expat'
  'libxcb'
  'libxkbcommon'
  'systemd-libs'
  'alsa-lib'
)
makedepends=('zstd')
install="${pkgname}.install"
source=("lzc-client-desktop_${pkgver}.tar.zst::https://dl.lazycat.cloud/client/desktop/stable/lzc-client-desktop_v${pkgver}.tar.zst"
        "image.png")
sha256sums=('1059d5aa4296af42fcc68be8115185010fd58f69eec297c39fd7f74b793a9c17'
            'cf462ea972a91a51d277d8bb8fd20647a10f8b9de2ac558b3a5cb3fc238711f4')

# Disable compression for faster testing during development
# Remove this line before publishing to AUR
PKGEXT='.pkg.tar'

package() {
  cd "$srcdir"

  # Files extract directly to srcdir, not in a subdirectory
  _appdir="."

  # 1. Install application files to /usr/lib/lzc-client-desktop
  msg "Installing application files..."
  install -dm755 "$pkgdir/usr/lib/lzc-client-desktop"

  # Copy all application files (adjust based on actual structure)
  cp -a "$_appdir"/* "$pkgdir/usr/lib/lzc-client-desktop/" 2>/dev/null || true

  # Ensure binary is executable
  if [ -f "$pkgdir/usr/lib/lzc-client-desktop/lzc-client-desktop" ]; then
    chmod +x "$pkgdir/usr/lib/lzc-client-desktop/lzc-client-desktop"
  fi

  # Set chrome-sandbox permissions (required for Electron apps)
  if [ -f "$pkgdir/usr/lib/lzc-client-desktop/chrome-sandbox" ]; then
    chmod 4755 "$pkgdir/usr/lib/lzc-client-desktop/chrome-sandbox"
  fi

  # 2. Create wrapper script in /usr/bin
  msg "Creating wrapper script..."
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/lzc-client-desktop" <<'EOF'
#!/bin/bash
# Wrapper script for lzc-client-desktop
exec /usr/lib/lzc-client-desktop/lzc-client-desktop "$@"
EOF

  # 3. Install desktop file with corrected paths
  msg "Installing desktop file..."
  if [ -f "$_appdir/lzc-client.desktop" ]; then
    install -Dm644 "$_appdir/lzc-client.desktop" \
      "$pkgdir/usr/share/applications/lzc-client-desktop.desktop"

    # Patch Exec and Icon paths
    sed -i \
      -e 's|^Exec=.*|Exec=/usr/bin/lzc-client-desktop|g' \
      -e 's|^Icon=.*|Icon=lzc-client-desktop|g' \
      -e 's|HOMEDIR|/usr/lib/lzc-client-desktop|g' \
      "$pkgdir/usr/share/applications/lzc-client-desktop.desktop"
  fi

  # 4. Install icon
  msg "Installing icon..."
  install -Dm644 "$srcdir/image.png" \
    "$pkgdir/usr/share/pixmaps/lzc-client-desktop.png"

  # 5. Install polkit policy if present
  msg "Installing polkit policy..."
  if [ -f "$_appdir/cloud.lazycat.client.policy" ]; then
    install -Dm644 "$_appdir/cloud.lazycat.client.policy" \
      "$pkgdir/usr/share/polkit-1/actions/cloud.lazycat.client.policy"

    # Patch script paths in polkit policy to use system paths
    sed -i \
      -e 's|HOMEDIR|/usr/lib/lzc-client-desktop|g' \
      -e "s|/home/[^/]*/[^<]*|/usr/lib/lzc-client-desktop/lzc-client-desktop|g" \
      "$pkgdir/usr/share/polkit-1/actions/cloud.lazycat.client.policy"
  fi

  # 6. Handle capabilities
  # Note: Capabilities will be set during post_install via the .install script
  # This is the recommended approach for AUR packages

  # 7. Install license if present
  msg "Installing license..."
  for license_file in \
    "$_appdir/LICENSE" \
    "$_appdir/LICENSE.txt" \
    "$_appdir/COPYING"
  do
    if [ -f "$license_file" ]; then
      install -Dm644 "$license_file" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
      break
    fi
  done

  # Create a placeholder license file if none found
  if [ ! -f "$pkgdir/usr/share/licenses/$pkgname/LICENSE" ]; then
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<EOF
Proprietary software from Lazy Cat (lazycat.cloud)
License terms available at: https://lazycat.cloud/
EOF
  fi

  # 8. Remove any bundled setcap scripts to prevent self-modification
  rm -f "$pkgdir/usr/lib/lzc-client-desktop/set-capabilities.sh"

  # 9. Clean up unnecessary files from /usr/lib
  rm -f "$pkgdir/usr/lib/lzc-client-desktop"/*.desktop
  rm -f "$pkgdir/usr/lib/lzc-client-desktop"/*.policy
  rm -f "$pkgdir/usr/lib/lzc-client-desktop"/*.png
}
