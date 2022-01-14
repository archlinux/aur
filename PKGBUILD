# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=quickwit
pkgver=0.2.0
pkgrel=1
pkgdesc="A fast and cost-efficient distributed search engine for large-scale, immutable data"
arch=('x86_64')
url="https://quickwit.io"
license=('AGPL3')
depends=('gcc-libs')
makedepends=('git' 'rust')
options=('!lto')
_commit='3ab14695dccd348693bc9a0e162b33fd4e6954e0'
source=("$pkgname::git+https://github.com/quickwit-inc/quickwit.git#commit=$_commit")
md5sums=('SKIP')

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
  cargo build --frozen --release
}

check() {
  cd "$pkgname"
  cargo test --frozen -- --skip thread_pool::tests::test_run_cpu_intensive_abort
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/release/quickwit
}
