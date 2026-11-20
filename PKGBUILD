# Maintainer: ParticleG <particle_g@outlook.com>
# SPDX-License-Identifier: MIT

pkgname=arknights-launcher
pkgver=0.1.0
pkgrel=1
_commit=0ec1d40ed0043680ef96d109cbde60539fb02008
pkgdesc='Unofficial native Linux launcher for original Arknights CN'
arch=('x86_64')
url='https://github.com/ParticleG/arknights-launcher'
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'xdg-utils')
makedepends=('bun' 'rust')
optdepends=('dwproton-bin: run the Windows game with DWProton')
# GCC LTO objects from ring cannot be linked by Rust's LLVM linker.
options=('!debug' '!lto')
source=(
  "$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz"
  "$pkgname.desktop"
)
sha256sums=('d305ec557ffb684d14e51cb50db216b8a60d67af3117119dd47ced2e820c6f6e' '72e03c0b656935b86d7d3840890a7cff888cc02458471cb40deb509e48fa7079')

build() {
  cd "$srcdir/$pkgname-$_commit"
  bun install --frozen-lockfile
  bun run tauri build --no-bundle -- --locked
}

check() {
  cd "$srcdir/$pkgname-$_commit"
  cargo test --locked --release --lib --manifest-path src-tauri/Cargo.toml
}

package() {
  cd "$srcdir/$pkgname-$_commit"
  install -Dm755 src-tauri/target/release/arknights-launcher "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 src-tauri/icons/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE LICENSES/LLauncher-MIT.txt
}
