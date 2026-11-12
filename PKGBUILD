# Maintainer: Athan Clark <athan dot clark at gmail dot com>

pkgname=ltext
pkgver=0.2.0
pkgrel=1
pkgdesc='Text-file templating utility that treats files as higher-order functions'
arch=('x86_64' 'aarch64')
url='https://github.com/ltext/ltext'
license=('BSD-3-Clause')
depends=('glibc' 'libgcc')
# The release profile already strips the binary, so a -debug package would be empty.
options=('!debug')
makedepends=('cargo')
checkdepends=('diffutils')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('44177f2ccb0da4b0b9031a8cfa906a4a52ef9713f445f5ed1d3a0bc0e35a62d4')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
  golden/run.sh target/release/ltext
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/ltext -t "$pkgdir/usr/bin/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
