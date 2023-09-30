# Maintainer: dvb <archlinux at b0rken dot de>

pkgname=mdpls-git
pkgver=0.1.0.6.g3076150
pkgrel=1
pkgdesc='A language server that provides a live HTML preview of your markdown in your browser.'
arch=('i686' 'x86_64')
url='https://github.com/euclio/mdpls'
makedepends=('git' 'cargo')
provides=("mdpls=$pkgver")
conflicts=('mdpls')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  echo "$(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)" | tr '-' '.'
}

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "$pkgname"
  cargo build --release --frozen --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable

  cd "$pkgname"
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname"
  install -D target/release/mdpls -t "$pkgdir/usr/bin/"
}
