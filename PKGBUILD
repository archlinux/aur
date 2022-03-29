# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=git-grab
pkgver=0.1.2
pkgrel=1
pkgdesc="A tool to clone git repositories to a standard location organised by domain and path"
arch=('x86_64')
url="https://github.com/wezm/git-grab"
license=('MIT' 'Apache')
depends=('git' 'gcc-libs')
makedepends=('rust')
options=('!lto')
_commit='8731d56d336c19f219e534bc4696d3bf11b5fb24'
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"

  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname"

  cargo test --frozen --all-features
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/release/git-grab

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE*
  sed -n '/^Licence/,/^at your option./p' \
    README.md \
    > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
