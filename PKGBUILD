# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://github.com/dnaka91/pkgbuilds

pkgname=ffprog
pkgver=0.1.1
pkgrel=1
pkgdesc="FFmpeg with nice progress visualization"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/dnaka91/ffprog"
license=('AGPL3')
depends=('ffmpeg' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('1bd004ce4d797b2f1f5c726d9bb8ecad3b8ab5f996ae26141648104fae60e4d8cbf3cc9dde002d125a59dafca2a1492a61d0b48bd1f5de3d89607df4437bc1cd')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 target/release/"$pkgname" -t "$pkgdir"/usr/bin
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/"$pkgname"
}
