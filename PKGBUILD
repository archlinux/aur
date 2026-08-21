pkgname=blit
pkgver=0.1.3
pkgrel=1
pkgdesc='High-performance file transfer CLI and daemon'
arch=('x86_64' 'aarch64')
url='https://github.com/roethlar/Blit'
license=('MIT')
makedepends=('cargo')
provides=('blit')
conflicts=('blit-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/roethlar/Blit/archive/refs/tags/v0.1.3.tar.gz")
sha256sums=('48e06b10e99f1ff10b7540cad43c2e27beea73af23e91f22e5733c33497e94ed')

prepare() {
  cd "Blit-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "Blit-$pkgver"
  export BLIT_GIT_SHA=fe6b279dfde0
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked -p blit-transfer -p blit-daemon
}

package() {
  cd "Blit-$pkgver"
  install -Dm755 target/release/blit "$pkgdir/usr/bin/blit"
  install -Dm755 target/release/blit-daemon "$pkgdir/usr/bin/blit-daemon"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
