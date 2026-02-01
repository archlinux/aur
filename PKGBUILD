# Maintainer: limforge

pkgname=noorfetch
pkgver=0.5.8
pkgrel=1
pkgdesc="Minimal and fast system information fetch tool written in Rust"
arch=('x86_64')
url="https://codeberg.org/limforge/noorfetch"
license=('GPL-3.0-or-later')

makedepends=('cargo' 'git')
depends=('gcc-libs' 'glibc')

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked
}

build() {
  cd "$pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname"
  cargo install --frozen --root "$pkgdir/usr" --path . --no-track
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
