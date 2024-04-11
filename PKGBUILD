# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=scope-tui
pkgver=0.3.0
pkgrel=1
pkgdesc="A simple oscilloscope/vectorscope/spectroscope for your terminal"
arch=('x86_64')
url="https://github.com/alemidev/scope-tui"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'libpulse')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a14dc9f18a972d6829be3767eabb8d5daa45a161a7cf952f181dac32c1273b20b4c3f245c01193c17e4e0f6916677d8b1d731ef0718844a21452cc5d5bba8179')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')" # --locked
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
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  # install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
