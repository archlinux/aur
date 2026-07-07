# Maintainer: MapleProjects <eportillo898v2@gmail.com>
pkgname=animaple-git
pkgver=r23.5d8c54f
pkgrel=1
pkgdesc="Anime streaming app — Flutter cross-platform client"
arch=('x86_64')
url="https://github.com/MapleProjects/AniMaple"
license=('MIT')
depends=('gtk3' 'mpv' 'xdg-utils')
makedepends=('git' 'cmake' 'ninja' 'clang' 'pkg-config')
provides=('animaple')
conflicts=('animaple')
source=('git+https://github.com/MapleProjects/AniMaple.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/AniMaple"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/AniMaple"
  # flutter installed manually at /opt/flutter — ensure it's in PATH
  export PATH="/opt/flutter/bin:$PATH"
  flutter build linux --release
}

package() {
  cd "$srcdir/AniMaple"

  # Install the entire Flutter bundle
  local bundle="build/linux/x64/release/bundle"
  install -dm755 "$pkgdir/usr/lib/animaple"
  cp -r "$bundle/"* "$pkgdir/usr/lib/animaple/"

  # Wrapper script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/animaple" << 'WRAP'
#!/bin/sh
exec /usr/lib/animaple/animaple "$@"
WRAP

  # Desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/animaple.desktop" << 'DESKTOP'
[Desktop Entry]
Name=AniMaple
Comment=Anime streaming app
Exec=animaple
Icon=animaple
Terminal=false
Type=Application
Categories=AudioVideo;Video;TV;
DESKTOP

  # Icon (pixmaps + hicolor theme)
  install -Dm644 assets/icon.png "$pkgdir/usr/share/pixmaps/animaple.png"
  for size in 48 64 128 256 512; do
    install -Dm644 assets/icon.png "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/animaple.png"
  done

  # License (if exists)
  [ -f LICENSE ] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/animaple/LICENSE" || true
}
