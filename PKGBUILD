# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=rustzx
pkgver=0.15.0
pkgrel=1
pkgdesc='ZX Spectrum emulator written in Rust'
arch=('x86_64')
url='https://github.com/rustzx/rustzx'
license=('MIT')
depends=('gcc-libs' 'alsa-lib')
makedepends=('git' 'rust' 'cmake')
options=('!lto')
_commit='6818e164fae45029bd610f0b3caeb9655e5606c4'
source=("$pkgname::git+$url.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
	cd "$pkgname"

  # download dependencies
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
  install -vDm755 -t "$pkgdir/usr/bin" target/release/{rustzx,vtx}

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
