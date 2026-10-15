# Maintainer: Justin Woodring <jwoodrg@gmail.com>
pkgname=zest
pkgver=0.2.0
pkgrel=1
pkgdesc="Install, run, and upgrade Zig CLI tools from any git repository"
arch=('x86_64')
url="https://github.com/JustinWoodring/zest"
license=('MIT')
depends=('git')
optdepends=('zig: use a system zig from $PATH instead of a zest-managed toolchain')
makedepends=('zig-bin')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d8dff6ee94dceaa10ce6b0c030e58f2b02790ada014fc428e2063552ee9c4548')

prepare() {
  cd "$pkgname-$pkgver"
  # Fetch the pinned build dependencies declared in build.zig.zon.
  zig build --fetch
}

build() {
  cd "$pkgname-$pkgver"
  zig build -Doptimize=ReleaseSafe
}

check() {
  cd "$pkgname-$pkgver"
  zig build test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 zig-out/bin/zest "$pkgdir/usr/bin/zest"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
