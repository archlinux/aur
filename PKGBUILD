pkgname=mangayomi-linux
pkgver=0.9.8
pkgrel=6
pkgdesc="Mangayomi - Manga, Anime and Novel reader (prebuilt Linux zip with fixed QuickJS)"
arch=('x86_64')
url="https://github.com/kodjodevf/mangayomi"
license=('GPL3')

depends=('gtk3' 'webkit2gtk-4.1' 'mpv' 'libsoup3' 'libepoxy' 'alsa-lib' 'hicolor-icon-theme' 'cairo' 'pango' 'at-spi2-core' 'fontconfig' 'glib2' 'glibc' 'gcc-libs')
makedepends=('git' 'cmake' 'ninja' 'gcc')
options=(!strip)
provides=('mangayomi')
conflicts=('mangayomi' 'mangayomi-bin' 'mangayomi-git')

# Disabilita qualsiasi prompt di autenticazione o credenziali per Git durante makepkg
export GIT_TERMINAL_PROMPT=0
export GIT_ASKPASS=true

source=(
  "https://github.com/kodjodevf/mangayomi/releases/download/v${pkgver}/Mangayomi-v${pkgver}-linux.zip"
  "flutter_qjs::git+https://github.com/fcanas/flutter_qjs.git#branch=main"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

build() {
  cd "$srcdir/flutter_qjs/linux"
  mkdir -p build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make -j$(nproc)
}

package() {
  # 1) Directory app
  install -d "$pkgdir/opt/mangayomi"

  # 2) Copia i file estratti dallo zip
  cp -r "$srcdir/mangayomi" "$srcdir/data" "$srcdir/lib" "$pkgdir/opt/mangayomi/"

  # 3) Sovrascrivi la libreria con quella ricompilata
  install -m755 "$srcdir/flutter_qjs/linux/build/libflutter_qjs_plugin.so" \
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
