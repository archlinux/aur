# Maintainer: Lloyd <lloydzhou@qq.com>

pkgname=mcpc
pkgver=0.2.3
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
sha256sums=('1a6572bb6ac177fbe2bff0f6c8f0fda970da6cb2e648a62b3ed7b1774994ec2e')
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
