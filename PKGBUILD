# Maintainer: Aaron Esau <git at aaronesau dot com>
#
# Builds the release tag from source (glibc, dynamically linked), with the man pages the
# repository's xtask renders. GitHub tag archives omit submodules, so the tracekit
# submodule comes from its own tag archive (update _tracekit when the submodule moves).
# fsblame needs Linux >= 5.17 with BTF and CAP_BPF + CAP_PERFMON (sudo, or setcap).
# fsblame-record.service is installed but not enabled: set FSBLAME_PATHS in
# /etc/default/fsblame, then `systemctl enable --now fsblame-record`.

pkgname=fsblame
pkgver=0.1.1
pkgrel=1
_tracekit=0.1.0
pkgdesc="Which command changed this file? Live eBPF attribution of file changes to the full process lineage"
arch=(x86_64 aarch64)
url=https://github.com/Arinerron/fsblame
license=(MIT)
depends=(glibc libgcc)
# clang compiles the BPF programs; fsblame needs Rust >= 1.94.
makedepends=(cargo clang)
backup=(etc/default/fsblame)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "tracekit-$_tracekit.tar.gz::https://github.com/Arinerron/tracekit/archive/v$_tracekit.tar.gz")
sha256sums=('1e1a8c88b510295a55fa2e8024ec1d3dbbe1f042bbcf98464ec9250b25d71d0a'
            'c5d39a2c096b5e743a5b62085e84184cd682e0b6e127bfac23dd37dcfb058252')

prepare() {
  cd "$pkgname-$pkgver"
  rmdir tracekit
  mv ../"tracekit-$_tracekit" tracekit
  # rust-toolchain.toml asks rustup for the musl targets the releases use; build for the
  # host with the system toolchain instead.
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p fsblame
  cargo run --frozen -p xtask -- man man
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen -p fsblame
}

package() {
  cd "$pkgname-$pkgver"
  local bin=target/release/fsblame
  install -Dm755 "$bin" -t "$pkgdir/usr/bin"
  install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1"
  "$bin" completions bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/fsblame"
  "$bin" completions zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_fsblame"
  "$bin" completions fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/fsblame.fish"
  # The unit runs /usr/local/bin/fsblame, the README's path for a tarball install.
  sed '/^ExecStart=/s|/usr/local/bin/fsblame|/usr/bin/fsblame|' contrib/systemd/fsblame-record.service |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/fsblame-record.service"
  install -Dm644 contrib/systemd/fsblame.default "$pkgdir/etc/default/fsblame"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
