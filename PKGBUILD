# Maintainer: sliva0 <sliva0mk at gmail dot com>

pkgname=tgradish
pkgver=2.1.1
pkgrel=1
pkgdesc='Telegram stickers and emoji from videos, images or pixel art'
arch=(x86_64 aarch64)
url='https://github.com/sliva0/tgradish'
license=(MIT BSD-3-Clause)
# ffmpeg runs as a program; the GUI loads the graphics libraries when it
# opens, and D-Bus for file dialogues
# the GUI's libraries are those of GUI_LIBRARIES in xtask/src/package.rs,
# which says where each comes from: keep them alike
depends=(
  dbus
  ffmpeg
  gcc-libs
  glibc
  libglvnd
  libx11
  libxcb
  libxcursor
  libxi
  libxkbcommon
  libxkbcommon-x11
  libxrender
  wayland
)
makedepends=(cargo)
# makepkg's lto adds -flto=auto to CFLAGS, so libwebp-sys's C is built as
# GCC's LTO objects, which rust-lld, the linker Rust uses, can't read: the
# link fails on undefined WebP symbols. Cargo's release profile has its own
# LTO, of the Rust code
options=(!lto)
optdepends=('xdg-desktop-portal: file dialogues in the GUI')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('770e97ca02149e03b2740977ce522ee56ff8f56816bc6762f1fd9bbfcd252c96')

_cargo_env() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # no build paths in the binary's panic messages
  export RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=$srcdir=/"
}

prepare() {
  cd "$pkgname-$pkgver"
  _cargo_env
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  _cargo_env
  cargo build --frozen --release -p tgradish
}

# the pure Rust crate's tests only, which run no ffmpeg, processes or
# signals: the rest, which do, are the release workflow's to run on Arch
check() {
  cd "$pkgname-$pkgver"
  _cargo_env
  cargo test --frozen -p tgradish-tgs
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/tgradish -t "$pkgdir/usr/bin/"
  # man pages, which makepkg compresses, and completions
  target/release/tgradish __man "$srcdir/man"
  install -Dm644 "$srcdir"/man/*.1 -t "$pkgdir/usr/share/man/man1/"
  target/release/tgradish completions bash \
    | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/tgradish"
  target/release/tgradish completions zsh \
    | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_tgradish"
  target/release/tgradish completions fish \
    | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/tgradish.fish"
  target/release/tgradish completions nushell \
    | install -Dm644 /dev/stdin "$pkgdir/usr/share/nushell/vendor/autoload/tgradish.nu"
  install -Dm644 crates/cli/assets/tgradish.desktop -t "$pkgdir/usr/share/applications/"
  for icon in crates/cli/assets/icons/hicolor/*/apps/tgradish.png; do
    install -Dm644 "$icon" "$pkgdir/usr/share/${icon#crates/cli/assets/}"
  done
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # libwebp's licence and patent grant
  for file in COPYING PATENTS; do
    install -Dm644 "crates/core/licenses/libwebp/$file" \
      "$pkgdir/usr/share/licenses/$pkgname/libwebp-$file"
  done
}
