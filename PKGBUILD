# Maintainer: Felitendo
# Contributor: alan <75907296+alan7383@users.noreply.github.com>
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=anker-launcher-bin
_pkgname=anker-launcher
pkgver=0.1.29
pkgrel=1
pkgdesc="Desktop client for AnkerGames (upstream AppImage)"
arch=('x86_64')
url="https://github.com/zororver/anker-launcher"
license=('LicenseRef-proprietary')
# The AppImage bundles WebKitGTK, GTK3, GLib, libsoup, aria2, and ludusavi;
# these are the base system libraries needed to run the AppRun runtime and launcher.
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libglvnd' 'libx11' 'libxcb' 'zlib')
optdepends=('xdg-utils: desktop integration and browser URL opening')
provides=("anker-launcher=${pkgver}")
conflicts=('anker-launcher')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/AnkerLauncher-${pkgver}-x86_64.AppImage")
noextract=("${pkgname}-${pkgver}.AppImage")
sha256sums=('207025902af929a301e221edf25e1c20685f115adeca1816dcca4c696f03c147')

prepare() {
  chmod +x "$srcdir/${pkgname}-${pkgver}.AppImage"
  "$srcdir/${pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
}

package() {
  local _root="$srcdir/squashfs-root"

  # Upstream's AppImage payload, installed into /opt
  install -d "$pkgdir/opt/$pkgname"
  cp -a "$_root/." "$pkgdir/opt/$pkgname/"
  rm -f "$pkgdir/opt/$pkgname/.DirIcon"
  # Fix AppImage extracted permissions (directories can be 700)
  chmod -R u=rwX,go=rX "$pkgdir/opt/$pkgname"
  find "$pkgdir/opt/$pkgname" -type d -empty -delete

  # Binary launcher wrapper in /usr/bin
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/anker-launcher" << EOF
#!/bin/sh
exec /opt/$pkgname/AppRun "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/anker-launcher"

  # Desktop integration
  install -Dm644 "$_root/usr/share/applications/Anker Launcher.desktop" \
    "$pkgdir/usr/share/applications/anker-launcher.desktop"
  sed -i \
    -e 's|^Categories=.*|Categories=Game;Utility;|' \
    -e 's|^Comment=.*|Comment=Desktop client for AnkerGames|' \
    -e 's|^Exec=.*|Exec=anker-launcher %u|' \
    -e '/^X-AppImage-/d' \
    "$pkgdir/usr/share/applications/anker-launcher.desktop"
  echo "MimeType=x-scheme-handler/ankergames;" >> "$pkgdir/usr/share/applications/anker-launcher.desktop"

  # Icons
  install -Dm644 "$_root/usr/share/icons/hicolor/32x32/apps/anker-launcher.png" \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/anker-launcher.png"
  install -Dm644 "$_root/usr/share/icons/hicolor/128x128/apps/anker-launcher.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/anker-launcher.png"
  install -Dm644 "$_root/Anker Launcher.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/anker-launcher.png"
  install -Dm644 "$_root/usr/share/icons/hicolor/256x256@2/apps/anker-launcher.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/anker-launcher.png"

  # Licenses and Notices
  install -Dm644 "$_root/usr/lib/Anker Launcher/THIRD-PARTY-NOTICES.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.txt"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" << 'EOF'
Anker Launcher is proprietary software, distributed by AnkerGames.

It is not covered by an open-source licence: use is governed by the terms
published by AnkerGames (https://ankergames.net).

Third-party components and their licences are detailed in THIRD-PARTY-NOTICES.txt.
EOF
}
