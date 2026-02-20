# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=scope-tui
pkgver=0.3.5
pkgrel=1
pkgdesc="A simple oscilloscope/vectorscope/spectroscope for your terminal"
arch=('x86_64')
url="https://github.com/alemidev/scope-tui"
license=('MIT')
depends=('gcc-libs' 'libpulse' 'alsa-lib')
makedepends=('cargo')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('5f87d1e2addf3a6841d7f0158f88c4c73295c2f8944db4853939953b71ee5e5aac989aaf49e87b06e5b6f07e93064578f221c0c575899847910ee4c00a232291')

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
