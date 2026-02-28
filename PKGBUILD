# Maintainer: rotko <hq@rotko.net>
pkgname=zcli-git
pkgver=0.1.0.r1.c0bc397
pkgrel=1
pkgdesc="zcash wallet CLI — ssh keys as wallet seed"
arch=('x86_64' 'aarch64')
url="https://github.com/rotkonetworks/zcli"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git' 'protobuf')
provides=('zcli')
conflicts=('zcli')
source=("git+https://github.com/rotkonetworks/zcli.git")
sha256sums=('SKIP')

pkgver() {
  cd zcli
  printf "%s.r%s.%s" \
    "$(grep '^version' Cargo.toml | head -1 | sed 's/.*"\(.*\)"/\1/')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd zcli
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd zcli
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd zcli
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd zcli
  install -Dm755 "target/release/zcli" "$pkgdir/usr/bin/zcli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
