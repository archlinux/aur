pkgname=electrs
pkgver=0.10.7
pkgrel=1
pkgdesc="An efficient re-implementation of Electrum Server in Rust"
arch=(aarch64 x86_64)
url="https://github.com/romanz/electrs"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'clang' 'cmake' 'rust')
source=("git+https://github.com/romanz/electrs.git#tag=v$pkgver")
sha256sums=('9116ce80af6c2ce22f7bfeca9ac9d21a2bb8f257b01e1117e7f8aa47cf94c154')

prepare() {
  if check_option lto y; then
    CFLAGS+=" -ffat-lto-objects"
    CXXFLAGS+=" -ffat-lto-objects"
  fi
}

build() {
  cd "$pkgname"
  cargo build --bins --tests --release --locked
}

check() {
  cd "$pkgname"
  cargo test --release --locked
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
