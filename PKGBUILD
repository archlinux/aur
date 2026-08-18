pkgname=blit
pkgver=0.1.2
pkgrel=1
pkgdesc='High-performance file transfer CLI and daemon'
arch=('x86_64' 'aarch64')
url='https://github.com/roethlar/Blit'
license=('MIT')
makedepends=('cargo')
provides=('blit')
conflicts=('blit-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/roethlar/Blit/archive/refs/tags/v0.1.2.tar.gz")
sha256sums=('694ef0576790bdf6f3c02c121eed62694c81c6a9643d1892986d5ff36908974f')

prepare() {
  cd "Blit-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "Blit-$pkgver"
  export BLIT_GIT_SHA=98084edf8c92
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked -p blit-cli -p blit-daemon
}

package() {
  cd "Blit-$pkgver"
  install -Dm755 target/release/blit "$pkgdir/usr/bin/blit"
  install -Dm755 target/release/blit-daemon "$pkgdir/usr/bin/blit-daemon"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
