# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=starlark-rust
_pkgname=starlark
pkgver=0.8.0
pkgrel=1
pkgdesc='Rust implementation of the Starlark language'
arch=('x86_64')
url='https://github.com/facebookexperimental/starlark-rust'
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'rustup')
provides=('starlark')
options=('!lto')
_commit='18031c2c209af7127e6769aa2b583c0c5f140d14'
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  cargo build --frozen --release --workspace
}

check() {
  cd "$pkgname"
  cargo test --frozen --workspace
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/release/starlark

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  cp -vr docs "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
