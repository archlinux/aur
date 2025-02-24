# Maintainer: Funami
pkgname=russ
pkgver=0.5.0
pkgrel=1
pkgdesc="Russ is a TUI RSS/Atom reader with vim-like controls and a local-first, offline-first focus"
arch=('any')
url="https://github.com/ckampfe/russ"
license=('AGPL3')
depends=('libxcb')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ckampfe/russ/archive/b1658070826874979c32373ecabb40bc9eee1f65.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('13e8fe17baafb42e8f3b8ae229890b276318a970b3ba68c880dbe6f4f37c1c74')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  bsdtar -xf "$pkgname-$pkgver.tar.gz" -C "$pkgname-$pkgver" --strip-components 1
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
