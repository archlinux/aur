pkgname=tic-tac-toe-tui-git
pkgver=r32.153a17a
pkgrel=1
pkgdesc='Tic Tac Toe TUI'
url='https://github.com/rutger505/tic-tac-toe-tui'
license=(MIT)
makedepends=('rust' 'cargo' 'git')
source=("$pkgname::git+https://github.com/rutger505/tic-tac-toe-tui.git")
sha256sums=('SKIP')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')

# Generated in accordance to https://wiki.archlinux.org/title/Rust_package_guidelines.
pkgver() {
  cd "$pkgname" || exit 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$pkgname" || exit 1
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname" || exit 1
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname" || exit 1
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname" || exit 1
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/tic-tac-toe-tui"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
