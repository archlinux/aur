# Maintainer: cmpdchtr <cmpdchtr@gmail.com>

pkgname=yummy
pkgver=0.1.2
pkgrel=1
pkgdesc='Keyboard-first TUI for browsing YummyAnime and downloading episodes'
arch=('x86_64')
url='https://gitlab.com/cmpdchtr/yummy'
license=('MIT')
depends=('ffmpeg' 'gcc-libs' 'glibc' 'yt-dlp')
makedepends=('cargo')
options=('!debug' '!lto')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
b2sums=('ba224d9f5a8425e99b67897c8ad8e803a853be4915f7dc9af035df719e3994c024473354be76a6e2bd3de84261989ed3e5a4b9aaa354a7b576ee6cd6244efa76')

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
