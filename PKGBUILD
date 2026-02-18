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
        'eb0973596081ac34ac9f667b9fbf6c22c39b8eb175f91d908b8aac51e5e9cde07b2f7c329ad9f2e67446bce3e37988ecc4d132e40203a47bb8efafa0be31aa1a'
        'b9a663c741beb93041611bbb0f2e547805bca62d596ed3d1865c2a817f8767d312a5c5c4d4551658d039253a992046e2526be37c1d7b3abbcc85c5441dc2754e'
        '5249c62346e22c2e33672f0bb63866397693126f03fb7aae472eae8a1cebda4a919ce450f178b5aa8fd9e8f4c8b2ef383d523c577f192f4c4be57f403c69e28e')

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
