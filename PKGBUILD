# Maintainer: yagopop <yagopop42@gmail.com>

pkgname=komet-bin
pkgver=0.5.0_dev.23
pkgrel=1
pkgdesc="Multifunctional MAX client (prebuilt Flutter desktop application)"
arch=('x86_64')
url="https://github.com/KometTeam/Komet"
license=('GPL-3.0-only')

depends=(
  'at-spi2-core'
  'cairo'
  'fontconfig'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'harfbuzz'
  'libdrm'
  'libepoxy'
  'libogg'
  'libsecret'
  'libx11'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxrandr'
  'mesa'
  'mpv'
  'opus'
  'pango'
  'sdl2'
  'zlib'
)
makedepends=('patchelf')

provides=("komet=${pkgver}")
conflicts=('komet')

options=('!debug')

source=(
  "https://github.com/KometTeam/Komet/releases/download/v${pkgver//_/-}/Komet-linux-x64.tar.gz"
)

sha256sums=(
  'b9fcce27562674fa490347c52f146233fe35f663bde43fbb58c7ec0b1162c687'
)

package() {
  cd "$srcdir"

  # Install the complete Flutter bundle
  install -d "$pkgdir/usr/lib/komet"
  cp -a Komet data lib "$pkgdir/usr/lib/komet/"

  # Fix upstream build-time RUNPATHs
  for lib in "$pkgdir"/usr/lib/komet/lib/*_plugin.so; do
      [[ -f "$lib" ]] || continue
      patchelf --set-rpath '$ORIGIN' "$lib"
  done

  # Executable symlink
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/komet/Komet "$pkgdir/usr/bin/komet"

  # Desktop entry
  install -Dm644 /dev/null \
    "$pkgdir/usr/share/applications/komet.desktop"

  cat > "$pkgdir/usr/share/applications/komet.desktop" <<'EOF'
[Desktop Entry]
Name=Komet
Comment=Multifunctional MAX client
Exec=komet
Icon=komet
Type=Application
Terminal=false
Categories=Network;InstantMessaging;
EOF

  # Application icon
  install -Dm644 \
    "$srcdir/data/flutter_assets/assets/komet_icon.png" \
    "$pkgdir/usr/share/pixmaps/komet.png"
}
