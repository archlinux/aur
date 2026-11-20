# Maintainer: LIghtJUNction
pkgname=zcalld
pkgver=0.4.4
pkgrel=1
pkgdesc='Compact Linux AI gateway built on zcall with native zplugin extensions'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/zcalld'
license=('MIT')
depends=('glibc' 'libgcc' 'curl' 'zstd' 'zlib')
makedepends=('cargo')
checkdepends=('python')
optdepends=('systemd: system and user service management' 'zcalld-compat>=0.3.1: privacy, audit history, OAuth accounts and community plugins' 'zcall-gui: optional native desktop interface' 'libsecret: configure Zed credentials through Secret Service')
backup=('etc/zcalld/config.conf')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/zcalld-$pkgver-source.tar.gz")
sha256sums=('c8e87b57569d4ff726f0651ae3fbf0bd64d6ceb6ab7994e9386ce44e3d93b273')

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
