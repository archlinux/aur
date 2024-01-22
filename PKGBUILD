# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
pkgname=('lact' 'lact-libadwaita')
pkgbase=lact
pkgver=0.5.2
pkgrel=1
pkgdesc="AMDGPU Controller application"
arch=('x86_64' 'aarch64')
url="https://github.com/ilya-zlobintsev/LACT"
license=('MIT')
depends=('hwdata' 'gtk4')
makedepends=('blueprint-compiler' 'cargo' 'clang' 'libadwaita')
install="$pkgbase.install"
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('12daa4d3e8181f16839a1f58bde6efec857d5760a6546de1b6592d1d5bd1bf63')

prepare() {
  cd "LACT-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "LACT-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  # Libadwaita
  cargo build -p "$pkgbase" --frozen --release --features=adw
  mv "target/release/$pkgbase" "target/release/$pkgbase-adw"

  # Gtk 4
  cargo build -p "$pkgbase" --frozen --release
}

check() {
  cd "LACT-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --no-default-features
}

package_lact() {
  cd "LACT-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir/" install

  install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgbase/"
}

package_lact-libadwaita() {
  pkgdesc+=" (libadwaita edition)"
  provides=("$pkgbase")
  conflicts=("$pkgbase")
  depends+=('libadwaita')

  cd "LACT-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir/" install

  install -Dvm755 "target/release/$pkgbase-adw" "$pkgdir/usr/bin/$pkgbase"
  install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgbase/"
}
