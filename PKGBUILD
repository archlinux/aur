# Maintainer: Aaron Esau <git at aaronesau dot com>
#
# Builds the crates.io crate (glibc, dynamically linked). The crate carries no man pages
# (the repository's xtask renders them at release time); whytime-bin installs them.
# whytime needs Linux >= 5.18 with BTF and CAP_BPF + CAP_PERFMON (sudo, or setcap).

pkgname=whytime
pkgver=0.1.1
pkgrel=1
pkgdesc="Explains where a command's wall-clock time went: off-CPU and on-CPU attribution from eBPF"
arch=(x86_64 aarch64)
url=https://github.com/Arinerron/whytime
license=(MIT)
depends=(glibc libgcc)
# clang compiles the BPF programs; the crate needs Rust >= 1.94.
makedepends=(cargo clang)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('5f00f9fbeadef86a44d4c89249aaff1048afd9da08ad63fbd89ced13e2900467')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  local bin=target/release/whytime
  install -Dm755 "$bin" -t "$pkgdir/usr/bin"
  "$bin" completions bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/whytime"
  "$bin" completions zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_whytime"
  "$bin" completions fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/whytime.fish"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
