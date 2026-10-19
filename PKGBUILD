# Maintaner: Sergey A. <murlakatamenka@disroot.org>
#
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2164

pkgname=xiu
pkgver=0.14.0
pkgrel=1
pkgdesc='Simple, fast and secure live media server in pure Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/harlanc/xiu'
license=('MIT')
depends=('gcc-libs' 'opus')
makedepends=('cargo' 'mold')
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('556a22760b37c761180ed530a11c80bebe6118aae7963354f124a40f1d42baa7')

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

  cargo build --release --frozen
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
