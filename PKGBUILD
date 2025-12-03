# Maintainer: Orhun Parmaksız <orhun@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=tdf
pkgver=0.5.0
pkgrel=1
pkgdesc="A TUI-based PDF viewer"
arch=('x86_64')
url="https://github.com/itsjunetime/tdf"
license=('MPL-2.0')
depends=('gcc-libs' 'glib2' 'mupdf' 'fontconfig')
makedepends=('cargo-nightly' 'clang' 'python' 'unzip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f9cdcc89e03efdb002938428905ff6cd9ef7ee9941f7b4fa1f473f9f6c49eb6e')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS+=' -ffat-lto-objects'
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  depends+=(libfontconfig.so)
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
