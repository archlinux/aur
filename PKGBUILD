# Maintainer: Joop Kiefte <ikojba at gmail dot com>
pkgname=puzzle-pits
pkgver=0.1.0
pkgrel=1
pkgdesc="The Puzzle Pits, Abe Pralle's 1995 DOS puzzle game, on SDL2"
arch=('x86_64' 'aarch64')
url="https://github.com/LaPingvino/The-Puzzle-Pits"
license=('Apache-2.0')
depends=('glibc' 'hicolor-icon-theme' 'sdl2')
makedepends=('zig')
conflicts=('puzzle-pits-git')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('310b2c11fb37c1850096ad553e6b5793d514f6631d26840bf4763b8c4f10d181')

prepare() {
  cd "The-Puzzle-Pits-$pkgver"
  # a position-independent executable (v0.1.0's build.zig doesn't ask for one)
  sed -i 's/^\( *\)b.installArtifact(exe);/\1exe.pie = true;\n&/' build.zig
  grep -q 'exe.pie = true;' build.zig
}

build() {
  cd "The-Puzzle-Pits-$pkgver"
  ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-cache" zig build -Doptimize=ReleaseSafe
}

package() {
  cd "The-Puzzle-Pits-$pkgver"
  install -Dm755 zig-out/bin/puzzle-pits "$pkgdir/usr/bin/puzzle-pits"
  # the game finds its data in ../share/puzzle-pits from /usr/bin
  install -dm755 "$pkgdir/usr/share/puzzle-pits"
  cp -r --no-preserve=ownership PITS95/. "$pkgdir/usr/share/puzzle-pits/"
  install -Dm644 packaging/linux/puzzle-pits.desktop "$pkgdir/usr/share/applications/puzzle-pits.desktop"
  install -Dm644 packaging/linux/puzzle-pits.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/puzzle-pits.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
