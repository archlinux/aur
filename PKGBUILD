# Maintainer: visorcraft <thomas@visorcraft.com>

pkgname=zigit
pkgver=0.2.0
pkgrel=1
pkgdesc='Fast screenshots, clipboard handoff, and annotation for Wayland'
arch=('x86_64' 'aarch64')
url='https://github.com/visorcraft/ZigIt'
license=('GPL-3.0-only')
depends=(
  'glfw'
  'gtk3'
  'libayatana-appindicator'
  'libglvnd'
  'wayland'
  'wl-clipboard'
)
makedepends=(
  'libxkbcommon'
  'mesa'
  'zig>=0.16.0'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/visorcraft/ZigIt/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ebcb0629762bea5c7fecf91b3b94c075181b4bca99e6ab7c3f8bf8cc865f0b3f')

build() {
  cd "ZigIt-$pkgver"
  zig build -Doptimize=ReleaseSafe \
    --cache-dir "$srcdir/zig-cache" \
    --global-cache-dir "$srcdir/zig-global-cache"
}

package() {
  cd "ZigIt-$pkgver"
  install -Dm755 zig-out/bin/zigit "$pkgdir/usr/bin/zigit"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 packaging/com.visorcraft.zigit.desktop \
    "$pkgdir/usr/share/applications/com.visorcraft.zigit.desktop"
  for size in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 192x192 256x256 512x512; do
    install -Dm644 "packaging/icons/hicolor/${size}/apps/com.visorcraft.zigit.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}/apps/com.visorcraft.zigit.png"
  done
}
