# Maintainer: LIghtJUNction
pkgname=zcall-gui
pkgver=0.1.10
pkgrel=1
pkgdesc='Native Project Z control panel for the zcalld local AI gateway'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/zcall-gui'
license=('MIT')
optdepends=('xorg-xwayland: run on Wayland sessions' 'noto-fonts-cjk: Chinese and Japanese glyphs')
depends=('zcalld>=0.2.0' 'glibc' 'libgcc' 'libx11' 'libgl' 'freetype2' 'fontconfig' 'curl' 'hicolor-icon-theme')
# Cargo enforces rust-version; Arch rustup provides rust without a package version.
makedepends=('rust' 'pkgconf' 'git')
# Rust retains its own thin LTO; keep native C objects compatible with the linker.
options=('!lto')
source=("$pkgname-v$pkgver-source.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-source.tar.gz")
sha256sums=('78ab98500819ffab9c5cbf6ca59e937cf7c1ca2d9a624d3648f3dfdc9f02e87d')

prepare() {
  cd "$srcdir/$pkgname-v$pkgver"

  cargo fetch --locked
  cargo fetch --locked --manifest-path vendor/zgpui/Cargo.toml
}

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$srcdir/$pkgname-v$pkgver"
  cargo test --frozen
  cargo test --manifest-path vendor/zgpui/Cargo.toml --features native --frozen
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  install -Dm755 target/release/zcall-gui "$pkgdir/usr/bin/zcall-gui"
  install -Dm644 packaging/zcall-gui.desktop "$pkgdir/usr/share/applications/zcall-gui.desktop"
  install -Dm644 packaging/zcall-gui.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/zcall-gui.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 vendor/zgpui/LICENSE "$pkgdir/usr/share/licenses/$pkgname/zgpui-LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/zcall-gui/README.md"
  cp -R docs "$pkgdir/usr/share/doc/zcall-gui/"

}
