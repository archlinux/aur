# Maintainer: MapleProjects <eportillo898v2@gmail.com>
pkgname=animaple-git
pkgver=r28.883db61
pkgrel=1
pkgdesc="Anime streaming app — Axum backend + web frontend"
arch=('x86_64')
url="https://github.com/MapleProjects/animaple"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust' 'cargo')
provides=('animaple')
conflicts=('animaple')
source=('git+https://github.com/MapleProjects/animaple.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/animaple"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/animaple"
  cargo fetch --target "$CARCH-unknown-linux-gnu" 2>/dev/null || true
}

build() {
  cd "$srcdir/animaple"
  cargo build --release
}

package() {
  cd "$srcdir/animaple"

  # Install binary to lib
  install -Dm755 target/release/animaple "$pkgdir/usr/lib/animaple/animaple"

  # Static frontend files
  install -dm755 "$pkgdir/usr/share/animaple"
  cp -r static/* "$pkgdir/usr/share/animaple/"

  # Wrapper script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/animaple" << 'WRAP'
#!/bin/sh
cd /usr/share/animaple
exec /usr/lib/animaple/animaple "$@"
WRAP

  # Desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/animaple.desktop" << 'DESKTOP'
[Desktop Entry]
Name=AniMaple
Comment=Anime streaming app
Exec=animaple
Icon=video
Terminal=true
Type=Application
Categories=AudioVideo;Video;TV;
DESKTOP

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/animaple/LICENSE" 2>/dev/null || true
}
