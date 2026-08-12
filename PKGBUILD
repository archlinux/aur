# Maintainer: pentago <pentago@users.noreply.github.com>

pkgname=koan
pkgver=0.23.3
pkgrel=1
pkgdesc="Bit-perfect terminal music player with gapless playback and Subsonic/Navidrome streaming"
arch=('x86_64' 'aarch64')
url="https://github.com/radiosilence/koan"
license=('MIT')
depends=('alsa-lib' 'dbus' 'gcc-libs' 'glibc')
makedepends=('rust' 'clang')
options=('!debug' '!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e852b5cc16c2fa43fb1b2a3e15e8a49f31aeed1ee2d288fa439d9870dc8bf2b4')

prepare() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # aws-lc-sys (AWS-LC) fails with makepkg's CFLAGS: its jitterentropy sources
  # require -O0, but cc-rs appends env CFLAGS (-O2) AFTER the build script's
  # -O0, tripping jitterentropy's #error ("must not be compiled with
  # optimizations"). Strip optimization flags from CFLAGS (keep hardening
  # flags); matches upstream CI which builds with no CFLAGS set.
  export CFLAGS="$(printf '%s' "$CFLAGS" | sed 's/ -O[0-9sg]*//g; s/^-O[0-9sg]*//')"
  # Rust embeds $srcdir paths (panic locations); remap to silence makepkg's
  # "Package contains reference to $srcdir" warning. Keep build()/check()
  # flags identical so cargo does not rebuild between phases.
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/usr/src/debug/$pkgname-$pkgver"
  cargo build --release --frozen --offline
}

check() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/usr/src/debug/$pkgname-$pkgver"
  dbus-run-session -- cargo test --all-targets --release --frozen --offline
  dbus-run-session -- cargo test --doc --release --frozen --offline
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/koan "$pkgdir/usr/bin/koan"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
