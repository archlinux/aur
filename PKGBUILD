# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=scope-tui
pkgver=0.3.3
pkgrel=2
pkgdesc="A simple oscilloscope/vectorscope/spectroscope for your terminal"
arch=('x86_64')
url="https://github.com/alemidev/scope-tui"
license=('MIT')
depends=('gcc-libs' 'libpulse' 'alsa-lib')
makedepends=('cargo')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('562af85158b465191e6b455bcca301ff3da7c29a811a1e3ed40c1afa520d694578e1715de9e1d546f8da6f82912eb0d0c74520c72d8de3453f6cc3b59f5b1c3d')

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
