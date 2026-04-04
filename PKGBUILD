# Maintainer: xendr4x
pkgname=metadump
pkgver=1.0.0
pkgrel=1
pkgdesc="Metadata analysis tool"
arch=('x86_64')
url="https://github.com/mansar1337/metadump"
license=('MIT')
depends=('zstd' 'xz' 'bzip2')
makedepends=('rust' 'cargo')
conflicts=('metadump-bin')
options=('!lto')
source=("$pkgname-$pkgver.zip::$url/archive/refs/heads/main.zip")
sha256sums=('362f61d0f4ca8802ac4ce7b9e4b5651f45c87f82b063c6bd35763aecd7e99183')

prepare() {
  cd "$srcdir/$pkgname-main"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname-main"
  export ZSTD_SYS_USE_PKG_CONFIG=1
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen --offline
}

check() {
  cd "$srcdir/$pkgname-main"
  cargo test --release --frozen --offline
}

package() {
  cd "$srcdir/$pkgname-main"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
