# Maintainer: Funami
pkgname=russ
pkgver=0.4.0
pkgrel=1
pkgdesc="Russ is a TUI RSS/Atom reader with vim-like controls and an offline-first focus"
arch=('any')
url="https://github.com/ckampfe/russ"
license=('AGPL3')
depends=('libxcb')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ckampfe/russ/archive/98456812ed8b29f14bac92546bf9b4c423cc4acb.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('2abaec20327e20a5e5e58ea98bd72ce15bb71285d08adac21a7eb83e0dbab180')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  bsdtar -xf "$pkgname-$pkgver.tar.gz" -C "$pkgname-$pkgver" --strip-components 1
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="--remap-path-prefix=$HOME=/home --remap-path-prefix=$PWD=/src"
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
