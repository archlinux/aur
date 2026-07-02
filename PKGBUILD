# Maintainer: Lawrence Stalder <lawrence.stalder@pm.me>
pkgname=piclift
pkgver=0.5.9
pkgrel=1
pkgdesc="SD card photo import, cull, and upload tool for photographers"
arch=('x86_64')
url="https://codeberg.org/Bykow/piclift"
license=('AGPL-3.0-only')
depends=('dbus' 'sqlite' 'gcc-libs' 'glibc')
makedepends=('cargo' 'cmake' 'nasm')
# makepkg's global `lto` option injects -flto=auto into CFLAGS/CXXFLAGS, which
# makes the bundled C in mozjpeg-sys and aws-lc-sys compile to GCC LTO bitcode
# that ld.lld can't resolve at the final Rust link (undefined C symbols).
# Disable it here; Cargo's own [profile.release] lto for the Rust code is
# unaffected.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('22d35493f1db73e80f11bd4adb2b92df44ce2e05b824d5f64bbd1cc15b931e03')

prepare() {
  cd "$pkgname"
  # Drop the pinned toolchain so we build against Arch's system rust instead of
  # triggering a rustup download of the pinned channel.
  rm -f rust-toolchain.toml
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
  # Generate shell completions from the freshly built binary.
  ./target/release/piclift completions bash > completions.bash
  ./target/release/piclift completions zsh  > completions.zsh
  ./target/release/piclift completions fish > completions.fish
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/piclift "$pkgdir/usr/bin/piclift"
  install -Dm644 completions.bash "$pkgdir/usr/share/bash-completion/completions/piclift"
  install -Dm644 completions.zsh  "$pkgdir/usr/share/zsh/site-functions/_piclift"
  install -Dm644 completions.fish "$pkgdir/usr/share/fish/vendor_completions.d/piclift.fish"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
