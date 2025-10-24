# Maintainer: Matteo Giordano <mail at matteogiordano dot com>

pkgname=lla
pkgver=0.5.0
pkgrel=1
pkgdesc='A modern alternative to ls'
url='https://github.com/triyanox/lla'
license=('MIT')
makedepends=('cargo')
depends=()
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
options=('!lto')
sha512sums=('23a524b8aef657b902a76ea13b9a0eb9196cd0ffc40a847370ba91e38b81055a0c6096c2b009f1d62ca774777c0cefdc9af8f9a1be37e5eb803562bbaa604b99')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTONIG_SYSTEM_LIBONIG=1
  cd "$pkgname-$pkgver"
  cargo build --frozen --release
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
