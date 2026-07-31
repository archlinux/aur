# Maintainer: VisorCraft <thomas@visorcraft.com>

pkgname=zigulator
pkgver=0.1.0
pkgrel=1
pkgdesc="Modern desktop calculator built with Zig and Dear ImGui"
arch=('x86_64')
url="https://github.com/visorcraft/zigulator"
license=('GPL-3.0-only')
depends=(
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
sha256sums=('a993a2997af2cd61436d1e24e0dd34f818c133bd3145fde3966c89f27fc66fc0')

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
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/usage.md "$pkgdir/usr/share/doc/$pkgname/usage.md"
}
