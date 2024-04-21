# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=bite
pkgver=0.3
pkgrel=1
pkgdesc="Disassembler focused on comprehensive rust support"
url="https://github.com/WINSDK/bite"
arch=(x86_64)
license=(MIT)
depends=(
  gcc-libs
  glibc
)
makedepends=(cargo)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/V$pkgver.tar.gz")
sha256sums=('601b8de971300983d30dccf0925cd067e355061201d2d7fb2bd56063b1987669')

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" target/release/bite

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
