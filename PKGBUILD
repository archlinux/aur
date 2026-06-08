# Maintainer: rahmerh <rahmerh@users.noreply.github.com>

pkgname=sax-git
pkgver=0.3.0.r22.g9f8e185
pkgrel=1
pkgdesc="A simple but smart archiving and extraction tool (latest Git commit)"
arch=('x86_64')
url="https://github.com/rahmerh/sax"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("sax=$pkgver")
conflicts=('sax')
options=('!lto')
source=('sax::git+https://github.com/rahmerh/sax.git#branch=main')
sha256sums=('SKIP')

pkgver() {
  cd sax

  local cargo_version
  cargo_version="$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml | head -n 1)"

  printf '%s.r%s.g%s' "$cargo_version" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd sax

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd sax

  cargo build --frozen --release
}

check() {
  cd sax

  cargo test --frozen
}

package() {
  cd sax

  install -Dm755 "target/release/sax" "$pkgdir/usr/bin/sax"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
