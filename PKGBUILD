pkgname=mangayomi-appimage
pkgver=0.6.90
pkgrel=1
pkgdesc="Mangayomi - Manga, Anime and Novel reader (AppImage)"
arch=('x86_64')
url="https://github.com/kodjodevf/mangayomi"
license=('GPL3')
depends=('fuse2')
options=(!strip)
provides=('mangayomi')
conflicts=('mangayomi' 'mangayomi-git')

source=("Mangayomi.AppImage::https://github.com/kodjodevf/mangayomi/releases/download/v${pkgver}/Mangayomi-v${pkgver}-linux.AppImage")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir"
  rm -rf squashfs-root

  chmod +x Mangayomi.AppImage
  ./Mangayomi.AppImage --appimage-extract >/dev/null
}

package() {
  # AppImage
  install -Dm755 "$srcdir/Mangayomi.AppImage" "$pkgdir/opt/mangayomi/mangayomi.AppImage"

  # Desktop entry
  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/applications/mangayomi.desktop" <<'EOF'
[Desktop Entry]
Name=Mangayomi
Exec=/opt/mangayomi/mangayomi.AppImage
Icon=mangayomi
Type=Application
Categories=AudioVideo;Video;
Terminal=false
EOF

  # Icona (sceglie automaticamente la migliore disponibile)
  local icon_src=""
  icon_src="$(find "$srcdir/squashfs-root" -type f \
      \( -path "*/icons/hicolor/*/apps/*" -o -path "*/pixmaps/*" \) \
      \( -iname "*mangayomi*.png" -o -iname "*mangayomi*.svg" \) \
      -print 2>/dev/null \
    | head -n 1)"

  # fallback: PNG più grande
  if [[ -z "$icon_src" ]]; then
    icon_src="$(find "$srcdir/squashfs-root" -type f -iname "*.png" -printf "%s %p\n" 2>/dev/null \
      | sort -nr | head -n 1 | cut -d' ' -f2-)"
  fi

  if [[ -n "$icon_src" ]]; then
    # mettiamo sempre il nome "mangayomi" in hicolor, così Icon=mangayomi funziona ovunque
    install -Dm644 "$icon_src" "$pkgdir/usr/share/icons/hicolor/512x512/apps/mangayomi.png"
  fi
}
