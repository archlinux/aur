# Maintainer: Lloyd <lloydzhou@qq.com>

pkgname=mcpc
pkgver=0.2.0
pkgrel=1
pkgdesc="MCP client CLI with daemon-held sessions (rmcp based)"
arch=('x86_64' 'aarch64')
url="https://github.com/lloydzhou/mcpc"
license=('MIT')
depends=('ca-certificates')
makedepends=('cargo' 'cmake' 'perl')
provides=('mcpc')
conflicts=('mcpc-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lloydzhou/mcpc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ecccc29d1e5fdbac101127b7a54fe5e2208e2d99ee86e3657746f317c83ebadb')
# makepkg's -flto in CFLAGS turns ring/aws-lc C objects into LTO bitcode that
# rust-lld cannot link against (undefined ring_core_* symbols)
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  # ring/aws-lc static libs are incompatible with cargo fat LTO on rust-lld
  export CARGO_PROFILE_RELEASE_LTO=false
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/mcpc "$pkgdir/usr/bin/mcpc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
