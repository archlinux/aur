# Maintainer: LIghtJUNction
pkgname=zcall-gui
pkgver=0.1.0
pkgrel=1
pkgdesc='Native Project Z control panel for the zcalld local AI gateway'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/zcall-gui'
license=('MIT')
optdepends=('xorg-xwayland: run on Wayland sessions' 'noto-fonts-cjk: Chinese and Japanese glyphs')
depends=('zcalld>=0.2.0' 'glibc' 'libgcc' 'libx11' 'libgl' 'freetype2' 'fontconfig' 'curl' 'hicolor-icon-theme')
makedepends=('rust>=1.100' 'pkgconf')
# Rust retains its own thin LTO; keep native C objects compatible with the linker.
options=('!lto')
source=("$pkgname-v$pkgver-source.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-source.tar.gz")
sha256sums=('881e83c8f8d34288c1b273efad3934c0701b5ae955c741a7ceaefd44f98edd1a')

prepare() {
  cd "$srcdir/$pkgname-v$pkgver"
  rm -f rust-toolchain.toml
}

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$srcdir/$pkgname-v$pkgver"
  cargo test --frozen
  cargo test --manifest-path vendor/zui/Cargo.toml --frozen
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  install -Dm755 target/release/zcall-gui "$pkgdir/usr/bin/zcall-gui"
  install -Dm644 packaging/zcall-gui.desktop "$pkgdir/usr/share/applications/zcall-gui.desktop"
  install -Dm644 packaging/zcall-gui.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/zcall-gui.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 vendor/zui/LICENSE "$pkgdir/usr/share/licenses/$pkgname/zui-LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/zcall-gui/README.md"
  cp -R docs "$pkgdir/usr/share/doc/zcall-gui/"

}
