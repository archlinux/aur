# Maintainer: Gxstavo <gps5821s@outlook.com>
# Contributor: Gxstavo <gps5821s@outlook.com>
pkgname=spent-tracker
pkgver=0.1.0
pkgrel=2
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
sha256sums=('532c5a7806d2e0b543dbf0e61278c4889e2765f5f6e9a8af632dd9dd009b85ed')

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
  # Remove beforeBuildCommand to prevent tauri from re-compiling the server
  python3 -c "
import json
with open('src-tauri/tauri.conf.json') as f:
    cfg = json.load(f)
cfg['build'].pop('beforeDevCommand', None)
cfg['build'].pop('beforeBuildCommand', None)
with open('src-tauri/tauri.conf.json', 'w') as f:
    json.dump(cfg, f, indent=2)
"
}

build() {
  cd "$srcdir/spent-tracker-$pkgver"
  bun install
  # Compile the express server
  bun build --compile --target=bun-linux-x64 ./express/src/index.ts --outfile ./express/servidor 2>&1 | tail -2
  mkdir -p src-tauri/target/release
  cp express/servidor src-tauri/target/release/servidor
  # Build frontend
  bun run build
  # Build Tauri app (won't recompile server since we removed beforeBuildCommand)
  bunx tauri build --bundles deb,rpm 2>&1 | tail -5
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
