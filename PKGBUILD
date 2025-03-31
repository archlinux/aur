# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=laze
pkgver=0.1.35
pkgrel=1
pkgdesc='Fast declarative meta build system for C/C++/Rust projects'
arch=('x86_64')
url="https://github.com/kaspar030/$pkgname"
license=('Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d6e4eab9e51bdda59ec564662b91251776f2f2400f6806c315afb996971428af')
makedepends=('cargo')
depends=('glibc' 'gcc-libs' 'mimalloc')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="-C link-arg=/usr/lib/libmimalloc.so"
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$pkgname-$pkgver"
  cargo test --release --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
