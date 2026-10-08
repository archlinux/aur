pkgname=mangayomi-linux
pkgver=0.9.8
pkgrel=7
pkgdesc="Mangayomi - Manga, Anime and Novel reader (prebuilt zip with AppImage QuickJS fix)"
arch=('x86_64')
url="https://github.com/kodjodevf/mangayomi"
license=('GPL3')

depends=('gtk3' 'webkit2gtk-4.1' 'mpv' 'libsoup3' 'libepoxy' 'alsa-lib' 'hicolor-icon-theme' 'cairo' 'pango' 'at-spi2-core' 'fontconfig' 'glib2' 'glibc' 'gcc-libs')
makedepends=('squashfs-tools')
options=(!strip)
provides=('mangayomi')
conflicts=('mangayomi' 'mangayomi-bin' 'mangayomi-git')

source=(
  "https://github.com/kodjodevf/mangayomi/releases/download/v${pkgver}/Mangayomi-v${pkgver}-linux.zip"
  "https://github.com/kodjodevf/mangayomi/releases/download/v${pkgver}/Mangayomi-v${pkgver}-linux-x86_64.AppImage"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  cd "$srcdir"
  chmod +x "Mangayomi-v${pkgver}-linux-x86_64.AppImage"
  ./"Mangayomi-v${pkgver}-linux-x86_64.AppImage" --appimage-extract > /dev/null
}

package() {
  # 1) Directory app
  install -d "$pkgdir/opt/mangayomi"

  # 2) Copia i file estratte dallo zip
  cp -r "$srcdir/mangayomi" "$srcdir/data" "$srcdir/lib" "$pkgdir/opt/mangayomi/"

  # 3) Sovrascrivi il file .so difettoso con quello estratto dall'AppImage
  install -m755 "$srcdir/squashfs-root/lib/libflutter_qjs_plugin.so" \
    "$pkgdir/opt/mangayomi/lib/libflutter_qjs_plugin.so"

  chmod 755 "$pkgdir/opt/mangayomi/mangayomi"
  chmod 755 "$pkgdir/opt/mangayomi/lib/"*.so

  # 4) Wrapper script
  install -d "$pkgdir/usr/bin"
  cat <<'EOF' > "$pkgdir/usr/bin/mangayomi"
#!/bin/sh
export LD_LIBRARY_PATH="/opt/mangayomi/lib:${LD_LIBRARY_PATH}"
cd /opt/mangayomi
exec ./mangayomi "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/mangayomi"

  # 5) Icona
  install -Dm644 \
    "$srcdir/data/flutter_assets/assets/app_icons/icon.png" \
    "$pkgdir/usr/share/pixmaps/mangayomi.png"

  # 6) Desktop entry
  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/applications/mangayomi.desktop" <<EOF
[Desktop Entry]
Name=Mangayomi
Comment=Manga, Anime and Novel reader
Exec=mangayomi
Icon=mangayomi
Type=Application
Categories=Graphics;Viewer;
Terminal=false
EOF
}
