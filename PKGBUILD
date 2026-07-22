# Maintainer: a77ila
pkgname=pactience
pkgver=0.1.2
pkgrel=1
pkgdesc="Enforce a minimum package age before upgrading Arch Linux packages (pacman/AUR)"
arch=('x86_64' 'aarch64')
url="https://github.com/a77ila/pactience"
license=('MIT' 'Apache-2.0')
depends=('pacman' 'gcc-libs' 'zlib')
makedepends=('cargo')
optdepends=(
  'paru: AUR package support'
  'yay: AUR package support'
)
# makepkg's default `lto` option injects -flto=auto into CFLAGS; the C code
# built by ring/zstd-sys then becomes GCC LTO bytecode that rust-lld cannot
# link (undefined ring_core_*/ZSTD_* symbols).
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/a77ila/pactience/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('22db6cd237b6897c39740e714b9a32282fcd26dec6e42e40cdb713c637dd48d8')

build() {
  cd "$pkgname-$pkgver/src"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver/src"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver/src"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 ../LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 ../LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
