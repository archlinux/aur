# Maintainer: LIghtJUNction
pkgname=zcalld
pkgver=0.1.1
pkgrel=1
pkgdesc='Compact Linux AI gateway built on zcall with native zplugin extensions'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/zcalld'
license=('MIT')
depends=('glibc' 'libgcc' 'curl')
makedepends=('cargo')
checkdepends=('python')
optdepends=('systemd: system and user service management')
backup=('etc/zcalld/config.conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cc29f1f0ac4877a41162282e4868e3396182da320cec0afe6f4ec2a75e48e302')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --workspace
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --workspace --all-targets
  python scripts/integration.py
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir" PREFIX=/usr
}
