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
  # 1) AppImage in /opt
  install -Dm755 "$srcdir/Mangayomi.AppImage" \
    "$pkgdir/opt/mangayomi/mangayomi.AppImage"

  # 2) Icona (stile mangayomi-bin): installa in /usr/share/pixmaps
  # Prova prima un percorso "tipo flutter" se esiste, poi fallback al PNG più grande
  local icon_src=""

  # Tentativo "flutter-like" (non sempre esiste nell'AppImage, ma se c'è è perfetto)
  if [[ -f "$srcdir/squashfs-root/data/flutter_assets/assets/app_icons/icon.png" ]]; then
    icon_src="$srcdir/squashfs-root/data/flutter_assets/assets/app_icons/icon.png"
  fi

  # Fallback: trova un'icona sensata nel filesystem estratto (hicolor/pixmaps)
  if [[ -z "$icon_src" ]]; then
    icon_src="$(find "$srcdir/squashfs-root" -type f \
      \( -path "*/icons/hicolor/*/apps/*" -o -path "*/pixmaps/*" \) \
      \( -iname "*mangayomi*.png" -o -iname "icon.png" -o -iname "*.svg" \) \
      -print 2>/dev/null | head -n 1)"
  fi

  # Ultimo fallback: PNG più grande disponibile
  if [[ -z "$icon_src" ]]; then
    icon_src="$(find "$srcdir/squashfs-root" -type f -iname "*.png" -printf "%s %p\n" 2>/dev/null \
      | sort -nr | head -n 1 | cut -d' ' -f2-)"
  fi

  # Installa se trovata
  if [[ -n "$icon_src" ]]; then
    install -Dm644 "$icon_src" "$pkgdir/usr/share/pixmaps/mangayomi.png"
  fi

  # 3) Desktop entry (Icon=mangayomi => trova /usr/share/pixmaps/mangayomi.png)
  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/applications/mangayomi.desktop" <<'EOF'
[Desktop Entry]
Name=Mangayomi
Exec=/opt/mangayomi/mangayomi.AppImage
Icon=mangayomi
Type=Application
Categories=Graphics;Viewer;
Terminal=false
EOF
}
