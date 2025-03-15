# Maintainer: Andre LECLERCQ <andre.leclercq.io@protonmail.com>

# -------------------- #
# Package Informations #
# -------------------- #
pkgname=clickup-desktop
pkgver=3.5.87
pkgrel=1
pkgdesc="All-in-one collaboration and project management tool"
arch=('x86_64')
url="https://clickup.com/"
license=('custom:proprietary')

# Package Options
options=(!strip)

# Dependencies
depends=(
  'gtk3'
  'nss'
  'alsa-lib'
  'xdg-utils'
  'libxcb'
  'libsecret'
  'libxss'
  'fuse2'
)

optdepends=(
  'libnotify'
  'libappindicator-gtk3'
)

# Retrieve latest version from the downloaded AppImage filename
pkgver() {
  local response=$(curl -s -L -D - \
    -m 5 \
    --max-filesize 1M \
    --range 0-1024 \
    "https://desktop.clickup.com/linux" \
    -o /dev/null)

  if [[ $response =~ filename=\"desktop-([0-9]+\.[0-9]+\.[0-9]+) ]]; then
    echo "${BASH_REMATCH[1]}"
  else
    echo "$pkgver"
  fi
}

# ----------------- #
# Download AppImage #
# ----------------- #
source=(
  "clickup-desktop.AppImage::https://desktop.clickup.com/linux"
  "clickup-wrapper"
  "clickup.desktop"
)
noextract=("clickup-desktop.AppImage")
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

# Get Icon
prepare() {
  cd "$srcdir"
  chmod +x clickup-desktop.AppImage
  ./clickup-desktop.AppImage --appimage-extract usr/share/icons
}

# -------------------- #
# Package Installation #
# -------------------- #
package() {
  # Create installation directory
  install -dm755 "$pkgdir/opt/clickup"
  install -dm755 "$pkgdir/usr/share/icons"

  # Install AppImage with execute permissions
  install -Dm755 "clickup-desktop.AppImage" "$pkgdir/opt/clickup/clickup-desktop.AppImage"

  # Install Icon and clean
  cp -r squashfs-root/usr/share/icons/* "$pkgdir/usr/share/icons/"
  chmod -R 755 "$pkgdir/usr/share/icons"
  rm -rf squashfs-root
  
  # Ensure AppImage is executable
  chmod 755 "$pkgdir/opt/clickup/clickup-desktop.AppImage"

  # Install wrapper script
  install -Dm755 "$srcdir/clickup-wrapper" "$pkgdir/usr/bin/clickup"

  # Install desktop file
  install -Dm644 "$srcdir/clickup.desktop" "$pkgdir/usr/share/applications/clickup.desktop"  
}
