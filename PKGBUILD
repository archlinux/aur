pkgname=mangayomi-linux
pkgver=0.9.8
pkgrel=4
pkgdesc="Mangayomi - Manga, Anime and Novel reader (prebuilt Linux zip)"
arch=('x86_64')
url="https://github.com/kodjodevf/mangayomi"
license=('GPL3')

depends=('gtk3' 'webkit2gtk-4.1' 'mpv' 'libsoup3' 'libepoxy' 'alsa-lib' 'hicolor-icon-theme' 'cairo' 'pango' 'at-spi2-core' 'fontconfig' 'glib2' 'glibc' 'gcc-libs')
options=(!strip)
provides=('mangayomi')
conflicts=('mangayomi' 'mangayomi-bin' 'mangayomi-git')

source=("https://github.com/kodjodevf/mangayomi/releases/download/v${pkgver}/Mangayomi-v${pkgver}-linux.zip")
sha256sums=('SKIP')

package() {
  # 1) Directory app
  install -d "$pkgdir/opt/mangayomi"

  # 2) Copia i file estratti
  cp -r "$srcdir/mangayomi" "$srcdir/data" "$srcdir/lib" "$pkgdir/opt/mangayomi/"

  chmod 755 "$pkgdir/opt/mangayomi/mangayomi"
  chmod 755 "$pkgdir/opt/mangayomi/lib/"*.so

  # 3) Wrapper script per avviare l'app nella sua directory
  install -d "$pkgdir/usr/bin"
  cat <<'EOF' > "$pkgdir/usr/bin/mangayomi"
#!/bin/sh
export LD_LIBRARY_PATH="/opt/mangayomi/lib:${LD_LIBRARY_PATH}"
cd /opt/mangayomi
exec ./mangayomi "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/mangayomi"

  # 4) Icona
  install -Dm644 \
    "$srcdir/data/flutter_assets/assets/app_icons/icon.png" \
    "$pkgdir/usr/share/pixmaps/mangayomi.png"

  # 5) Desktop entry
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
