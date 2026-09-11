# Maintainer: Shahriyar Alam <mdshahriyaralam552@gmail.com>
pkgname=maono
pkgver=0.2.0
pkgrel=1
pkgdesc='Control a Maono PD100W wireless microphone from a terminal UI or the command line'
arch=('x86_64' 'aarch64')
url='https://github.com/shahriyardx/maono'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4bd77d7309794d2c24b70b120450695ae5ecdde39ea09eff8319ca9cddc5dd03')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/maono "$pkgdir/usr/bin/maono"
  install -Dm644 99-maono.rules "$pkgdir/usr/lib/udev/rules.d/99-maono.rules"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
