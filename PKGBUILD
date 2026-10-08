pkgname=mangayomi-linux
pkgver=0.9.8
pkgrel=3
pkgdesc="Mangayomi - Manga, Anime and Novel reader (prebuilt Linux zip with QuickJS fix)"
arch=('x86_64')
url="https://github.com/kodjodevf/mangayomi"
license=('GPL3')

depends=('gtk3' 'webkit2gtk-4.1' 'mpv' 'libsoup3' 'libepoxy' 'alsa-lib' 'hicolor-icon-theme' 'cairo' 'pango' 'at-spi2-core' 'fontconfig' 'glib2' 'glibc' 'gcc-libs')
options=(!strip)
provides=('mangayomi')
conflicts=('mangayomi' 'mangayomi-bin' 'mangayomi-git')

source=(
  "https://github.com/kodjodevf/mangayomi/releases/download/v${pkgver}/Mangayomi-v${pkgver}-linux.zip"
  "https://raw.githubusercontent.com/fcanas/flutter_qjs/main/linux/libflutter_qjs_plugin.so"
)
sha256sums=('SKIP' 'SKIP')

package() {
  # 1) Directory app
  install -d "$pkgdir/opt/mangayomi"

  # 2) Copia contenuti dallo zip
  cp -r "$srcdir"/mangayomi "$srcdir"/data "$srcdir"/lib "$pkgdir/opt/mangayomi/"

  # 3) Patch: Sovrascrivi libflutter_qjs_plugin.so con la versione che esporta jsNewRuntime
  if [ -f "$srcdir/libflutter_qjs_plugin.so" ]; then
    cp "$srcdir/libflutter_qjs_plugin.so" "$pkgdir/opt/mangayomi/lib/libflutter_qjs_plugin.so"
  fi

  chmod 755 "$pkgdir/opt/mangayomi/mangayomi"
  chmod 755 "$pkgdir/opt/mangayomi/lib/"*.so

  # 4) Symlink eseguibile
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/mangayomi/mangayomi" "$pkgdir/usr/bin/mangayomi"

  # 5) Icona
  install -Dm644 \
    "$srcdir/data/flutter_assets/assets/app_icons/icon.png" \
    "$pkgdir/usr/share/pixmaps/mangayomi.png"

  # 6) Desktop Entry
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
