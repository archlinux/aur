pkgname=tic-tac-toe-tui-git
pkgver=r5.c0fc66c
pkgrel=1
pkgdesc='Tic Tac Toe TUI'
url='https://github.com/rutger505/tic-tac-toe-cli'
license=(MIT)
makedepends=('rust' 'cargo' 'git')
source=("$pkgname::git+https://github.com/rutger505/tic-tac-toe-cli.git")
arch=('i686' 'x86_64' 'armv6h' 'armv7h')

# Generated in accordance to https://wiki.archlinux.org/title/Rust_package_guidelines.
pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
