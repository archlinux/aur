pkgname=tic-tac-toe-tui-git
pkgver=r5.c0fc66c
pkgrel=1
pkgdesc='Tic Tac Toe TUI'
arch=(x86_64)
url='https://github.com/rutger505/tic-tac-toe-cli'
license=(MIT)
makedepends=(cargo git)
provides=(tic-tac-toe-tui)
conflicts=(tic-tac-toe-tui)
source=("$pkgname::git+https://github.com/rutger505/tic-tac-toe-cli.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --locked --release --all-features
}

package() {
  cd "$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/tic-tac-toe-cli"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
