# Maintainer: jeryd leuck <jerydleuck@gmail.com>
pkgname=synology-chat-client-bin
pkgver=1.2.3_0232
_pkgver=1.2.3-0232
pkgrel=1
pkgdesc="Desktop client for Synology Chat"
arch=('x86_64')
url="https://www.synology.com/dsm/feature/chat"
license=('custom:Synology')
depends=('alsa-lib' 'at-spi2-core' 'atk' 'cairo' 'dbus' 'desktop-file-utils' 'expat' 'gcc-libs' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxkbcommon' 'libxrandr' 'libxrender' 'libxshmfence' 'libxss' 'libxtst' 'mesa' 'nss' 'pango')
optdepends=('libappindicator-gtk3: Status tray icon support')
provides=("synology-chat=${pkgver}")
conflicts=('synology-chat')
options=('!strip' '!debug')
filename="Synology_Chat_Client-${_pkgver}.deb"
source=("$filename::https://global.synologydownload.com/download/Utility/ChatClient/${_pkgver}/Ubuntu/x86_64/Synology%20Chat%20Client-${_pkgver}.deb")
sha256sums=('92bf9e650de82556f0959dd1c6923a0134c515c464095ef7c26210cf8ccc5161')

check() {
  echo "Checking for broken library links..."
  find "$pkgdir/opt/Synology Chat" -type f -executable -exec sh -c 'file "$1" | grep -q ELF' _ {} \; -print | while read -r elf; do
    if ldd "$elf" | grep -q "not found"; then
      echo "ERROR: Broken dependencies in $elf:"
      ldd "$elf" | grep "not found"
      exit 1
    fi
  done
}

package() {
  # Extract data.tar.xz from the debian package
  bsdtar -xOf "$srcdir/$filename" data.tar.xz | bsdtar -C "$pkgdir" -x

  # Fix permissions for chrome-sandbox (required for Electron sandboxing)
  chmod 4755 "$pkgdir/opt/Synology Chat/chrome-sandbox"

  # Create symlink for terminal access
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/Synology Chat/synochat" "$pkgdir/usr/bin/synology-chat"

  # Rename desktop file and fix Name/Icon
  # This ensures it shows as "Synology Chat Client" in the launcher
  mv "$pkgdir/usr/share/applications/synochat.desktop" "$pkgdir/usr/share/applications/synology-chat.desktop"
  sed -i 's/^Name=.*/Name=Synology Chat Client/' "$pkgdir/usr/share/applications/synology-chat.desktop"
  sed -i 's/^Icon=.*/Icon=synology-chat/' "$pkgdir/usr/share/applications/synology-chat.desktop"

  # Rename icons for consistency
  for size in 16x16 32x32 48x48 64x64 128x128 256x256 512x512; do
    mv "$pkgdir/usr/share/icons/hicolor/${size}/apps/synochat.png" "$pkgdir/usr/share/icons/hicolor/${size}/apps/synology-chat.png"
  done

  # Install Licenses
  install -Dm644 "$pkgdir/opt/Synology Chat/LICENSE.electron.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron"
  install -Dm644 "$pkgdir/opt/Synology Chat/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
