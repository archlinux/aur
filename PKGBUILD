# Maintainer: Em Ayupov <gasd228337@gmail.com>
pkgname=tg-ws-proxy-rs
pkgver=2.3.3
pkgrel=1
pkgdesc="Telegram MTProto WebSocket Bridge Proxy in Rust"
arch=('x86_64')
url="https://github.com/valnesfjord/tg-ws-proxy-rs"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git' 'perl')
provides=('tg-ws-proxy')
conflicts=('tg-ws-proxy' 'tg-ws-proxy-bin' 'tg-ws-proxy-cli' 'tg-ws-proxy-git')
source=("git+https://github.com/valnesfjord/tg-ws-proxy-rs.git#tag=v${pkgver}")
sha256sums=('SKIP')
options=('!lto')

_target="${CARCH}-unknown-linux-gnu"

prepare() {
  cd "$pkgname"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked --target "$_target"
}

build() {
  cd "$pkgname"
  export CARGO_HOME="${srcdir}/cargo-home"
  export CC="gcc"
  export AR="ar"
  rm -rf target/
  cargo build --frozen --release --target "$_target"
}

check() {
  cd "$pkgname"
  export CARGO_HOME="${srcdir}/cargo-home"
  export CC="gcc"
  export AR="ar"
  cargo test --frozen --target "$_target"
}

package() {
  cd "$pkgname"
  install -Dm755 "target/${_target}/release/tg-ws-proxy" "$pkgdir/usr/bin/tg-ws-proxy"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
