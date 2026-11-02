# Maintainer: rotko <hq@rotko.net>
pkgname=peek2
pkgver=0.2.1
pkgrel=1
pkgdesc="Region screen recorder with audio, straight to the clipboard (Rust rewrite of Peek, no GTK)"
arch=('x86_64' 'aarch64')
url="https://github.com/rotkonetworks/peek2"
license=('MIT')
depends=('gcc-libs' 'glibc' 'ffmpeg' 'libpulse')
makedepends=('cargo')
optdepends=(
  'libnotify: notifications after saving'
  'xdg-utils: open clips and the recordings folder'
  'picom: translucent selection overlay (any compositor works)'
  'zenity: ask_save_location file dialog'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/rotkonetworks/peek2/archive/v$pkgver.tar.gz")
sha256sums=('3fefe6c938d3a1ba18af8a59836969aded9cbcd9cd44bb49f3dda6202aae276e')

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
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/peek2 -t "$pkgdir/usr/bin/"
  install -Dm644 data/net.rotko.Peek2.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
