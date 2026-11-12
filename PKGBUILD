# Maintainer: Julianmb <julianmboruta@gmail.com>
# Generate .SRCINFO file: makepkg --printsrcinfo > .SRCINFO
pkgname=autosubsync-bin
pkgver=6.6
pkgrel=1
pkgdesc="Automatic subtitle synchronization tool."
arch=('x86_64')
url="https://github.com/denizsafak/AutoSubSync"
license=('GPL-3.0-or-later')
provides=('autosubsync')
depends=('fuse2' 'hicolor-icon-theme')
options=('!strip')

source=(
  "AutoSubSync-linux-amd64.AppImage::https://github.com/denizsafak/AutoSubSync/releases/download/v${pkgver}/AutoSubSync-linux-amd64.AppImage"
  "autosubsync.desktop"
)

sha256sums=(
  '9c8660e6e61482a8e44c7f62830b41763eaa13ad3f7aacef48170770f56fb84e'
  'b27664fad5e07c71d39b91234e8cd9d5127788e73b907bd9b78f2331ad5ee9fc'
)

package() {
  # Install AppImage to /opt (correct location for large self-contained packages)
  install -Dm755 "${srcdir}/AutoSubSync-linux-amd64.AppImage" "${pkgdir}/opt/autosubsync/AutoSubSync.AppImage"
  
  # Create wrapper script in /usr/bin (preferred over symlink)
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/assy" <<'EOF'
#!/bin/bash
exec /opt/autosubsync/AutoSubSync.AppImage "$@"
EOF

  # Install desktop entry
  install -Dm644 "autosubsync.desktop" "${pkgdir}/usr/share/applications/autosubsync.desktop"
  
  # Extract and install icon from AppImage
  cd "${srcdir}"
  chmod +x "AutoSubSync-linux-amd64.AppImage"
  ./AutoSubSync-linux-amd64.AppImage --appimage-extract autosubsync.png > /dev/null 2>&1 || true
  if [[ -f "squashfs-root/autosubsync.png" ]]; then
    install -Dm644 "squashfs-root/autosubsync.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/autosubsync.png"
  fi
  rm -rf squashfs-root
}
