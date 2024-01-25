# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=starlark-rust
_pkgname=starlark
pkgver=0.11.0
pkgrel=1
pkgdesc='Rust implementation of the Starlark language'
arch=('x86_64')
url='https://github.com/facebookexperimental/starlark-rust'
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'rustup')
provides=('starlark')
options=('!lto')
source=("https://github.com/facebookexperimental/starlark-rust/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f36c2b120cfee00d1fe2842adfdaafad8871c84d47617d26205b67fd22921d06')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --workspace
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --workspace
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/release/starlark

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  cp -vr docs "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
