# Maintaner: Sergey A. <murlakatamenka@disroot.org>

pkgname=xiu
pkgver=0.13.0
pkgrel=1
pkgdesc='Simple, fast and secure live media server in pure Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/harlanc/xiu'
license=('MIT')
depends=('gcc-libs' 'opus')
makedepends=('cargo' 'mold')
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a842ce4e11d32b62b2f9e8604751e18b533edc2307864bcc1c6acfe2e710f2da')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="$RUSTFLAGS \
    -C link-arg=-fuse-ld=mold"

  # audiopus_sys:
  #
  # - https://github.com/lakelezz/audiopus_sys?tab=readme-ov-file#pre-installed-opus
  export OPUS_LIB_DIR=/usr/include/opus

  # `cargo build --release --frozen` fails due to `aesni` crate
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable

  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"

  # docs and sample config files
  install -Dm 644 README.md README_CN.md \
    -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 application/xiu/src/config/examples/config*.toml \
    -t "$pkgdir/usr/share/doc/$pkgname"

  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  install -Dm 644 protocol/webrtc/src/clients/index.html \
    protocol/webrtc/src/clients/whep.js \
    -t "$pkgdir/usr/share/$pkgname"
}
