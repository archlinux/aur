# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
pkgname=lact
pkgver=0.5.1
pkgrel=3
license=("MIT")
pkgdesc="AMDGPU Controller application"
url="https://github.com/ilya-zlobintsev/LACT"
makedepends=("rust" "clang" "blueprint-compiler")
depends=("gtk4" "hwdata")
arch=('x86_64' 'aarch64')
source=(
    "${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9b2a21bcf99c3393dff8f72463a7d5e8e8a62767f59106a240ee9bb512dbc522')
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
