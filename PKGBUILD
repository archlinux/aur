# Maintainer: Psychotoxic <psychotoxic@gmx.de>
pkgname=psysonic
pkgver=1.18.0
pkgrel=1
pkgdesc="Desktop music player for Subsonic API-compatible servers (Navidrome, Gonic, etc.)"
arch=('x86_64')
url="https://github.com/Psychotoxical/psysonic"
license=('GPL-3.0-only')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libayatana-appindicator'
  'openssl'
  'alsa-lib'
)
makedepends=(
  'npm'
  'rust'
  'cargo'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Psychotoxical/psysonic/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "psysonic-$pkgver"

  export CARGO_HOME="$srcdir/cargo-home"
  export npm_config_cache="$srcdir/npm-cache"

  npm install
  npm run tauri:build -- --no-bundle
}

package() {
  cd "psysonic-$pkgver"

  # Binary (in /usr/lib to make room for the wrapper)
  install -Dm755 "src-tauri/target/release/psysonic" "$pkgdir/usr/lib/psysonic/psysonic"

  # Wrapper script that sets necessary env vars for WebKitGTK on Wayland
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/psysonic" <<EOF
#!/bin/sh
export GDK_BACKEND=x11
export WEBKIT_DISABLE_COMPOSITING_MODE=1
export WEBKIT_DISABLE_DMABUF_RENDERER=1
exec /usr/lib/psysonic/psysonic "\$@"
EOF

  # Desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/psysonic.desktop" <<EOF
[Desktop Entry]
Name=Psysonic
Comment=Desktop music player for Subsonic API-compatible servers
Exec=psysonic
Icon=psysonic
Terminal=false
Type=Application
Categories=AudioVideo;Audio;Music;Player;
EOF

  # Icons
  install -Dm644 "src-tauri/icons/32x32.png"      "$pkgdir/usr/share/icons/hicolor/32x32/apps/psysonic.png"
  install -Dm644 "src-tauri/icons/128x128.png"    "$pkgdir/usr/share/icons/hicolor/128x128/apps/psysonic.png"
  install -Dm644 "src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/psysonic.png"
}
