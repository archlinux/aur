# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi dot com>

pkgname=edgee
pkgver=1.0.0
pkgrel=1
pkgdesc='The full-stack edge platform for your edge oriented applications'
arch=('x86_64')
url='https://www.edgee.cloud'
license=('Apache-2.0')
depends=('openssl' 'bzip2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/edgee-cloud/edgee/archive/v$pkgver.tar.gz")
sha256sums=('5625378460847976ac801afbe9adef7a8d644fd9669ad693c2d8f573761b61f9')
b2sums=('c481eabe42463dc96e4838584e981a73294ef73a9841ab94ec3d3187afbae592cb832c726a45a1500963f9d474766f99ba3ae29f8993cbd813b1a615da5a001f')
options=('!lto')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR=target \
  cargo build --frozen --release --package edgee --bin edgee
}

check() {
  cd "$pkgname-$pkgver"

  RUSTFLAGS="$RUSTFLAGS -C debug-assertions" cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/edgee

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE
}
