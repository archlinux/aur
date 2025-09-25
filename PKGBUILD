# Maintainer: Kharec <sandro@cazzaniga.fr>
pkgname=shai
pkgver=0.1.5
pkgrel=1
pkgdesc="Terminal coding agent and pair-programming buddy"
arch=('x86_64' 'aarch64')
url="https://github.com/ovh/shai"
license=('Apache')
depends=('openssl')
makedepends=('cargo' 'rust' 'pkgconf')

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/ovh/shai/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  '668599be042591bd3d47bf0da692c5d0c88fdb58c3df03ed07235d2681e0de1c'
)

prepare() {
  export CFLAGS+=" -fno-lto"
  export CXXFLAGS+=" -fno-lto"

  export CARGO_HOME="$srcdir/cargo"
  export OPENSSL_NO_VENDOR=1
  mkdir -p "$CARGO_HOME"
  cd "$srcdir/$pkgname-$pkgver"

  cargo update -p ratatui --precise 9879bf96245e183472787ad8d93776f7d13e40df

  local rust_target
  case "$CARCH" in
    x86_64) rust_target="x86_64-unknown-linux-gnu" ;;
    aarch64) rust_target="aarch64-unknown-linux-gnu" ;;
    *) rust_target="$CARCH-unknown-linux-gnu" ;;
  esac

  cargo fetch --locked --target "$rust_target"
}

build() {
  export CFLAGS+=" -fno-lto"
  export CXXFLAGS+=" -fno-lto"

  export CARGO_HOME="$srcdir/cargo"
  export OPENSSL_NO_VENDOR=1
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release --frozen --bin shai
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/shai "$pkgdir/usr/bin/shai"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
