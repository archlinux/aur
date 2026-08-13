# Maintainer: Omni <team@omni.dev>
pkgname=omnidotdev-terminal
pkgver=0.3.1
pkgrel=1
pkgdesc="GPU-accelerated terminal emulator built to run everywhere"
arch=('x86_64')
url="https://terminal.omni.dev"
license=('Apache-2.0')
depends=('fontconfig' 'freetype2' 'libxkbcommon' 'wayland')
makedepends=('cargo' 'cmake' 'ncurses' 'python' 'wasm-bindgen-cli')
source=("https://github.com/omnidotdev/terminal/archive/v$pkgver.tar.gz")

build() {
  cd "terminal-$pkgver"

  # Build WASM frontend (embedded into serve binary via include_dir!)
  rustup target add wasm32-unknown-unknown
  cargo build -p omni-terminal-wasm --target wasm32-unknown-unknown --release
  wasm-bindgen target/wasm32-unknown-unknown/release/omni_terminal_wasm.wasm \
    --out-dir frontends/wasm/wasm --target web --no-typescript

  cargo build --release -p omni-terminal
}

package() {
  cd "terminal-$pkgver"
  install -Dm755 "target/release/omni-terminal" "$pkgdir/usr/bin/omni-terminal"
  install -Dm644 "misc/omni-terminal.desktop" "$pkgdir/usr/share/applications/omni-terminal.desktop"
  install -Dm644 "misc/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/omni-terminal.svg"
  install -Dm644 "misc/dev.omni.Terminal.metainfo.xml" "$pkgdir/usr/share/metainfo/dev.omni.Terminal.metainfo.xml"
  tic -sx -o "$pkgdir/usr/share/terminfo" "misc/omni-terminal.terminfo"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "NOTICE.md" "$pkgdir/usr/share/doc/$pkgname/NOTICE"
}
sha256sums=('0fb0a8e09d5a6370157da65d73a63a03885fb76e4c6a2df1cfa9c0b0c8f00a1c')
