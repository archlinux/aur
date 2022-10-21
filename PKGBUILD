# Maintainer: Lars Francke <lars.francke@stackable.tech>

_pkgname=stackablectl
pkgname="${_pkgname}-git"
pkgver=0
pkgrel=1
pkgdesc="Command line tool to interact with a Stackable Data Platform"
arch=('x86_64')
url="https://github.com/stackabletech/stackablectl/"
license=('Apache')
makedepends=('go' 'rust')
source=("$pkgname::git+https://github.com/stackabletech/stackablectl.git")
b2sums=('SKIP')
provides=(${_pkgname})
conflicts=(${_pkgname})

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
  install -vDm755 -t "$pkgdir/usr/bin" target/release/stackablectl
}
