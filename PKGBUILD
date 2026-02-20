pkgname=electrs
pkgver=0.11.0
pkgrel=1
pkgdesc="An efficient re-implementation of Electrum Server in Rust"
arch=(aarch64 x86_64)
url="https://github.com/romanz/electrs"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'clang' 'cmake' 'rust')
source=("git+https://github.com/romanz/electrs.git#tag=v$pkgver"
        "electrs.service"
        "electrs.sysusers"
        "electrs.tmpfiles")
b2sums=('749e6d2ddc32eba90ff763945de03be09a9674977e291cdf3fe2be509f17016615e8f555cf4d38ffbe83a107e200f4dcada23045289122aec991db987422eb45'
        'b35197127fcd1bf23dbbed45b877e30526f98b26d3c0c4635cf29b1b873c243fe5a6f7791e70be3b4a6b7e963bde2b205929d8d6ce511bf034b70c322ba6947e'
        'c4ee47153225927549557dcb5d03f63d64434cbfa94b695fd0cf5dacd725f95f9ee0144bdc5e89401e6c4f13cf6171ebcab99efb713bfcbbf72717fe806b5d9d'
        'b77dfecfd9f0bbbc7ceee7fe5776af1fd3f1c4f18519c74a559b7bdd79be3057a7c37bcf1e8aa4b9ec125a903fcd0a0bc16d75f1faa5a1abf6044dcf1a98a8cd')

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
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  install -Dm644 "$srcdir/electrs.service" \
    "$pkgdir/usr/lib/systemd/system/electrs.service"
  install -Dm644 "$srcdir/electrs.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/electrs.conf"
  install -Dm644 "$srcdir/electrs.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/electrs.conf"
}
