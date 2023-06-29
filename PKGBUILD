# Maintainer: Cheems Bread <CheemsBread505@proton.me>
pkgname=dailyverse-cli-git
pkgver=r16.72f4021
pkgrel=1
pkgdesc="Daily verse software"
arch=('x86_64')
url="https://github.com/CheemsBread505/dailyverse-cli"
license=('CSL')
depends=('gcc-libs' 'glibc' 'openssl')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/CheemsBread505/dailyverse-cli.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --frozen
}

check() {
  cd "$srcdir/${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --locked
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 target/release/dailyverse -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}/"
}

