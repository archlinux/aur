# Maintainer: araaha <ara.ahady at gmail dot com>
pkgname=yavcpdf
pkgver=0.5.0
pkgrel=1
pkgdesc='A minimal, keyboard-driven PDF viewer'
arch=('x86_64')
url='https://github.com/araaha/yavcpdf'
license=('MIT OR Apache-2.0')
# Linked at build time: only gcc-libs and glibc (libgcc_s, libm, libc, ld-linux). At run time
# eframe/winit/glutin dlopen libglvnd (libEGL/libGL), wayland (client/egl), the X11 libs,
# xkbcommon and dbus. fontconfig is needed only for the fc-match binary that src/chrome.rs runs.
depends=(
  'gcc-libs'
  'glibc'
  'dbus'
  'fontconfig'
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libxrender'
  'wayland'
)
makedepends=('cargo')
optdepends=(
  'xdg-desktop-portal: file chooser for Ctrl-t / :open'
  'xdg-utils: open links in a browser'
)
conflicts=('yavcpdf-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/araaha/yavcpdf/releases/download/v$pkgver/yavcpdf-$pkgver.tar.gz")
sha256sums=('affaf0424349ddcfd1cc5659859ac893a7222449830bad6af950100d8960c852')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Keep $srcdir out of the binary (panic locations), which makepkg warns about.
  export RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=$srcdir=."
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=$srcdir=."
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/yavcpdf "$pkgdir/usr/bin/yavcpdf"
  install -Dm644 yavcpdf.desktop "$pkgdir/usr/share/applications/yavcpdf.desktop"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 src/default_config.toml "$pkgdir/usr/share/doc/$pkgname/config.toml"
  install -Dm644 LICENSE-MIT LICENSE-APACHE NOTICE ATTRIBUTION.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 licenses/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
