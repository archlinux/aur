# Maintainer: James Beddek <telans@posteo.de>

pkgname=elfshaker-git
_pkgname="${pkgname//-git}"
pkgver=v0.9.0.r83.gd8ec612
pkgrel=1
pkgdesc="A low-footprint, high-performance version control system fine-tuned for binaries"
arch=('x86_64')
license=('Apache')
provides=('elfshaker')
depends=('gcc-libs')
makedepends=('rust')
source=('elfshaker-git::git+https://github.com/elfshaker/elfshaker.git')
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
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
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$_pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$_pkgname" README.md SECURITY.md
  cp -vr docs/* "$pkgdir/usr/share/doc/$_pkgname"
}
