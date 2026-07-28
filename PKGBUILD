# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=recall
pkgver=0.5.0
pkgrel=1
pkgdesc="Full-text search and resume for AI coding-agent conversations"
arch=('x86_64' 'aarch64')
url="https://github.com/zippoxer/recall"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
conflicts=('recall-bin' 'recall-zippoxer-bin')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zippoxer/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('9defdf83adfe7ee4b3fec8c84d7b1c9037ae57abce8be14f5771142cfa61acbf')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
  export RECALL_HOME_OVERRIDE="$srcdir/test-home"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/recall "$pkgdir/usr/bin/recall"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
