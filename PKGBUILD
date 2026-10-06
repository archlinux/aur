# Maintainer: Pink Pixel <admin@pinkpixel.dev>
pkgname=slate-editor
_name=slate
pkgver=0.8.0
pkgrel=1
pkgdesc="A fast, minimal text editor for Linux, built with GPUI Kit"
arch=('x86_64')
url="https://github.com/pinkpixel-dev/slate"
license=('Apache-2.0')
depends=(
  'fontconfig'
  'gcc-libs'
  'glibc'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'vulkan-icd-loader'
  'wayland'
  'xdg-desktop-portal'
)
makedepends=('cargo')
# Other packages that also install /usr/bin/slate.
conflicts=('slate' 'slate-git' 'slate-bin')
# makepkg's LTO turns the bundled C code (tree-sitter grammars) into GCC
# bitcode that Rust's linker can't read, so the link fails.
options=('!lto')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Run `updpkgsums` after the v$pkgver tag is on GitHub to fill this in.
sha256sums=('9b41795a2c52d1db7fddea3c9340eb96b378fda575b1ae54a58f4f7bd8ff67ee')

prepare() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$_name-$pkgver"
  install -Dm755 target/release/slate "$pkgdir/usr/bin/slate"
  install -Dm644 packaging/dev.pinkpixel.Slate.desktop \
    "$pkgdir/usr/share/applications/dev.pinkpixel.Slate.desktop"
  install -Dm644 packaging/dev.pinkpixel.Slate.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/dev.pinkpixel.Slate.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
