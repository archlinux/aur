# # Maintainer: Your Name <you@email.com>

# pkgname=picto_py
# pkgver=1.1.0
# pkgrel=1
# pkgdesc="PictoPy - Desktop image gallery (Tauri)"
# arch=('x86_64')
# url="https://github.com/AOSSIE-Org/PictoPy"
# license=('GPL3')

# depends=(
#   'gtk3'
#   'webkit2gtk'
#   'python'
# )
# makedepends=('binutils')

# source=("picto_py_${pkgver}_amd64.deb::https://github.com/tushar1977/PictoPy/releases/download/release/PictoPy_${pkgver}_amd64.deb")
# sha256sums=('SKIP')

# package() {
#   cd "$srcdir"

#   # Extract .deb
#   ar x "picto_py_${pkgver}_amd64.deb"
#   tar -xf data.tar.*

#   # Install filesystem
#   cp -r usr "$pkgdir/"
#   cp -r opt "$pkgdir/" 2>/dev/null || true

#   # --- Fix backend executable permissions (CRITICAL) ---
#   chmod +x "$pkgdir/usr/lib/PictoPy/resources/backend/PictoPy_Server"
#   chmod +x "$pkgdir/usr/lib/PictoPy/resources/sync-microservice/PictoPy_Sync"

#   # --- Wrapper launcher (fixes runtime permissions) ---
#   install -Dm755 /dev/stdin "$pkgdir/usr/bin/pictopy" <<'EOF'
# #!/bin/bash

# export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
# export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# APP_DATA="$XDG_DATA_HOME/PictoPy"
# APP_CACHE="$XDG_CACHE_HOME/PictoPy"

# mkdir -p "$APP_DATA" "$APP_CACHE"
# cd "$APP_DATA" || exit 1

# exec /opt/PictoPy/PictoPy "$@"
# EOF

#   # --- Desktop entry (single, clean) ---
#   rm -f "$pkgdir/usr/share/applications/PictoPy.desktop"

#   install -Dm644 /dev/stdin \
#     "$pkgdir/usr/share/applications/pictopy.desktop" <<EOF
# [Desktop Entry]
# Name=PictoPy
# Exec=picto_py
# Icon=PictoPy
# Type=Application
# Categories=Graphics;Utility;
# EOF
# }



# Maintainer: Your Name <you@email.com>

pkgname=picto_py
pkgver=1.1.0
pkgrel=2
pkgdesc="PictoPy - Desktop image gallery (Tauri/Python)"
arch=('x86_64')
url="https://github.com/AOSSIE-Org/PictoPy"
license=('GPL3')
depends=('gtk3' 'webkit2gtk' 'python' 'hicolor-icon-theme')
makedepends=('binutils' 'tar')
source=("${pkgname}-${pkgver}.deb::https://github.com/tushar1977/PictoPy/releases/download/release/PictoPy_${pkgver}_amd64.deb")
# Replace 'SKIP' with actual hash using: updpkgsums
sha256sums=('SKIP') 

prepare() {
  # Extract the debian control and data files
  ar x "picto_py-${pkgver}.deb"
  tar -xf data.tar.*
}

package() {
  # Install the main files extracted from the deb
  # Using 'cp -a' preserves permissions and directory structure
  cp -a usr "$pkgdir/"
  
  if [ -d "opt" ]; then
    cp -a opt "$pkgdir/"
  fi

  # Fix permissions for the backend binaries
  # Note: Adjust these paths if the .deb structure puts them elsewhere
  find "$pkgdir/usr/lib/PictoPy" -type f -name "PictoPy_*" -exec chmod +x {} +

  # Create a symlink or wrapper to the actual binary
  # If the app is in /opt/PictoPy/PictoPy, let's link it properly
  install -d "$pkgdir/usr/bin"
  ln -sf /opt/PictoPy/PictoPy "$pkgdir/usr/bin/pictopy"

  # Clean up and fix the Desktop Entry
  rm -rf "$pkgdir/usr/share/applications/PictoPy.desktop"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/pictopy.desktop" <<EOF
[Desktop Entry]
Name=PictoPy
Comment=Desktop image gallery
Exec=picto_py
Icon=PictoPy
Type=Application
Categories=Graphics;Utility;
Terminal=false
EOF
}