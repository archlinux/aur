# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=autokernel-git
pkgver=2.0.1.r2.gee75705
pkgrel=1
pkgdesc='A tool for managing your kernel configuration that guarantees semantic correctness'
url='https://github.com/oddlama/autokernel'
license=('MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'sqlite')
makedepends=('git' 'cargo')
source=("$pkgname::git+https://github.com/oddlama/autokernel.git")
sha256sums=('SKIP')
b2sums=('SKIP')

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

pkgver() {
  cd "$pkgname"

  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"

  cargo fetch --locked --target $_target
}

build() {
  cd "$pkgname"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release --features 'index'
}

package() {
  cd "$pkgname"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/autokernel{,-index}

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
