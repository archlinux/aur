# Maintainer: f02xygen <i@f02xy.ru>
pkgname=xrat
pkgver=0.19.0
pkgrel=1
pkgdesc="Rust CLI/TUI proxy manager for Xray-core, V2Ray-core, and sing-box"
arch=('x86_64' 'aarch64')
url="https://github.com/mhyrzt/xrat"
install=$pkgname.install
license=('Apache-2.0' 'MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=('!lto')

optdepends=(
  'xray: Managed Xray runtime and real-delay tests'
  'sing-box: sing-box preview and Hysteria2 managed runtime support'
  'v2ray: Alternative V2Ray managed runtime'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('38a8be95b2c28c3444dc42bac91705c991f2f4ff4ee18c6e934ad5fdfae85be3')

prepare() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$SRCDEST/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$SRCDEST/cargo-home"
  export CARGO_PROFILE_RELEASE_LTO=false
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
