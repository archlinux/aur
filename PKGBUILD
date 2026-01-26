# Maintainer: Divyaprakash Dhurandhar <divyaprakash.0426@gmail.com>
pkgname=tidytui-git
pkgver=0.1.0.r0.gGIT
pkgrel=1
pkgdesc="A blazingly fast, terminal-based system cleaner written in Rust"
arch=('x86_64')
url="https://github.com/divyaprakash0426/TidyTUI"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("tidytui")
conflicts=("tidytui")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/TidyTUI"
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/TidyTUI"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/TidyTUI"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/TidyTUI"
  install -Dm755 target/release/TidyTUI "$pkgdir/usr/bin/tidytui"
  install -Dm644 definitions.yaml "$pkgdir/usr/share/tidytui/definitions.yaml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
