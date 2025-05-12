# Maintainer: Nihal Kumar <2tv8xupqg at mozmail dot com>
pkgname=context-pilot
pkgver=0.0.2
pkgrel=1
pkgdesc="Analyze Git blame information, infer code context, and index your codebase for deep, fine-grained search and navigation."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/krshrimali/context-pilot-rs"
license=('MIT')
depends=('git')
makedepends=('rust')
optdepends=('neovim: For neovim integration'
  'visual-studio-code-bin: For VSCode integration')
provides=("$pkgname")
conflicts=("$pkgname")
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f4796054add53d889dcb437b6d9e598ffe6416bcf4ba133aba99f5bdab91bb58')

prepare() {
  cd "$srcdir/context-pilot-rs-$pkgver"

  if [[ -f Cargo.lock ]]; then
    export CARGO_NET_OFFLINE=true
  fi

  case "$CARCH" in
  armv7h) target="armv7-unknown-linux-gnueabihf" ;;
  aarch64) target="aarch64-unknown-linux-gnu" ;;
  *) target="$CARCH-unknown-linux-gnu" ;;
  esac

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu" || cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/context-pilot-rs-$pkgver"

  export CARGO_TARGET_DIR=target
  export CARGO_HOME="$srcdir/cargo-home"
  cargo build --locked --release --all-features
}

check() {
  cd "$srcdir/context-pilot-rs-$pkgver"

  if [[ ! -z "${SKIP_TESTS}" ]]; then
    echo "Skipping tests as SKIP_TESTS is set"
    return 0
  fi

  cargo test --all-features
}

package() {
  cd "$srcdir/context-pilot-rs-$pkgver"

  install -Dm755 "target/release/context-pilot" "$pkgdir/usr/bin/$pkgname"
}
