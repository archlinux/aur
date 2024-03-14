# Maintainer: Obscurely <adrian.obscurely@protonmail.com>
pkgname=falion
pkgver=1.0.0
pkgrel=1
pkgdesc="An open source, programmed in rust, privacy focused tool for scraping programming resources (like stackoverflow) fast, efficient and asynchronous/parallel using the CLI or GUI. "
arch=('x86_64')
url="https://github.com/Obscurely/falion"
license=('GPL3')
makedepends=('git' 'rust' 'cargo' 'binutils')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver-stable.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/falion-$pkgver-stable"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/falion-$pkgver-stable"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

package() {
  cd "$srcdir/falion-$pkgver-stable"
  install -Dm 755 "target/release/falion" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "resources/linux/desktop/falion.desktop"
  for size in 16x16 32x32 64x64 128x128 256x256 512x512; do
		install -Dm0644 "resources/linux/desktop/icons/hicolor/$size/apps/falion.png" \
			"$pkgdir/usr/share/icons/hicolor/$size/apps/falion.png"
	done
}
