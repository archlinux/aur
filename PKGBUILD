# Maintainer: Bryan Rafael <brthy467@gmail.com>

pkgname=synca-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Simple, lightweight, open source file synchronization client (prebuilt AppImage)"
arch=('x86_64')
url="https://github.com/bryanrafaelbueno/Synca"
license=('MIT')
depends=('glibc' 'zlib' 'fuse2')
provides=('synca')
conflicts=('synca')
options=(!strip)

_appimage="Synca-x86_64.AppImage"

source=(
  "$_appimage::https://github.com/bryanrafaelbueno/Synca/releases/download/$pkgver/$_appimage"
)
sha256sums=('4490bf12ecfe01b7367763ee674cc69cf16c4cff2db6bf6692468669312eff70')

prepare() {
  cd "$srcdir"

  chmod +x "$_appimage"

  # Extrai o AppImage
  "./$_appimage" --appimage-extract
}

package() {
  cd "$srcdir/squashfs-root"

  # Binário principal
  install -Dm755 "AppRun" \
    "$pkgdir/usr/bin/synca"

  # Desktop entry (corrige Exec)
  if [ -f "Synca.desktop" ]; then
    sed -i 's|Exec=.*|Exec=synca|' "Synca.desktop"
    install -Dm644 "Synca.desktop" \
      "$pkgdir/usr/share/applications/Synca.desktop"
  fi

  # Ícones (instala se existirem)
  for size in 32 64 128 256 512; do
    icon_path="usr/share/icons/hicolor/${size}x${size}/apps/synca.png"
    if [ -f "$icon_path" ]; then
      install -Dm644 "$icon_path" \
        "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/synca.png"
    fi
  done

  # Licença
  if [ -f "usr/share/licenses/synca/LICENSE" ]; then
    install -Dm644 "usr/share/licenses/synca/LICENSE" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  elif [ -f "LICENSE" ]; then
    install -Dm644 "LICENSE" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
