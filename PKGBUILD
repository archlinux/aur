# Maintainer: Coobyk <coobyk@github>

pkgname=gpu-screen-recorder-qt
pkgver=5.7.9
pkgrel=1
pkgdesc="Qt6 UI for gpu-screen-recorder"
arch=('x86_64')
url="https://github.com/Coobyk/gpu-screen-recorder-qt"
license=('GPL3')
depends=(
    'gpu-screen-recorder'
    'qt6-base'
)
makedepends=('cmake')
provides=('gpu-screen-recorder-gtk')
conflicts=('gpu-screen-recorder-gtk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Coobyk/gpu-screen-recorder-qt/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    # Generate 32x32 PNG tray icons from the SVG
    python3 << 'PYEOF'
import struct, zlib

def make_png(w, h, r, g, b):
    raw = b''
    for y in range(h):
        raw += b'\x00'
        for x in range(w):
            raw += struct.pack('BBBB', r, g, b, 255)
    def chunk(ctype, data):
        c = ctype + data
        return struct.pack('>I', len(data)) + c + struct.pack('>I', zlib.crc32(c) & 0xffffffff)
    ihdr = struct.pack('>IIBBBBB', w, h, 8, 6, 0, 0, 0)
    return b'\x89PNG\r\n\x1a\n' + chunk(b'IHDR', ihdr) + chunk(b'IDAT', zlib.compress(raw)) + chunk(b'IEND', b'')

icons = {
    'com.dec05eba.gpu_screen_recorder.tray-idle.png':      (0x95, 0x95, 0x95),
    'com.dec05eba.gpu_screen_recorder.tray-recording.png': (0xe7, 0x4c, 0x3c),
    'com.dec05eba.gpu_screen_recorder.tray-paused.png':    (0xf3, 0x9c, 0x12),
}
for name, (r, g, b) in icons.items():
    path = f'icons/hicolor/32x32/status/{name}'
    with open(path, 'wb') as f:
        f.write(make_png(32, 32, r, g, b))
    print(f'Generated {path}')
PYEOF
}

build() {
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cmake --install build --prefix "$pkgdir/usr"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
