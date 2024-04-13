# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cute
_pkgname=CuTE
pkgver=0.1.1
pkgrel=1
pkgdesc="TUI HTTP client with API/auth key management and request history/storage"
arch=('x86_64')
url="https://github.com/PThorpe92/CuTE"
license=('GPL3')
depends=('gcc-libs' 'curl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('25a0e9c843d29912b4fe1f8c0a1904b10c0870d84c07752f6efd3977263e2e239dbb7c968ab5d4644bdbdf77582d9ef6e24b0b771b284fbe46f17fb84adc046c')
options=('!lto')

prepare() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
