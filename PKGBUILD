# Maintainer: MapleProjects <eportillo898v2@gmail.com>
pkgname=animaple-git
pkgver=0.2.0
pkgrel=2
pkgdesc="Anime streaming app — Axum backend + web frontend"
arch=('x86_64')
url="https://github.com/MapleProjects/animaple"
license=('MIT')
depends=('gcc-libs' 'xdg-utils')
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

  # Wrapper script — starts server then opens browser
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/animaple" << 'WRAP'
#!/bin/sh
PORT=3939
URL="http://127.0.0.1:$PORT"

# Kill any existing instance
pkill -f "/usr/lib/animaple/animaple" 2>/dev/null
sleep 0.3

# Start server in background
cd /usr/share/animaple
/usr/lib/animaple/animaple &
PID=$!

# Wait for server to be ready
for i in $(seq 1 20); do
  curl -sf "$URL/api/recent" >/dev/null 2>&1 && break
  sleep 0.3
done

# Open browser
xdg-open "$URL" 2>/dev/null

echo "AniMaple running at $URL (PID $PID)"
echo "Press Ctrl+C to stop"

# Wait for server process
wait $PID
WRAP

  # Desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/animaple.desktop" << 'DESKTOP'
[Desktop Entry]
Name=AniMaple
Comment=Anime streaming app
Exec=animaple
Icon=video
Terminal=false
Type=Application
Categories=AudioVideo;Video;TV;
DESKTOP

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/animaple/LICENSE" 2>/dev/null || true
}
