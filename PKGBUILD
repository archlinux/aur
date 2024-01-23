# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=lobtui
pkgver=0.1
pkgrel=1
pkgdesc="TUI for lobste.rs"
arch=('x86_64')
url="https://github.com/pythops/lobtui"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6b9681f7f3792e82a5d0286deef402bb60d3d197ed0225696fccb12db515885a0985e3377cca305acadf1543abbc148f5674ab21a65d26eb83a60bcb16d14f2e')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --lib
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 Readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}
