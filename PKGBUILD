# Maintainer: Aaron Esau <git at aaronesau dot com>
#
# Builds the release tag from source (glibc, dynamically linked), with the man pages the
# repository's xtask renders. GitHub tag archives omit submodules, so the tracekit
# submodule comes from its own tag archive (update _tracekit when the submodule moves).
# whytime needs Linux >= 5.18 with BTF and CAP_BPF + CAP_PERFMON (sudo, or setcap).

pkgname=whytime
pkgver=0.1.2
pkgrel=1
_tracekit=0.1.0
pkgdesc="Explains where a command's wall-clock time went: off-CPU and on-CPU attribution from eBPF"
arch=(x86_64 aarch64)
url=https://github.com/Arinerron/whytime
license=(MIT)
depends=(glibc libgcc)
# clang compiles the BPF programs; whytime needs Rust >= 1.94.
makedepends=(cargo clang)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "tracekit-$_tracekit.tar.gz::https://github.com/Arinerron/tracekit/archive/v$_tracekit.tar.gz")
sha256sums=('3acf3be9752108acef92b0679d443bfb48b3a775b7f0a2e95d75db8edbfe0dab'
            'c5d39a2c096b5e743a5b62085e84184cd682e0b6e127bfac23dd37dcfb058252')

_target() {
  rustc -vV | sed -n 's/^host: //p'
}

prepare() {
  cd "$pkgname-$pkgver"
  rmdir tracekit
  mv ../"tracekit-$_tracekit" tracekit
  # The repository defaults to a static musl build (.cargo/config.toml) on the toolchain
  # rust-toolchain.toml pins; build for the host with the system toolchain instead.
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(_target)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --target "$(_target)" -p whytime
  cargo run --frozen --target "$(_target)" -p xtask -- man man
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --target "$(_target)" -p whytime
}

package() {
  cd "$pkgname-$pkgver"
  local bin="target/$(_target)/release/whytime"
  install -Dm755 "$bin" -t "$pkgdir/usr/bin"
  install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1"
  "$bin" completions bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/whytime"
  "$bin" completions zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_whytime"
  "$bin" completions fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/whytime.fish"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
