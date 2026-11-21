# Maintainer: rahmerh <rahmerh@users.noreply.github.com>

pkgname=sax-git
pkgver=1.0.1.r2.g0fc589f
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

  git describe --long --tags --match 'v[0-9]*.[0-9]*.[0-9]*' --abbrev=7 \
    | sed 's/^v//; s/-\([0-9]*\)-g/.r\1.g/'
}

prepare() {
  cd sax

  bash packaging/set-version.sh "$(git describe --tags --abbrev=0 --match 'v[0-9]*.[0-9]*.[0-9]*' | sed 's/^v//')"
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
