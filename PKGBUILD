# Maintainer: Athan Clark <athan dot clark at gmail dot com>

pkgname=ltext
pkgver=0.2.2
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
sha256sums=('9c92592217b2db678beda46545adfe5d8a9c4d75d788aca02956b79bcac78288')

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
