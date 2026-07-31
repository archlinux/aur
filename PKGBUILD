# Maintainer: VisorCraft <thomas@visorcraft.com>

pkgname=zigulator
pkgver=0.1.3
pkgrel=1
pkgdesc="Modern desktop calculator built with Zig and Dear ImGui"
arch=('x86_64')
url="https://github.com/visorcraft/zigulator"
license=('GPL-3.0-only')
depends=(
  'hicolor-icon-theme'
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxext'
  'libxi'
  'libxinerama'
  'libxkbcommon'
  'libxrandr'
)
makedepends=('zig')
optdepends=(
  'ttf-dejavu: preferred calculator display and UI fonts'
  'ttf-liberation: alternative UI fonts'
  'noto-fonts: alternative UI fonts'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0ccdb5698d2b6ec0ae8c063ca8570a12c26f46de9b7663ca144790bb08685f91')

prepare() {
  cd "$pkgname-$pkgver"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-cache"
  zig build --fetch
}

build() {
  cd "$pkgname-$pkgver"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-cache"
  zig build -Doptimize=ReleaseFast
}

check() {
  cd "$pkgname-$pkgver"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-cache"
  zig build test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 zig-out/bin/zigulator "$pkgdir/usr/bin/zigulator"
  install -Dm644 packaging/zigulator.desktop \
    "$pkgdir/usr/share/applications/zigulator.desktop"
  for size in 16 24 32 48 64 96 128 256 512; do
    install -Dm644 "packaging/icons/${size}x${size}/apps/zigulator.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/zigulator.png"
  done
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD_PARTY_LICENSES.md \
    "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_LICENSES.md"
  install -Dm644 CREDITS.md "$pkgdir/usr/share/doc/$pkgname/CREDITS.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/usage.md "$pkgdir/usr/share/doc/$pkgname/usage.md"
}
