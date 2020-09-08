# Maintainer: Teteros <teteros at teknik dot io>

pkgname=radium-bin
pkgver=6.2.91
pkgrel=1
pkgdesc='A graphical music editor. A next generation tracker. (Demo Version)'
arch=(x86_64)
url=https://users.notam04.no/~kjetism/radium
license=(GPL2)
provides=(radium)
conflicts=(radium)
groups=(pro-audio)
depends=(
  desktop-file-utils
  glu
  hicolor-icon-theme
  jack2
  libsm
  libxcomposite
  libxrender
  shared-mime-info
  ttf-bitstream-vera
)
optdepends=(
  'new-session-manager: for session management'
  'vst-plugins: more plugins'
)
options=(!strip)
source=("https://users.notam02.no/~kjetism/radium/demos/linux/radium_64bit_linux-$pkgver-demo.tar.xz")
sha256sums=('c726bd1310724f03c9ee4b67cdea0b4b4d076ac8e2cd17c02e2f0fc5d1e3b5c8')

package() {
  # Copy radium files to a self-contained /opt prefix
  mkdir -p "$pkgdir/opt/radium"
  cp -a radium_64bit_linux-$pkgver-demo/bin "$pkgdir/opt/radium"
  cp -a radium_64bit_linux-$pkgver-demo/lib "$pkgdir/opt/radium/"

  # Nouveau and AMD drivers require a newer libstdc++ than Radium provides so removing it is necessary to not crash
  rm "$pkgdir/opt/radium/lib/libstdc++.so.6"

  # Generate a dummy libselinux.so because official builds link to it for some reason
  echo "extern int is_selinux_enabled(void){return 0;}" > selinux-dummy.c
  gcc -s -shared -o "$pkgdir/opt/radium/lib/libselinux.so.1" selinux-dummy.c
  rm selinux-dummy.c

  # Create startup script similar to run_radium.sh
  mkdir -p "$pkgdir/usr/bin"
  echo '#!/usr/bin/env bash' > "$pkgdir/usr/bin/radium"
  echo LD_LIBRARY_PATH='"/opt/radium/lib:$LD_LIBRARY_PATH"' QT_QPA_PLATFORM_PLUGIN_PATH=/opt/radium/bin/qt5_plugins \
    /opt/radium/bin/radium '"$@"' >> "$pkgdir/usr/bin/radium"
  chmod +x "$pkgdir/usr/bin/radium"

  # Icons, .desktop and mimetype files
  mkdir -p "$pkgdir/usr/share/icons/hicolor/"{16x16,32x32,128x128,256x256}"/apps" \
    "$pkgdir/usr/share/applications" \
    "$pkgdir/usr/share/mime/packages"
  ln -s "/opt/radium/bin/radium_16x16x8.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/radium.png"
  ln -s "/opt/radium/bin/radium_32x32x24.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/radium.png"
  ln -s "/opt/radium/bin/radium_128x128x32.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/radium.png"
  ln -s "/opt/radium/bin/radium_256x256x32.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/radium.png"
  ln -s "/opt/radium/bin/radium.desktop" "$pkgdir/usr/share/applications/radium.desktop"
  ln -s "/opt/radium/bin/radium-mimetype.xml" "$pkgdir/usr/share/mime/packages/radium.xml"
}
