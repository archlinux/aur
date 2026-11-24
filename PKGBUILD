# Maintainer: Lloyd <lloydzhou@qq.com>

pkgname=oapi
pkgver=0.1.4
pkgrel=1
pkgdesc="OpenAPI command-line client written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/lloydzhou/oapi"
license=('MIT')
depends=('ca-certificates')
makedepends=('cargo')
# makepkg's -flto in CFLAGS turns ring's C objects into LTO bitcode that
# rust-lld cannot link against (undefined ring_core_* symbols)
options=('!lto')
provides=('oapi')
conflicts=('oapi-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lloydzhou/oapi/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('571b08ec26bc3acbbb647bb9000d7b2e1b8a1fa8bf53821ae62b9f4d87d9ce66')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  # ring 0.17 static lib is incompatible with fat LTO on rust-lld (default since rustc ~1.91)
  export CARGO_PROFILE_RELEASE_LTO=false
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/oapi "$pkgdir/usr/bin/oapi"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
