# Maintainer: cmpdchtr <cmpdchtr@gmail.com>

pkgname=yummy
pkgver=0.1.1
pkgrel=1
pkgdesc='Keyboard-first TUI for browsing YummyAnime and downloading episodes'
arch=('x86_64')
url='https://gitlab.com/cmpdchtr/yummy'
license=('MIT')
depends=('ffmpeg' 'gcc-libs' 'glibc' 'yt-dlp')
makedepends=('cargo')
options=('!debug' '!lto')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
b2sums=('24f23a575e0ba0e3473e2ee363b98ed36e67dfd79e944e89a3751610fd9c2401e3776018d3aaf7a20f61665ecc9b546f112dd1530f8f5620292eb7a690bcca12')

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
