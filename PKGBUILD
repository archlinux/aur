# Maintainer: fraa2a <fraa2a@users.noreply.github.com>
# AUR binary package for Mango Launcher
# https://aur.archlinux.org/packages/mango-launcher-bin

pkgname=mango-launcher-bin
pkgver=2.1.8
pkgrel=1
pkgdesc="Mango Launcher - An open-source gaming platform"
arch=('x86_64')
url="https://github.com/fraa2a/mango-launcher"
license=('MIT')
depends=(
  'electron'
  'libappindicator-gtk3'
  'libnotify'
  'ttf-font'
)
conflicts=('mangolauncher' 'mangolauncher-bin')
provides=('mangolauncher')
source=(
  "https://github.com/fraa2a/mango-launcher/releases/download/v${pkgver}/mango-launcher-${pkgver}.tar.gz"
  "https://raw.githubusercontent.com/fraa2a/mango-launcher/v${pkgver}/build/icons/512x512.png"
)
sha256sums=('SKIP' 'SKIP')

package() {
  install -d "$pkgdir/opt/mango-launcher"
  tar -xzf "$srcdir/mango-launcher-${pkgver}.tar.gz" --strip-components=1 -C "$pkgdir/opt/mango-launcher"

  find "$pkgdir/opt/mango-launcher" -type f \( -name "*.so*" -o -name "mango-launcher" \) -exec chmod 755 {} \;

  install -d "$pkgdir/usr/bin"
  ln -sf "/opt/mango-launcher/mango-launcher" "$pkgdir/usr/bin/mangolauncher"

  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/mangolauncher.desktop" << EOF
[Desktop Entry]
Name=Mango Launcher
Comment=Gaming platform
Exec=/opt/mango-launcher/mango-launcher %U
Icon=mangolauncher
Terminal=false
Type=Application
Categories=Game;
StartupWMClass=Mango Launcher
MimeType=application/x-mango-custom-download-source;
EOF

  install -d "$pkgdir/usr/share/mime/packages"
  cat > "$pkgdir/usr/share/mime/packages/mangolauncher.xml" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/x-mango-custom-download-source">
    <comment>Mango Custom Download Source</comment>
    <glob pattern="*.mangocds"/>
    <sub-class-of type="application/json"/>
  </mime-type>
</mime-info>
EOF

  install -d "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  install -m644 "$srcdir/512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/mangolauncher.png"
}

post_install() {
  # Electron needs a SUID chrome-sandbox unless the kernel supports user namespaces.
  if ! { [[ -L /proc/self/ns/user ]] && unshare --user true; }; then
    chown root:root /opt/mango-launcher/chrome-sandbox
    chmod 4755 /opt/mango-launcher/chrome-sandbox
  fi
  update-mime-database /usr/share/mime
  update-desktop-database /usr/share/applications
  gtk-update-icon-cache /usr/share/icons/hicolor
}

post_upgrade() {
  post_install
}

post_remove() {
  post_install
}
