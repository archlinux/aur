# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=scope-tui
pkgver=0.3.4
pkgrel=1
pkgdesc="A simple oscilloscope/vectorscope/spectroscope for your terminal"
arch=('x86_64')
url="https://github.com/alemidev/scope-tui"
license=('MIT')
depends=('gcc-libs' 'libpulse' 'alsa-lib')
makedepends=('cargo')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('d1e069521081c021f15a6ee1a4e285b4c61cd37213a92f2a772243e223dd7303b8ff2f5207d56a4a9d4d29185cf268fd1cdd7a6ec3a98bd66404d83400fadb2c')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')" # --locked
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen --features pulseaudio
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
