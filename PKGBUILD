# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}

pkgname='protols'
pkgver=0.12.7
pkgrel=1
pkgdesc='Language Server for Protobuf and gRPC'
url='https://github.com/coder3101/protols'
license=('MIT')
arch=('x86_64')
depends=()
makedepends=('rust')
checkdepends=()
options=('!lto')
source=("$pkgname.tar.gz"::"$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('dbd77c9c531ce8d4d96c66fa72c1f379367452013caf36967886efcff3548ea9')

_rust_env() {
  export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN
  export GIT_DIR='.'
}

prepare() (
  _rust_env
  cd "$pkgname-$pkgver"
  cargo update
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
)

build() (
  _rust_env
  cd "$pkgname-$pkgver"
  cargo build --frozen --release
)

check() {
  cd "$pkgname-$pkgver"
  cargo test --no-default-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0755 target/release/protols "$pkgdir/usr/bin/protols"
}
