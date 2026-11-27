# Maintainer: Kaarel <github.com/kaareloun>
pkgname=lookout
pkgver=0.1.0
pkgrel=1
pkgdesc="A fast, good-looking system monitor with Rosé Pine themes, an htop replacement with a GUI"
arch=('x86_64' 'aarch64')
url="https://github.com/kaareloun/lookout"
license=('MIT')
depends=('gcc-libs' 'glibc' 'libglvnd' 'libxkbcommon' 'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6632dec302f001f6e3f294ad19bf61a037d895af0847292e98c833aa0deed188')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/lookout "$pkgdir/usr/bin/lookout"
  install -Dm644 assets/lookout.desktop "$pkgdir/usr/share/applications/lookout.desktop"
  for s in 32 48 64 128 256 512; do
    install -Dm644 "assets/icons/lookout-$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/lookout.png"
  done
  install -Dm644 assets/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/lookout.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
