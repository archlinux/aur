# Maintainer: rahmerh <rahmerh@users.noreply.github.com>

pkgname=sax-git
pkgver=0.3.0
pkgrel=1
pkgdesc="A simple but smart archiving and extraction tool"
arch=('x86_64')
url="https://github.com/rahmerh/sax"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('sax')
conflicts=('sax')
source=('sax::git+https://github.com/rahmerh/sax.git')
sha256sums=('SKIP')

pkgver() {
  cd sax

  local cargo_version
  cargo_version="$(grep -m1 '^version =' Cargo.toml | cut -d '"' -f2)"

  printf '%s.r%s.g%s' "$cargo_version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
