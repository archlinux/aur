# Maintainer: clovexx <clovexx.github@gmail.com>
pkgname=stalzone-server-blocker
pkgver=0.1.0
pkgrel=1
pkgdesc="TUI для выборочной блокировки серверов Stalzone через nftables/iptables"
arch=('x86_64' 'aarch64')
url="https://github.com/clovexx/sz-server-blocker"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'rust')
optdepends=(
  'nftables: бэкенд файрвола'
  'iptables: альтернативный бэкенд'
)
_github=sz-server-blocker
source=("$_github-$pkgver.tar.gz::https://github.com/clovexx/$_github/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('44c8ee50a64549b1f8dc2c5815a770809347d83c25bb598740eb3650cffdc5b8')
options=('!lto')

prepare() {
  cd "$_github-$pkgver"
  export CARGO_TARGET_DIR="$PWD/target"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_github-$pkgver"
  export CARGO_TARGET_DIR="$PWD/target"
  export RUSTUP_TOOLCHAIN=stable
  export RUSTFLAGS="${RUSTFLAGS} -C link-arg=-fuse-ld=bfd"
  cargo build --release --locked
}

package() {
  cd "$_github-$pkgver"
  install -Dm755 target/release/stalzone-server-blocker \
    "$pkgdir/usr/bin/stalzone-server-blocker"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
