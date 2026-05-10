# Maintainer: Gxstavo <gps5821s@outlook.com>
# Contributor: Gxstavo <gps5821s@outlook.com>
pkgname=spent-tracker
pkgver=0.1.0
pkgrel=1
pkgdesc="A personal expense tracker desktop app built with Tauri"
arch=('x86_64')
url="https://github.com/Gxstavo-dev/spent"
license=('MIT')
options=('!strip')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libsoup3'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'pango'
  'gcc-libs'
)
makedepends=('cargo' 'bun' 'python')
source=("spent-tracker-$pkgver.tar.gz::https://github.com/Gxstavo-dev/spent/archive/v$pkgver.tar.gz")
sha256sums=('fa58019a8a8c1b5b5cfc7927bd77c9b8b33d6688e34f2674786816b17cf69f74')

prepare() {
  cd "$srcdir/spent-tracker-$pkgver"
  python3 -c "
import struct, zlib
def create_png(w, h):
    raw = b''
    for y in range(h):
        raw += b'\x00'
        for x in range(w):
            raw += struct.pack('BBBB', 50, 120, 200, 255)
    compressed = zlib.compress(raw)
    def chunk(t, d):
        return struct.pack('>I', len(d)) + t + d + struct.pack('>I', zlib.crc32(t + d) & 0xffffffff)
    ihdr = struct.pack('>IIBBBBB', w, h, 8, 6, 0, 0, 0)
    return b'\x89PNG\r\n\x1a\n' + chunk(b'IHDR', ihdr) + chunk(b'IDAT', compressed) + chunk(b'IEND', b'')
with open('src-tauri/icon.png', 'wb') as f:
    f.write(create_png(256, 256))
"
}

build() {
  cd "$srcdir/spent-tracker-$pkgver"
  bun install
  bunx tauri build
}

package() {
  cd "$srcdir/spent-tracker-$pkgver/src-tauri/target/release"
  install -Dm755 "spent" "$pkgdir/usr/bin/spent"
  install -Dm755 "servidor" "$pkgdir/usr/bin/servidor"
  install -Dm644 "$srcdir/spent-tracker-$pkgver/src-tauri/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/spent.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/spent.desktop" <<EOF
[Desktop Entry]
Categories=Finance;Utility;
Comment=A personal expense tracker
Exec=spent
StartupWMClass=spent
Icon=spent
Name=spent
Terminal=false
Type=Application
EOF
}
