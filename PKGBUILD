# Maintainer: VibeWindow maintainers <xiangminliu1990@gmail.com>

pkgname=vibewindow
pkgver=0.2.3
pkgrel=1
pkgdesc="Rust-first autonomous agent runtime with CLI, ACP, and desktop client"
arch=('x86_64' 'aarch64')
url="https://github.com/hunzhiwange/vibewindow"
license=('MIT')
depends=(
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libx11'
  'libxcb'
  'libxkbcommon'
  'openssl'
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo'
  'git'
  'pkgconf'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target

  cargo build --release --locked -p vw-cli --bin vibewindow --all-features
  cargo build --release --locked -p vw-acp --bin acp --all-features
  cargo build --release --locked -p vw-desktop --bin vibe-window --all-features
  cargo build --release --locked -p vw-webview --bin vw-webview --all-features
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/vibewindow "$pkgdir/usr/bin/vibewindow"
  install -Dm755 target/release/acp "$pkgdir/usr/bin/acp"
  install -Dm755 target/release/vibe-window "$pkgdir/usr/bin/vibe-window"
  install -Dm755 target/release/vw-webview "$pkgdir/usr/bin/vw-webview"

  install -Dm644 release/linux/vibewindow.desktop \
    "$pkgdir/usr/share/applications/vibewindow.desktop"
  install -Dm644 assets/logo.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/vibewindow.png"
}
