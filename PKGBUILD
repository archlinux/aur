# Maintainer: gcb
pkgname=oo7-server
pkgver=0.5.0
pkgrel=1
pkgdesc="D-Bus Secret Service provider"
arch=('x86_64')
url="https://github.com/linux-credentials/oo7"
license=('MIT')
makedepends=('cargo')
#depends=('gcc-libs' 'glibc')
source=("https://github.com/linux-credentials/oo7/archive/refs/tags/0.5.0.tar.gz")
sha256sums=('4f7f1a7acec1c2cf02719d2bf890313d5364446a6a3dc3984f4199b94f3506ee')

prepare() {
  ln -sf "oo7-$pkgver" "$pkgname"
  cd "$pkgname" || exit
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked
}

build() {
  cd "$pkgname" || exit
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname" || exit
  cargo install --frozen --root "$pkgdir/usr" --path server/ --no-track
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
