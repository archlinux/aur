pkgname=electrs
pkgver=0.10.10
pkgrel=1
pkgdesc="An efficient re-implementation of Electrum Server in Rust"
arch=(aarch64 x86_64)
url="https://github.com/romanz/electrs"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'clang' 'cmake' 'rust')
source=("git+https://github.com/romanz/electrs.git#tag=v$pkgver")
b2sums=('2b470105a98b36a6b969ac0311f4341a9841d9519053971472e04f262a316a19dcbb6fc782ff775481d757355553d1c54af0a65cafa15f30681dba7817ba1ee7')

prepare() {
  if check_option lto y; then
    CFLAGS+=" -ffat-lto-objects"
    CXXFLAGS+=" -ffat-lto-objects"
  fi
  # https://github.com/facebook/rocksdb/issues/13365
  CXXFLAGS+="  -include cstdint"
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
