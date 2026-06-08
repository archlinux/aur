# Maintainer: lightjunction <lightjunction@users.noreply.github.com>
pkgname=new-api-privacy-filter
pkgver=0.2.1
pkgrel=1
pkgdesc='Rust privacy redaction proxy for OpenAI-compatible New API deployments'
arch=('x86_64')
url='https://github.com/LIghtJUNction/new-api-privacy-filter'
license=('MIT')
depends=('glibc' 'openssl')
makedepends=('cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7cd50e9981582a1ebc2778c7c8e1975ba60f15dc34222341dfb6b07ae494bef2')

prepare() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTFLAGS="${RUSTFLAGS/-C link-arg=-fuse-ld=lld/}"
  export LDFLAGS="${LDFLAGS/-fuse-ld=lld/}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="${RUSTFLAGS/-C link-arg=-fuse-ld=lld/}"
  export LDFLAGS="${LDFLAGS/-fuse-ld=lld/}"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="${RUSTFLAGS/-C link-arg=-fuse-ld=lld/}"
  export LDFLAGS="${LDFLAGS/-fuse-ld=lld/}"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "systemd/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
