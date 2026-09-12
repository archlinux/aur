# Maintainer: cmpdchtr <cmpdchtr@gmail.com>

pkgname=yummy
pkgver=0.1.0
pkgrel=1
pkgdesc='Keyboard-first TUI for browsing YummyAnime and downloading episodes'
arch=('x86_64')
url='https://gitlab.com/cmpdchtr/yummy'
license=('MIT')
depends=('ffmpeg' 'gcc-libs' 'glibc' 'yt-dlp')
makedepends=('cargo')
options=('!debug' '!lto')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
b2sums=('7e4f92c82660609c15171fbae29dcb921ccaa0cd109c6cf413e2b023080f28bcddf9593a3a4b238fff951dffdfd9a52f8e01b7fd8065cfea9a5bb6d1d9aabbb6')

prepare() {
  cd "$pkgname-v$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-v$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-v$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
