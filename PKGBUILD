# Maintainer: Obscurely <adrian.obscurely@protonmail.com>
pkgname=estash
pkgver=0.6.2
pkgrel=1
pkgdesc="An open source, cross-platform, programmed in rust, encrypted digital vault (store files and text) with the capability to set a path and with the click of a button to copy the contents to that file."
arch=('x86_64')
url="https://github.com/Obscurely/EStash"
license=('GPL3')
makedepends=('git' 'rust' 'cargo' 'binutils' 'libx11' 'libxext' 'libxft' 'libxinerama' 'libxcursor' 'libxrender' 'libxfixes' 'pango' 'cairo' 'libgl' 'mesa')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver-stable.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/EStash-$pkgver-stable"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/EStash-$pkgver-stable"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "$srcdir/EStash-$pkgver-stable"
  cargo test --frozen
}

package() {
  cd "$srcdir/EStash-$pkgver-stable"
  install -Dm 755 "target/release/estash" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "linux/desktop/EStash.desktop"
  for size in 16x16 32x32 64x64 128x128 256x256 512x512; do
		install -Dm0644 "linux/desktop/icons/hicolor/$size/apps/estash.png" \
			"$pkgdir/usr/share/icons/hicolor/$size/apps/estash.png"
	done
}
