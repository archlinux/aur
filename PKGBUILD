# Maintainer: Orhun Parmaksız <orhun@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=tdf
pkgver=0.4.3
pkgrel=1
pkgdesc="A TUI-based PDF viewer"
arch=('x86_64')
url="https://github.com/itsjunetime/tdf"
license=('MPL-2.0')
depends=('gcc-libs' 'glib2' 'mupdf' 'fontconfig')
makedepends=('cargo-nightly' 'clang' 'python' 'unzip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8523b8a9a3e5d22cddea6fda5a8b6abf04f6736e919d05e8c6ba6652bc8b0683')

prepare() {
  cd "$pkgname-$pkgver"
  # upstream lockfile is not in sync, c.f. https://github.com/itsjunetime/tdf/issues/98
  cargo update
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
