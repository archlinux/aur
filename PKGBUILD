# Maintainer: Caleb Grohs cgrohs@tutanota.com

pkgname=openbubbles-app-bin
pkgver=1.15.0+205
pkgrel=1
pkgdesc="OpenBubbles messaging app (precompiled Linux binary)"
arch=('x86_64')
url="https://github.com/OpenBubbles/openbubbles-app"
license=('Apache')
depends=(
  'gtk3'
  'libsecret'
  'libnotify'
  'libayatana-appindicator'
  'webkit2gtk-4.1'
  'mpv'
)
options=('!strip')

source=(
  "bluebubbles-linux-x86_64.tar::https://github.com/OpenBubbles/openbubbles-app/releases/download/v${pkgver}/bluebubbles-linux-x86_64.tar"
  "openbubbles.desktop"
)
sha256sums=(
  '5584a4e79dbd22fcf19b51fb6ff6426d7f132555677e1ae9d3421f04657b563a'
  '97d5cb42586b305757a29a4ff6d6026a7240fecacdd22e6f5ec87e27671e2a68'
)

package() {
  install -dm755 "$pkgdir/usr/lib/openbubbles-app"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"

  # Install binary + data
  install -m755 "$srcdir/bluebubbles" \
    "$pkgdir/usr/lib/openbubbles-app/bluebubbles"

  cp -r "$srcdir/data" \
    "$pkgdir/usr/lib/openbubbles-app/"

  cp -r "$srcdir/lib" \
    "$pkgdir/usr/lib/openbubbles-app/lib"

  # symlink mpv if needed
  if [[ ! -e "$pkgdir/usr/lib/openbubbles-app/lib/libmpv.so.1" && -e /usr/lib/libmpv.so.2 ]]; then
    ln -sf /usr/lib/libmpv.so.2 "$pkgdir/usr/lib/openbubbles-app/lib/libmpv.so.1"
  fi


  # Launcher with LD_LIBRARY_PATH
  cat > "$pkgdir/usr/bin/openbubbles" << 'EOF'
#!/bin/bash
APPDIR="/usr/lib/openbubbles-app"

export LD_LIBRARY_PATH="$APPDIR/lib:$APPDIR:${LD_LIBRARY_PATH}"
exec "$APPDIR/bluebubbles" "$@"
EOF

  chmod 755 "$pkgdir/usr/bin/openbubbles"

  # Desktop file
  install -m644 openbubbles.desktop \
    "$pkgdir/usr/share/applications/openbubbles.desktop"

  # Icon
  install -m644 \
    "$srcdir/data/flutter_assets/assets/icon/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/openbubbles.png"
}

