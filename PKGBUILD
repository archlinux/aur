# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
pkgname=lact
pkgver=0.5.2
pkgrel=1
license=("MIT")
pkgdesc="AMDGPU Controller application"
url="https://github.com/ilya-zlobintsev/LACT"
makedepends=("rust" "clang" "blueprint-compiler")
depends=("gtk4" "hwdata")
arch=('x86_64' 'aarch64')
source=(
    "${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('12daa4d3e8181f16839a1f58bde6efec857d5760a6546de1b6592d1d5bd1bf63')
install=lact.install

prepare() {
  cd "LACT-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "LACT-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build -p "$pkgname" --frozen --release
}

package() {
  cd "LACT-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir/" install

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
