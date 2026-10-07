# Maintainer: couldLover <https://github.com/numb747>

pkgname=card-forge
pkgver=0.2.0
pkgrel=1
pkgdesc="Lightweight SillyTavern character card editor with image link caching (Rust/egui)"
arch=('x86_64' 'aarch64')
url="https://github.com/numb747/card-forge"
license=('GPL-3.0-only')
# OpenGL, Wayland and X11 libraries are loaded at runtime (dlopen) by winit/glutin.
depends=(
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libxrandr'
  'wayland'
)
makedepends=('cargo')
optdepends=(
  'xdg-desktop-portal: open/save file dialogs'
  'xdg-utils: open images and folders in external apps'
  'noto-fonts-cjk: Chinese UI text'
  'fontconfig: locate a fallback CJK font'
)
# ring builds C/asm code that does not get along with makepkg's -flto flags.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('67f8db698b6093b809bee52bf03be0fbdbf2ffeb67b69291dd339532ddbed4e9')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Build scripts embed absolute paths of generated files; keep $srcdir out of the binary.
  export RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=$srcdir=/usr/src/debug/$pkgname"
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=$srcdir=/usr/src/debug/$pkgname"
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/card-forge "$pkgdir/usr/bin/card-forge"
  install -Dm644 assets/card-forge.desktop "$pkgdir/usr/share/applications/card-forge.desktop"

  install -Dm644 assets/icons/card-forge.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/card-forge.svg"
  local size
  for size in 32 48 64 128 256 512; do
    install -Dm644 assets/icons/card-forge-$size.png \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/card-forge.png"
  done

  install -Dm644 README.md README.zh-CN.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
